import json
import os
from datetime import datetime

def import_products_to_database():
    print('📦 Importing 434 Products to Database Format')
    print('=' * 60)
    
    # Load comprehensive catalog
    with open('comprehensive_product_catalog.json', 'r', encoding='utf-8') as f:
        catalog = json.load(f)
    
    products = catalog['products']
    print(f'📊 Processing {len(products)} products')
    
    # Categorize products automatically
    category_keywords = {
        'Pharmaceuticals': ['tablet', 'capsule', 'syrup', 'injection', 'mg', 'ml'],
        'Medical Supplies': ['syringe', 'needle', 'bandage', 'gauze', 'surgical'],
        'Personal Care': ['shower', 'soap', 'shampoo', 'lotion', 'cream'],
        'Vitamins & Supplements': ['vitamin', 'supplement', 'calcium', 'iron'],
        'Baby Care': ['baby', 'infant', 'diaper', 'formula'],
        'Beauty Products': ['hair', 'skin', 'beauty', 'cosmetic']
    }
    
    # Enhanced products for database
    db_products = []
    
    for product in products:
        name = product['name']
        
        # Auto-categorize
        category = 'General Medicine'
        for cat, keywords in category_keywords.items():
            if any(keyword.lower() in name.lower() for keyword in keywords):
                category = cat
                break
        
        # Determine if prescription required
        prescription_keywords = ['prescription', 'rx', 'antibiotic', 'controlled']
        is_prescription = any(keyword in name.lower() for keyword in prescription_keywords)
        
        db_product = {
            'sku': product['sku'],
            'name': name,
            'description': f'{name} - Available at Kunle Ara Pharmacy',
            'price': product['price'],
            'category': category,
            'is_prescription': is_prescription,
            'brand': name.split()[0] if len(name.split()) > 0 else 'Generic',
            'created_at': datetime.now().isoformat()
        }
        
        db_products.append(db_product)
    
    # Save database-ready format
    db_data = {
        'total_products': len(db_products),
        'categories': list(set(p['category'] for p in db_products)),
        'products': db_products
    }
    
    with open('database/products_for_import.json', 'w', encoding='utf-8') as f:
        json.dump(db_data, f, indent=2, ensure_ascii=False)
    
    # Create SQL INSERT statements
    sql_inserts = []
    sql_inserts.append('-- Insert 434 products into products table')
    sql_inserts.append('')
    
    for i, product in enumerate(db_products):
        sql = f'''INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    '{product['sku']}',
    '{product['name'].replace("'", "''")}',
    '{product['description'].replace("'", "''")}',
    {product['price']},
    '{product['category']}',
    {product['is_prescription']},
    '{product['brand'].replace("'", "''")}'
);'''
        sql_inserts.append(sql)
        
        # Add inventory for all 3 branches
        for branch_id in [1, 2, 3]:
            stock_sql = f'''INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = '{product['sku']}'),
    {branch_id},
    {50 + (i % 100)},  -- Random stock between 50-150
    10
);'''
            sql_inserts.append(stock_sql)
        
        sql_inserts.append('')
    
    # Save SQL file
    with open('database/schema/insert_products.sql', 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_inserts))
    
    # Print summary
    categories = {}
    for product in db_products:
        cat = product['category']
        categories[cat] = categories.get(cat, 0) + 1
    
    print(f'✅ Database import files created!')
    print(f'📊 Product breakdown:')
    for category, count in sorted(categories.items(), key=lambda x: x[1], reverse=True):
        print(f'   - {category}: {count} products')
    
    print(f'\n💾 Files created:')
    print(f'   - database/products_for_import.json')
    print(f'   - database/schema/insert_products.sql')

if __name__ == '__main__':
    import_products_to_database()
