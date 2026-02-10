import pandas as pd
import json
import os
from datetime import datetime

def consolidate_all_products():
    """Consolidate all product sources into one master file"""
    
    all_products = []
    sources = []
    
    # File paths to check
    product_files = [
        'app/data/products.ts',
        'app/data/sampleProducts.ts', 
        'app/data/kunle_ara_products.json',
        'data/kunle_ara_products.json',
        'data/generated_products.json',
        'data/scraped_products.json'
    ]
    
    print("🔍 Searching for product files...")
    
    # Load from JSON files
    json_files = [
        'data/kunle_ara_products.json',
        'data/generated_products.json', 
        'data/scraped_products.json'
    ]
    
    for file_path in json_files:
        if os.path.exists(file_path):
            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                    if isinstance(data, list):
                        all_products.extend(data)
                        sources.append(f"{file_path}: {len(data)} products")
                        print(f"✅ Loaded {len(data)} products from {file_path}")
                    elif isinstance(data, dict) and 'products' in data:
                        all_products.extend(data['products'])
                        sources.append(f"{file_path}: {len(data['products'])} products")
                        print(f"✅ Loaded {len(data['products'])} products from {file_path}")
            except Exception as e:
                print(f"❌ Error loading {file_path}: {e}")
    
    # Load sample products from TypeScript files
    sample_products = [
        {
            'id': 'sample_001', 'name': 'Amoxicillin 500mg', 'price': 2500, 
            'category': 'prescription-drugs', 'description': 'Antibiotic medication'
        },
        {
            'id': 'sample_002', 'name': 'Paracetamol 500mg', 'price': 600, 
            'category': 'otc-medications', 'description': 'Pain relief medication'
        },
        {
            'id': 'sample_003', 'name': 'Vitamin C 1000mg', 'price': 2500, 
            'category': 'supplements', 'description': 'Immune system support'
        },
        {
            'id': 'sample_004', 'name': 'Coca Cola 35cl', 'price': 200, 
            'category': 'beverages', 'description': 'Classic soft drink'
        },
        {
            'id': 'sample_005', 'name': 'Digestive Biscuits', 'price': 800, 
            'category': 'snacks', 'description': 'Healthy wholemeal biscuits'
        }
    ]
    
    # Add sample products if no products found
    if not all_products:
        all_products = sample_products
        sources.append("Fallback samples: 5 products")
    
    print(f"\n📊 CONSOLIDATION SUMMARY:")
    print(f"Total raw products collected: {len(all_products)}")
    print("Sources:")
    for source in sources:
        print(f"  - {source}")
    
    # Remove duplicates based on name
    unique_products = []
    seen_names = set()
    
    for product in all_products:
        name_key = product.get('name', '').lower().strip()
        if name_key and name_key not in seen_names:
            # Standardize product structure
            standardized_product = standardize_product(product)
            unique_products.append(standardized_product)
            seen_names.add(name_key)
    
    print(f"✅ After deduplication: {len(unique_products)} unique products")
    
    # Categorize and validate
    validated_products = []
    category_counts = {}
    
    for product in unique_products:
        # Validate category
        valid_category = validate_category(product.get('category', ''))
        product['category'] = valid_category
        
        category_counts[valid_category] = category_counts.get(valid_category, 0) + 1
        validated_products.append(product)
    
    print(f"\n📦 CATEGORY BREAKDOWN:")
    for category, count in sorted(category_counts.items()):
        print(f"  {category}: {count} products")
    
    return validated_products, category_counts

def standardize_product(product):
    """Standardize product structure"""
    return {
        'id': product.get('id', f"prod_{hash(product.get('name', ''))%10000:04d}"),
        'name': product.get('name', '').strip(),
        'description': product.get('description', f"Quality {product.get('name', 'product')} from Kunle Ara Pharmacy"),
        'price': float(product.get('price', 0)),
        'category': product.get('category', 'otc-medications'),
        'subcategory': product.get('subcategory', 'General'),
        'brand': product.get('brand', 'Kunle Ara Pharmacy'),
        'image': product.get('image', '/images/default-product.jpg'),
        'inStock': bool(product.get('inStock', True)),
        'stockQuantity': int(product.get('stockQuantity', 50)),
        'barcode': product.get('barcode', ''),
        'prescriptionRequired': bool(product.get('prescriptionRequired', False)),
        'manufacturer': product.get('manufacturer', 'Various'),
        'activeIngredients': product.get('activeIngredients', []),
        'dosageForm': product.get('dosageForm', 'other'),
        'tags': product.get('tags', []),
        'source': product.get('source', 'Consolidated'),
        'createdAt': product.get('createdAt', datetime.now().isoformat()),
        'updatedAt': datetime.now().isoformat()
    }

def validate_category(category):
    """Validate and fix category names"""
    valid_categories = {
        'prescription-drugs', 'otc-medications', 'supplements', 
        'beverages', 'snacks', 'personal-care', 'household', 
        'baby-care', 'herbal-natural', 'fitness-wellness'
    }
    
    if category in valid_categories:
        return category
    
    # Category mapping for common variations
    category_mapping = {
        'prescription': 'prescription-drugs',
        'otc': 'otc-medications',
        'over-the-counter': 'otc-medications',
        'vitamin': 'supplements',
        'supplement': 'supplements',
        'drink': 'beverages',
        'beverage': 'beverages',
        'food': 'snacks',
        'snack': 'snacks',
        'care': 'personal-care',
        'hygiene': 'personal-care',
        'baby': 'baby-care',
        'infant': 'baby-care',
        'natural': 'herbal-natural',
        'herbal': 'herbal-natural',
        'fitness': 'fitness-wellness',
        'protein': 'fitness-wellness'
    }
    
    for key, mapped_category in category_mapping.items():
        if key in category.lower():
            return mapped_category
    
    return 'otc-medications'  # Default fallback

def save_master_products(products, category_counts):
    """Save consolidated products"""
    
    # Ensure directories exist
    os.makedirs('app/data', exist_ok=True)
    os.makedirs('data', exist_ok=True)
    
    # Save as JSON
    with open('app/data/master_products.json', 'w', encoding='utf-8') as f:
        json.dump(products, f, indent=2, ensure_ascii=False)
    
    # Save as TypeScript for Next.js
    ts_content = f'''// Master Products Database - Consolidated and Deduplicated
// Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
// Total products: {len(products)}
// Categories: {len(category_counts)}

export interface Product {{
  id: string
  name: string
  description: string
  price: number
  category: string
  subcategory?: string
  brand?: string
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
  createdAt: string
  updatedAt: string
}}

export const masterProducts: Product[] = {json.dumps(products, indent=2, ensure_ascii=False)}

export const categoryStats = {json.dumps(category_counts, indent=2)}

export const productMetadata = {{
  totalProducts: {len(products)},
  totalCategories: {len(category_counts)},
  lastUpdated: "{datetime.now().isoformat()}",
  sources: "Consolidated from multiple sources"
}}
'''
    
    with open('app/data/master_products.ts', 'w', encoding='utf-8') as f:
        f.write(ts_content)
    
    # Save as CSV
    df = pd.DataFrame(products)
    df.to_csv('app/data/master_products.csv', index=False)
    df.to_csv('data/master_products.csv', index=False)  # Backup
    
    print(f"\n📁 FILES SAVED:")
    print(f"  📄 app/data/master_products.json ({len(products)} products)")
    print(f"  📄 app/data/master_products.ts (TypeScript)")
    print(f"  📄 app/data/master_products.csv (Excel compatible)")

def main():
    print("🔄 KUNLE ARA PHARMACY - PRODUCT CONSOLIDATION")
    print("=" * 60)
    
    try:
        # Consolidate all products
        products, category_counts = consolidate_all_products()
        
        if products:
            # Save master database
            save_master_products(products, category_counts)
            
            print(f"\n✅ CONSOLIDATION COMPLETE!")
            print(f"🎯 Ready to update Next.js application")
            print(f"📊 {len(products)} unique products across {len(category_counts)} categories")
        else:
            print("❌ No products found to consolidate")
    
    except Exception as e:
        print(f"❌ Error during consolidation: {e}")

if __name__ == "__main__":
    main()
