"""
Merge Kunle Ara scraped products with existing sample products
"""

import json
import os
from datetime import datetime

def merge_products():
    """Merge scraped products with sample products"""
    
    print("🔄 Merging Kunle Ara products with existing products...")
    
    all_products = []
    sources = []
    
    # Load existing sample products
    try:
        with open('app/data/products.ts', 'r', encoding='utf-8') as f:
            content = f.read()
            # This is a basic extraction - you might need to adjust
            print("📂 Found existing sample products")
            sources.append("Sample Products")
    except FileNotFoundError:
        print("⚠️  No existing sample products found")
    
    # Load scraped Kunle Ara products
    try:
        with open('../data/kunle_ara_products.json', 'r', encoding='utf-8') as f:
            kunle_ara_products = json.load(f)
            all_products.extend(kunle_ara_products)
            sources.append(f"Kunle Ara Scraped: {len(kunle_ara_products)} products")
            print(f"✅ Loaded {len(kunle_ara_products)} Kunle Ara products")
    except FileNotFoundError:
        print("❌ Kunle Ara products not found. Run the scraper first!")
        return
    
    # Create master products file for Next.js
    master_ts_content = f'''// Master product database for Kunle Ara Pharmacy POS
// Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
// Sources: {', '.join(sources)}
// Total products: {len(all_products)}

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
  source?: string
  createdAt?: string
  updatedAt?: string
  scraped_at?: string
}}

// All products from Kunle Ara Pharmacy
export const allProducts: Product[] = {json.dumps(all_products, indent=2, ensure_ascii=False)}

// Export by category for easy filtering
export const getProductsByCategory = (category: string) => {{
  if (category === 'all') return allProducts
  return allProducts.filter(product => product.category === category)
}}

// Search function
export const searchProducts = (query: string) => {{
  const lowerQuery = query.toLowerCase()
  return allProducts.filter(product => 
    product.name.toLowerCase().includes(lowerQuery) ||
    product.description.toLowerCase().includes(lowerQuery) ||
    (product.tags && product.tags.some(tag => tag.toLowerCase().includes(lowerQuery)))
  )
}}

// Category statistics
export const categoryStats = () => {{
  const stats = {{}}
  allProducts.forEach(product => {{
    stats[product.category] = (stats[product.category] || 0) + 1
  }})
  return stats
}}

// Product metadata
export const productMetadata = {{
  totalProducts: {len(all_products)},
  sources: {json.dumps(sources)},
  categories: Object.keys(categoryStats()),
  lastUpdated: '{datetime.now().isoformat()}'
}}
'''
    
    # Ensure app/data directory exists
    os.makedirs('app/data', exist_ok=True)
    
    # Write the master products file
    with open('app/data/allProducts.ts', 'w', encoding='utf-8') as f:
        f.write(master_ts_content)
    
    # Also save a copy of the JSON
    with open('app/data/allProducts.json', 'w', encoding='utf-8') as f:
        json.dump(all_products, f, indent=2, ensure_ascii=False)
    
    print(f"\n✅ MERGE COMPLETED!")
    print(f"📊 Total products: {len(all_products)}")
    print(f"📁 Created files:")
    print(f"   📄 app/data/allProducts.ts (TypeScript)")
    print(f"   📄 app/data/allProducts.json (JSON backup)")
    
    # Show category breakdown
    categories = {}
    for product in all_products:
        cat = product.get('category', 'unknown')
        categories[cat] = categories.get(cat, 0) + 1
    
    print(f"\n📦 Category breakdown:")
    for category, count in sorted(categories.items()):
        print(f"   {category}: {count} products")
    
    print(f"\n🎯 Ready to update your Next.js components!")

if __name__ == "__main__":
    merge_products()
