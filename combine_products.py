import json
import os
from datetime import datetime

def combine_product_files():
    print('🔄 Combining Product Files for Comprehensive Catalog')
    print('=' * 60)
    
    # File paths (go up one directory to data folder)
    data_dir = '../data'
    file1 = os.path.join(data_dir, 'complete_kunle_ara_products.json')
    file2 = os.path.join(data_dir, 'kunle_ara_products.json')
    
    all_products = []
    seen_products = set()  # Track unique products
    
    # Load first file (358 products)
    try:
        with open(file1, 'r', encoding='utf-8') as f:
            data1 = json.load(f)
            if isinstance(data1, dict) and 'products' in data1:
                products1 = data1['products']
            else:
                products1 = data1
            
        print(f'📄 Loaded {len(products1)} products from complete_kunle_ara_products.json')
        
        for product in products1:
            # Create unique key for deduplication
            key = f"{product.get('name', '')}{product.get('price', '')}"
            if key not in seen_products:
                seen_products.add(key)
                all_products.append(product)
                
    except Exception as e:
        print(f'❌ Error loading complete_kunle_ara_products.json: {e}')
    
    # Load second file (76 products)
    try:
        with open(file2, 'r', encoding='utf-8') as f:
            data2 = json.load(f)
            if isinstance(data2, dict) and 'products' in data2:
                products2 = data2['products']
            else:
                products2 = data2
            
        print(f'📄 Loaded {len(products2)} products from kunle_ara_products.json')
        
        for product in products2:
            # Create unique key for deduplication
            key = f"{product.get('name', '')}{product.get('price', '')}"
            if key not in seen_products:
                seen_products.add(key)
                all_products.append(product)
                
    except Exception as e:
        print(f'❌ Error loading kunle_ara_products.json: {e}')
    
    print(f'📊 Combined total: {len(all_products)} unique products')
    
    # Enhance products for e-commerce
    enhanced_products = []
    categories = set()
    
    # Category mapping
    category_mapping = {
        'ANTIHISTAMINS': 'Antihistamines',
        'ANALGESICS': 'Pain Relief',
        'VITAMINS': 'Vitamins & Supplements', 
        'CREAM': 'Topical Treatments',
        'LOTION': 'Topical Treatments',
        'OINTMENT': 'Topical Treatments',
        'SURGICAL': 'Medical Supplies',
        'SHOWER GEL': 'Personal Care',
        'HAIR COSTUME': 'Personal Care',
        'DRINKS': 'Health Drinks',
        'SKIN DISINFECTION': 'Antiseptics',
        'ANTIBIOTICS': 'Antibiotics',
        'TABLETS': 'Oral Medications',
        'CAPSULES': 'Oral Medications',
        'SYRUP': 'Liquid Medications',
        'INJECTION': 'Injectables',
        'BANDAGE': 'Medical Supplies',
        'THERMOMETER': 'Medical Devices'
    }
    
    for i, product in enumerate(all_products, 1):
        # Clean product name and price
        name = str(product.get('name', f'Product {i}')).strip()
        price_str = str(product.get('price', '0')).replace('₦', '').replace(',', '').replace('â‚¦', '')
        
        # Skip invalid products
        if name in ['0', 'More details...', 'View details', 'Add to cart', ''] or len(name) < 2:
            continue
            
        try:
            price_numeric = float(price_str) if price_str else 0.0
        except:
            price_numeric = 0.0
            
        if price_numeric <= 0:
            continue
        
        # Determine category
        category = 'General Medicine'  # Default
        for key, mapped_category in category_mapping.items():
            if key.lower() in name.upper():
                category = mapped_category
                break
        
        categories.add(category)
        
        # Create enhanced product
        enhanced_product = {
            'id': len(enhanced_products) + 1,
            'name': name,
            'price': round(price_numeric, 2),
            'price_display': f'₦{price_numeric:,.2f}',
            'category': category,
            'sku': f'KAP-{name[:3].upper()}-{str(len(enhanced_products) + 1).zfill(4)}',
            'description': f'{name} - High quality pharmaceutical product available at Kunle Ara Pharmacy',
            'in_stock': True,
            'stock_quantity': 50,  # Default stock
            'branch_availability': {
                'UCH': True,
                'Yemetu': True,
                'Ring_Road': True
            },
            'image_url': '/images/products/placeholder.jpg',
            'prescription_required': category in ['Antibiotics', 'Injectables'],
            'created_at': datetime.now().isoformat(),
            'updated_at': datetime.now().isoformat()
        }
        
        enhanced_products.append(enhanced_product)
    
    # Create comprehensive catalog
    catalog = {
        'metadata': {
            'pharmacy_name': 'Kunle Ara Pharmacy',
            'total_products': len(enhanced_products),
            'categories': sorted(list(categories)),
            'branches': ['UCH', 'Yemetu', 'Ring Road'],
            'currency': 'NGN',
            'created_at': datetime.now().isoformat(),
            'version': '1.0',
            'source_files': ['complete_kunle_ara_products.json', 'kunle_ara_products.json']
        },
        'products': enhanced_products
    }
    
    # Save comprehensive catalog
    output_file = 'comprehensive_product_catalog.json'
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(catalog, f, indent=2, ensure_ascii=False)
    
    # Create simplified version for frontend
    simple_products = []
    for product in enhanced_products:
        simple_products.append({
            'id': product['id'],
            'name': product['name'],
            'price': product['price'],
            'category': product['category'],
            'sku': product['sku'],
            'in_stock': product['in_stock'],
            'image_url': product['image_url']
        })
    
    simple_file = 'products_for_frontend.json'
    with open(simple_file, 'w', encoding='utf-8') as f:
        json.dump(simple_products, f, indent=2, ensure_ascii=False)
    
    # Print comprehensive summary
    print(f'\n✅ COMPREHENSIVE CATALOG CREATED!')
    print(f'📊 Final product count: {len(enhanced_products)}')
    print(f'📂 Categories: {len(categories)}')
    print(f'💾 Files saved:')
    print(f'   - {output_file} (Complete catalog)')
    print(f'   - {simple_file} (Frontend ready)')
    
    print(f'\n📂 Product Categories:')
    category_counts = {}
    for product in enhanced_products:
        cat = product['category']
        category_counts[cat] = category_counts.get(cat, 0) + 1
    
    for category in sorted(category_counts.keys()):
        count = category_counts[category]
        print(f'   - {category}: {count} products')
    
    print(f'\n💰 Price Range:')
    prices = [p['price'] for p in enhanced_products if p['price'] > 0]
    if prices:
        print(f'   - Minimum: ₦{min(prices):,.2f}')
        print(f'   - Maximum: ₦{max(prices):,.2f}')
        print(f'   - Average: ₦{sum(prices)/len(prices):,.2f}')
    
    print(f'\n📦 Sample Products:')
    for product in enhanced_products[:10]:
        print(f'   - {product["sku"]}: {product["name"]} - {product["price_display"]}')
    
    return catalog

if __name__ == '__main__':
    combine_product_files()
