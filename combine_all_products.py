"""
Combine all product sources for Kunle Ara Pharmacy ecommerce system
"""
import json
import os
import shutil
from datetime import datetime

def combine_all_product_sources():
    """Combine products from multiple sources"""
    
    all_products = []
    sources_info = []
    
    # Path to scraper data (one level up)
    scraper_data_path = "../scraper/data"
    
    print("🔍 Looking for product sources...")
    
    # 1. Try to load scraped Kunle Ara products
    kunle_ara_file = os.path.join(scraper_data_path, "kunle_ara_products.json")
    if os.path.exists(kunle_ara_file):
        try:
            with open(kunle_ara_file, 'r', encoding='utf-8') as f:
                kunle_ara_products = json.load(f)
                all_products.extend(kunle_ara_products)
                sources_info.append(f"Kunle Ara Website: {len(kunle_ara_products)} products")
                print(f"✅ Loaded {len(kunle_ara_products)} products from Kunle Ara website")
        except Exception as e:
            print(f"⚠️ Error loading Kunle Ara products: {e}")
    else:
        print(f"⚠️ Kunle Ara products not found at {kunle_ara_file}")
    
    # 2. Try to load generated products
    generated_file = os.path.join(scraper_data_path, "generated_products.json")
    if os.path.exists(generated_file):
        try:
            with open(generated_file, 'r', encoding='utf-8') as f:
                generated_products = json.load(f)
                all_products.extend(generated_products)
                sources_info.append(f"Generated Products: {len(generated_products)} products")
                print(f"✅ Loaded {len(generated_products)} generated products")
        except Exception as e:
            print(f"⚠️ Error loading generated products: {e}")
    
    # 3. Load existing sample products if they exist
    sample_file = "app/data/products.ts"
    if os.path.exists(sample_file):
        print("✅ Keeping existing sample products")
        sources_info.append("Sample Products: preserved")
    
    # 4. If no products found, create some basic ones
    if not all_products:
        print("📝 No products found, creating basic fallback...")
        all_products = create_basic_fallback_products()
        sources_info.append(f"Fallback Products: {len(all_products)} products")
    
    return all_products, sources_info

def create_basic_fallback_products():
    """Create basic products as fallback"""
    basic_products = [
        {
            'id': 'basic_001',
            'name': 'Paracetamol 500mg',
            'description': 'Pain relief medication',
            'price': 600,
            'category': 'otc-medications',
            'brand': 'Kunle Ara Pharmacy',
            'inStock': True,
            'stockQuantity': 50,
            'prescriptionRequired': False,
            'image': '/images/paracetamol.jpg',
            'source': 'Basic Fallback'
        },
        {
            'id': 'basic_002', 
            'name': 'Vitamin C Tablets',
            'description': 'Immune system support',
            'price': 2500,
            'category': 'supplements',
            'brand': 'Kunle Ara Pharmacy',
            'inStock': True,
            'stockQuantity': 30,
            'prescriptionRequired': False,
            'image': '/images/vitamin-c.jpg',
            'source': 'Basic Fallback'
        }
    ]
    return basic_products

def save_combined_products(products, sources_info):
    """Save combined products for Next.js"""
    
    # Ensure app/data directory exists
    os.makedirs('app/data', exist_ok=True)
    
    # Create master products file for Next.js
    ts_content = f"""// Master Product Database for Kunle Ara Pharmacy
// Combined from multiple sources
// Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
// Total products: {len(products)}
// Sources: {', '.join(sources_info)}

import {{ Product }} from '../lib/database'

export const allProducts: Product[] = {json.dumps(products, indent=2, ensure_ascii=False)}

// Product metadata
export const productMetadata = {{
  totalProducts: {len(products)},
  sources: {json.dumps(sources_info)},
  generatedAt: "{datetime.now().isoformat()}",
  categories: {json.dumps(list(set(p.get('category', 'unknown') for p in products)))}
}}

// Export by category function
export const getProductsByCategory = (category: string) => {{
  if (category === 'all') return allProducts
  return allProducts.filter(product => product.category === category)
}}

// Export search function  
export const searchProducts = (query: string) => {{
  const lowerQuery = query.toLowerCase()
  return allProducts.filter(product => 
    product.name.toLowerCase().includes(lowerQuery) ||
    product.description.toLowerCase().includes(lowerQuery) ||
    (product.tags && product.tags.some(tag => tag.toLowerCase().includes(lowerQuery)))
  )
}}
"""
    
    # Save TypeScript file
    with open('app/data/allProducts.ts', 'w', encoding='utf-8') as f:
        f.write(ts_content)
    
    # Also save JSON version
    with open('app/data/allProducts.json', 'w', encoding='utf-8') as f:
        json.dump(products, f, indent=2, ensure_ascii=False)
    
    print(f"\n✅ Created master product database:")
    print(f"   📄 app/data/allProducts.ts ({len(products)} products)")
    print(f"   📄 app/data/allProducts.json")

def update_products_page():
    """Update products page to use new data"""
    
    products_page_path = "app/products/page.tsx"
    
    if os.path.exists(products_page_path):
        print(f"\n🔄 Updating {products_page_path}...")
        
        # Read current content
        with open(products_page_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Replace import if needed
        if "from '../data/products'" in content:
            content = content.replace(
                "from '../data/products'",
                "from '../data/allProducts'"
            )
            print("   ✅ Updated import statement")
        
        if "sampleProducts" in content:
            content = content.replace("sampleProducts", "allProducts")
            print("   ✅ Updated product references")
        
        # Write back
        with open(products_page_path, 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f"   ✅ Updated products page")

def update_pos_system():
    """Update POS system to use new data"""
    
    pos_page_path = "app/pos/page.tsx"
    
    if os.path.exists(pos_page_path):
        print(f"\n🔄 Updating POS system...")
        
        with open(pos_page_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Update imports
        if "from '../data/products'" in content:
            content = content.replace(
                "from '../data/products'",
                "from '../data/allProducts'"
            )
        
        if "sampleProducts" in content:
            content = content.replace("sampleProducts", "allProducts")
        
        with open(pos_page_path, 'w', encoding='utf-8') as f:
            f.write(content)
        
        print("   ✅ Updated POS system")

def main():
    """Main function to combine all products"""
    print("🏥 KUNLE ARA PHARMACY - PRODUCT INTEGRATION")
    print("=" * 50)
    
    try:
        # Combine all product sources
        products, sources_info = combine_all_product_sources()
        
        if products:
            # Save combined products
            save_combined_products(products, sources_info)
            
            # Update existing pages
            update_products_page()
            update_pos_system()
            
            # Show summary
            categories = {}
            for product in products:
                cat = product.get('category', 'unknown')
                categories[cat] = categories.get(cat, 0) + 1
            
            print(f"\n🎉 INTEGRATION COMPLETE!")
            print(f"📊 Total Products: {len(products)}")
            print(f"📦 Categories: {len(categories)}")
            
            print(f"\n📋 Product Sources:")
            for source in sources_info:
                print(f"   ✅ {source}")
            
            print(f"\n📦 Category Breakdown:")
            for cat, count in sorted(categories.items()):
                print(f"   {cat}: {count} products")
            
            print(f"\n🎯 Your Kunle Ara Pharmacy system is now updated!")
            print(f"🚀 Ready to run: npm run dev")
            
        else:
            print("❌ No products found to integrate")
    
    except Exception as e:
        print(f"❌ Integration failed: {e}")

if __name__ == "__main__":
    main()
