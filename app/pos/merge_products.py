Product Merger Script for Kunle Ara Pharmacy
Combines multiple product sources into one comprehensive database
"""

import json
import pandas as pd
from datetime import datetime
import os
import re

def load_json_products(filepath):
    """Load products from JSON file"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            data = json.load(f)
            
        # Handle different JSON structures
        if isinstance(data, list):
            products = data
        elif isinstance(data, dict):
            # Check for common keys that might contain products
            if 'products' in data:
                products = data['products']
            elif 'kunleAraProducts' in data:
                products = data['kunleAraProducts']
            elif 'items' in data:
                products = data['items']
            else:
                # If it's a dict but no clear product array, treat as single product
                products = [data]
        else:
            products = []
            
        print(f"📥 Loaded {len(products)} products from {filepath}")
        return products
        
    except Exception as e:
        print(f"❌ Error loading {filepath}: {e}")
        return []

def load_csv_products(filepath):
    """Load products from CSV file"""
    try:
        df = pd.read_csv(filepath)
        products = df.to_dict('records')
        
        # Clean up the products
        for product in products:
            # Convert NaN to None or default values
            for key, value in product.items():
                if pd.isna(value):
                    if key == 'price':
                        product[key] = 0
                    elif key in ['inStock', 'prescriptionRequired']:
                        product[key] = False
                    elif key == 'stockQuantity':
                        product[key] = 0
                    else:
                        product[key] = ""
        
        print(f"📥 Loaded {len(products)} products from CSV: {filepath}")
        return products
        
    except Exception as e:
        print(f"❌ Error loading CSV {filepath}: {e}")
        return []

def normalize_product(product, source_file):
    """Normalize product structure to standard format"""
    
    # Ensure all required fields exist
    normalized = {
        'id': product.get('id', f"merged_{int(datetime.now().timestamp())}{hash(str(product))%1000:03d}"),
        'name': str(product.get('name', '')).strip(),
        'description': str(product.get('description', '')).strip(),
        'price': float(product.get('price', 0)) if product.get('price') else 0,
        'category': str(product.get('category', 'otc-medications')).strip(),
        'subcategory': str(product.get('subcategory', '')).strip(),
        'brand': str(product.get('brand', 'Kunle Ara Pharmacy')).strip(),
        'image': str(product.get('image', '/images/default-product.jpg')).strip(),
        'inStock': bool(product.get('inStock', True)),
        'stockQuantity': int(product.get('stockQuantity', 50)) if product.get('stockQuantity') else 50,
        'barcode': str(product.get('barcode', '')).strip(),
        'prescriptionRequired': bool(product.get('prescriptionRequired', False)),
        'manufacturer': str(product.get('manufacturer', 'Various')).strip(),
        'activeIngredients': product.get('activeIngredients', []) if isinstance(product.get('activeIngredients'), list) else [],
        'dosageForm': str(product.get('dosageForm', 'other')).strip(),
        'tags': product.get('tags', []) if isinstance(product.get('tags'), list) else [str(product.get('category', 'general'))],
        'source': str(product.get('source', source_file)).strip(),
        'scraped_at': product.get('scraped_at', datetime.now().isoformat())
    }
    
    # Clean up empty strings
    if not normalized['name']:
        return None  # Skip products without names
        
    # Ensure category is valid
    valid_categories = [
        'prescription-drugs', 'otc-medications', 'supplements', 'beverages',
        'snacks', 'personal-care', 'household', 'baby-care', 
        'herbal-natural', 'fitness-wellness'
    ]
    
    if normalized['category'] not in valid_categories:
        normalized['category'] = 'otc-medications'  # Default fallback
    
    return normalized

def remove_duplicates(products):
    """Remove duplicate products based on name similarity"""
    unique_products = []
    seen_names = set()
    
    for product in products:
        # Create a normalized name for comparison
        normalized_name = re.sub(r'[^\w\s]', '', product['name']).lower().strip()
        normalized_name = ' '.join(normalized_name.split())  # Remove extra spaces
        
        # Skip if we've seen this name before (case-insensitive)
        if normalized_name in seen_names:
            print(f"🔄 Skipping duplicate: {product['name']}")
            continue
            
        seen_names.add(normalized_name)
        unique_products.append(product)
    
    print(f"🧹 Removed {len(products) - len(unique_products)} duplicates")
    return unique_products

def merge_all_products():
    """Merge all product files into one comprehensive database"""
    
    print("🔄 KUNLE ARA PHARMACY - PRODUCT MERGER")
    print("="*50)
    
    all_products = []
    file_sources = []
    
    # List of files to check and merge
    files_to_check = [
        'data/kunle_ara_products.json',
        'data/kunle_ara_products_from_csv_20260108_154057.json',
        'data/kunle_ara_products_from_csv_20260108_154057.ts',
        'data/kunle_ara_products_summary_20260108_154057.csv',
        'data/generated_products.json',  # If exists from earlier
        'data/scraped_products.json'     # If exists from web scraping
    ]
    
    # Load from all available files
    for filepath in files_to_check:
        if os.path.exists(filepath):
            print(f"\n📁 Processing: {filepath}")
            
            if filepath.endswith('.json'):
                products = load_json_products(filepath)
            elif filepath.endswith('.csv'):
                products = load_csv_products(filepath)
            elif filepath.endswith('.ts'):
                # Handle TypeScript files (extract JSON from them)
                try:
                    with open(filepath, 'r', encoding='utf-8') as f:
                        content = f.read()
                        
                    # Find JSON data in TypeScript file
                    json_match = re.search(r'= ($$.*$$)', content, re.DOTALL)
                    if json_match:
                        json_str = json_match.group(1)
                        products = json.loads(json_str)
                        print(f"📥 Extracted {len(products)} products from TypeScript file")
                    else:
                        print(f"⚠️ No products found in TypeScript file")
                        products = []
                except Exception as e:
                    print(f"❌ Error processing TypeScript file: {e}")
                    products = []
            else:
                products = []
            
            # Normalize and add to main list
            for product in products:
                normalized = normalize_product(product, os.path.basename(filepath))
                if normalized:  # Only add valid products
                    all_products.append(normalized)
            
            if products:
                file_sources.append(f"{os.path.basename(filepath)}: {len(products)} products")
        else:
            print(f"⚠️ File not found: {filepath}")
    
    print(f"\n📊 MERGE SUMMARY:")
    print(f"Total products before deduplication: {len(all_products)}")
    
    # Remove duplicates
    unique_products = remove_duplicates(all_products)
    
    print(f"Final unique products: {len(unique_products)}")
    print(f"Sources merged: {len(file_sources)}")
    
    # Show category breakdown
    categories = {}
    for product in unique_products:
        cat = product['category']
        categories[cat] = categories.get(cat, 0) + 1
    
    print(f"\n📦 CATEGORY BREAKDOWN:")
    category_icons = {
        'prescription-drugs': '💊',
        'otc-medications': '🏥',
        'supplements': '💪',
        'beverages': '🥤',
        'snacks': '🍿',
        'personal-care': '🧴',
        'household': '🏠',
        'baby-care': '👶',
        'herbal-natural': '🌿',
        'fitness-wellness': '🏃'
    }
    
    for category, count in sorted(categories.items()):
        icon = category_icons.get(category, '📦')
        category_name = category.replace('-', ' ').title()
        print(f"   {icon} {category_name}: {count} products")
    
    return unique_products, file_sources

def save_merged_products(products, sources):
    """Save the merged product database"""
    
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    
    # Create backup of existing file if it exists
    if os.path.exists('data/kunle_ara_products.json'):
        backup_name = f'data/kunle_ara_products_backup_{timestamp}.json'
        os.rename('data/kunle_ara_products.json', backup_name)
        print(f"📁 Backup created: {backup_name}")
    
    # Save merged products as JSON
    with open('data/kunle_ara_products.json', 'w', encoding='utf-8') as f:
        json.dump(products, f, indent=2, ensure_ascii=False)
    
    # Save as TypeScript for Next.js
    ts_content = f"""// Merged Kunle Ara Pharmacy Products
// Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
// Total products: {len(products)}
// Sources: {len(sources)} files merged

export interface KunleAraProduct {{
  id: string
  name: string
  description: string
  price: number
  category: string
  subcategory?: string
  brand: string
  image: string
  inStock: boolean
  stockQuantity: number
  barcode?: string
  prescriptionRequired: boolean
  manufacturer?: string
  activeIngredients?: string[]
  dosageForm?: string
  tags: string[]
  source: string
  scraped_at: string
}}

export const kunleAraProducts: KunleAraProduct[] = {json.dumps(products, indent=2, ensure_ascii=False)}

// Merge metadata
export const mergeMetadata = {{
  totalProducts: {len(products)},
  mergedAt: "{datetime.now().isoformat()}",
  sources: {json.dumps(sources, indent=2)},
  categories: {json.dumps(dict(Counter(p['category'] for p in products)), indent=2)}
}}
"""
    
    with open('data/kunle_ara_products.ts', 'w', encoding='utf-8') as f:
        f.write(ts_content)
    
    # Save as CSV
    df = pd.DataFrame(products)
    df.to_csv('data/kunle_ara_products.csv', index=False)
    
    # Create a summary report
    with open(f'data/merge_report_{timestamp}.txt', 'w', encoding='utf-8') as f:
        f.write("KUNLE ARA PHARMACY - PRODUCT MERGE REPORT\n")
        f.write("="*50 + "\n\n")
        f.write(f"Merge completed: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write(f"Total products: {len(products)}\n")
        f.write(f"Sources merged: {len(sources)}\n\n")
        f.write("Sources:\n")
        for source in sources:
            f.write(f"  - {source}\n")
        f.write(f"\nCategories:\n")
        categories = {}
        for product in products:
            cat = product['category']
            categories[cat] = categories.get(cat, 0) + 1
        for cat, count in sorted(categories.items()):
            f.write(f"  - {cat}: {count} products\n")
    
    print(f"\n✅ MERGE COMPLETED!")
    print(f"📁 Files saved:")
    print(f"   📄 data/kunle_ara_products.json ({len(products)} products)")
    print(f"   📄 data/kunle_ara_products.ts (Next.js ready)")
    print(f"   📄 data/kunle_ara_products.csv (Excel compatible)")
    print(f"   📄 data/merge_report_{timestamp}.txt (Merge details)")

def main():
    """Main merger function"""
    try:
        from collections import Counter
        
        # Merge all products
        merged_products, sources = merge_all_products()
        
        if merged_products:
            # Save merged database
            save_merged_products(merged_products, sources)
            
            print(f"\n🎉 SUCCESS! Your Kunle Ara Pharmacy now has {len(merged_products)} products!")
            print(f"🚀 Ready to integrate with your POS system!")
            
        else:
            print("❌ No products found to merge")
            
    except Exception as e:
        print(f"❌ Merge failed: {e}")

if __name__ == "__main__":
    main()
