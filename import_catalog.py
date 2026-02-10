# import_comprehensive_catalog.py
import json
import os
from datetime import datetime

def import_comprehensive_catalog():
    print('📦 Importing Comprehensive Product Catalog (434 products)')
    print('=' * 70)
    
    # First, let's find your comprehensive catalog file
    data_dir = 'data'
    
    # Look for files that might contain the 434 products
    possible_files = []
    if os.path.exists(data_dir):
        for filename in os.listdir(data_dir):
            if filename.endswith('.json'):
                file_path = os.path.join(data_dir, filename)
                try:
                    with open(file_path, 'r', encoding='utf-8') as f:
                        data = json.load(f)
                        
                    # Check if it contains products
                    if isinstance(data, dict) and 'products' in data:
                        product_count = len(data['products'])
                    elif isinstance(data, list):
                        product_count = len(data)
                    else:
                        continue
                        
                    possible_files.append({
                        'filename': filename,
                        'path': file_path,
                        'count': product_count
                    })
                    print(f'📄 Found: {filename} with {product_count} products')
                except:
                    continue
    
    # Find the file with 434 products or closest to it
    comprehensive_file = None
    for file_info in possible_files:
        if file_info['count'] >= 400:  # Looking for the comprehensive catalog
            comprehensive_file = file_info
            break
    
    if not comprehensive_file:
        # If no file with 400+ products, take the largest
        if possible_files:
            comprehensive_file = max(possible_files, key=lambda x: x['count'])
    
    if not comprehensive_file:
        print('❌ No product catalog file found')
        return
    
    print(f'🎯 Using: {comprehensive_file["filename"]} ({comprehensive_file["count"]} products)')
    
    # Load the comprehensive catalog
    with open(comprehensive_file['path'], 'r', encoding='utf-8') as f:
        catalog_data = json.load(f)
    
    # Extract products based on file structure
    if isinstance(catalog_data, dict) and 'products' in catalog_data:
        products = catalog_data['products']
    elif isinstance(catalog_data, list):
        products = catalog_data
    else:
        print('❌ Unknown file format')
        return
    
    print(f'✅ Loaded {len(products)} products from catalog')
    
    # Enhance products for database import
    enhanced_products = []
    categories = set()
    branches = ['UCH', 'Yemetu', 'Ring Road']
    
    # Category mapping for better organization
    category_mapping = {
        'ANTIHISTAMINS': 'Antihistamines & Allergy',
        'ANALGESICS': 'Pain Relief & Fever',
        'VITAMINS': 'Vitamins & Supplements', 
        'CREAM': 'Topical Treatments',
        'LOTION': 'Topical Treatments',
        'SURGICAL': 'Medical Supplies',
        'SHOWER GEL': 'Personal Care',
        'HAIR COSTUME': 'Personal Care',
        'DRINKS': 'Health Drinks & Nutrition',
        'SKIN DISINFECTION': 'Antiseptics & Disinfectants'
    }
    
    for i, product in enumerate(products, 1):
        # Handle different product formats
        if isinstance(product, dict):
            name = product.get('name', f'Product {i}')
            price_str = str(product.get('price', '0')).replace('₦', '').replace(',', '').replace('â‚¦', '')
            
            # Clean price
            try:
                price = float(price_str) if price_str else 0.0
            except:
                price = 0.0
            
            # Skip invalid products
            if not name or name in ['0', 'More details...', 'View details'] or price <= 0:
                continue
                
        else:
            # Handle if products are in a different format
            continue
        
        # Determine category
        category = 'General Medicine'
        for key, mapped_category in category_mapping.items():
            if key.lower() in name.lower():
                category = mapped_category
                break
        
        categories.add(category)
        
        # Create comprehensive product record
        enhanced_product = {
            'id': i,
            'sku': f'KAP-{name[:3].upper()}-{str(i).zfill(4)}',
            'name': name,
            'description': f'{name} - High quality pharmaceutical product available at all Kunle Ara Pharmacy branches',
            'price': price,
            'category': category,
            'stock_quantity': 50,  # Default stock per branch
            'in_stock': True,
            'branches': {
                'UCH': {'stock': 50, 'available': True},
                'Yemetu': {'stock': 50, 'available': True}, 
                'Ring Road': {'stock': 50, 'available': True}
            },
            'created_at': datetime.now().isoformat(),
            'updated_at': datetime.now().isoformat()
        }
        
        enhanced_products.append(enhanced_product)
    
    # Create final catalog for import
    final_catalog = {
        'metadata': {
            'pharmacy_name': 'Kunle Ara Pharmacy',
            'total_products': len(enhanced_products),
            'categories': sorted(list(categories)),
            'branches': branches,
            'created_at': datetime.now().isoformat(),
            'version': '1.0',
            'source': 'comprehensive_scraping'
        },
        'products': enhanced_products
    }
    
    # Save for database import
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    
    # Full catalog
    catalog_file = f'database/product_catalog_434_items_{timestamp}.json'
    os.makedirs('database', exist_ok=True)
    with open(catalog_file, 'w', encoding='utf-8') as f:
        json.dump(final_catalog, f, indent=2, ensure_ascii=False)
    
    # SQL insert statements
    sql_file = f'database/insert_products_{timestamp}.sql'
    with open(sql_file, 'w', encoding='utf-8') as f:
        f.write('-- Insert products into Kunle Ara Pharmacy database\n\n')
        
        for product in enhanced_products:
            # Escape single quotes in names and descriptions
            name = product['name'].replace("'", "''")
            description = product['description'].replace("'", "''")
            
            sql = f"INSERT INTO products (sku, name, description, price, category, stock_quantity, in_stock) VALUES ('{product['sku']}', '{name}', '{description}', {product['price']}, '{product['category']}', {product['stock_quantity']}, {product['in_stock']});\n"
            f.write(sql)
    
    # Create CSV for easy viewing
    csv_data = []
    for product in enhanced_products:
        csv_data.append({
            'SKU': product['sku'],
            'Name': product['name'],
            'Category': product['category'],
            'Price': f"₦{product['price']:,.2f}",
            'Stock': product['stock_quantity']
        })
    
    # Summary
    print(f'\n✅ COMPREHENSIVE CATALOG PROCESSED!')
    print(f'📊 Statistics:')
    print(f'   - Total Products: {len(enhanced_products)}')
    print(f'   - Categories: {len(categories)}')
    print(f'   - Average Price: ₦{sum(p["price"] for p in enhanced_products)/len(enhanced_products):,.2f}')
    print(f'   - Price Range: ₦{min(p["price"] for p in enhanced_products):,.2f} - ₦{max(p["price"] for p in enhanced_products):,.2f}')
    
    print(f'\n💾 Files Created:')
    print(f'   - {catalog_file} (Full catalog)')
    print(f'   - {sql_file} (Database insert statements)')
    
    print(f'\n📂 Categories ({len(categories)}):')
    category_counts = {}
    for product in enhanced_products:
        cat = product['category']
        category_counts[cat] = category_counts.get(cat, 0) + 1
    
    for category, count in sorted(category_counts.items(), key=lambda x: x[1], reverse=True):
        print(f'   - {category}: {count} products')
    
    return final_catalog

if __name__ == '__main__':
    import_comprehensive_catalog()
