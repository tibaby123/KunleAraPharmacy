# database_setup.py
import json
import os
from supabase import create_client, Client
from datetime import datetime
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

class DatabaseSetup:
    def __init__(self):
        self.supabase_url = os.getenv('NEXT_PUBLIC_SUPABASE_URL')
        self.supabase_key = os.getenv('SUPABASE_SERVICE_ROLE_KEY')
        
        if not self.supabase_url or not self.supabase_key:
            raise Exception('Missing Supabase configuration')
        
        self.supabase: Client = create_client(self.supabase_url, self.supabase_key)
        
    def setup_branches(self):
        '''Insert the 3 branches'''
        print('🏢 Setting up branches...')
        
        branches = [
            {'name': 'UCH Branch', 'address': 'University College Hospital Area, Ibadan'},
            {'name': 'Yemetu Branch', 'address': 'Yemetu Area, Ibadan'},
            {'name': 'Ring Road Branch', 'address': 'Ring Road Area, Ibadan'}
        ]
        
        try:
            response = self.supabase.table('branches').insert(branches).execute()
            print(f'✅ Inserted {len(branches)} branches')
            return response.data
        except Exception as e:
            print(f'❌ Error inserting branches: {e}')
            return []
    
    def import_products(self):
        '''Import scraped products to database'''
        print('📦 Importing products...')
        
        # Find the latest product catalog
        catalog_files = [f for f in os.listdir('data') if f.startswith('product_catalog_') and f.endswith('.json')]
        if not catalog_files:
            print('❌ No product catalog found')
            return
        
        latest_catalog = sorted(catalog_files)[-1]
        catalog_path = os.path.join('data', latest_catalog)
        
        print(f'📄 Loading from: {latest_catalog}')
        
        with open(catalog_path, 'r', encoding='utf-8') as f:
            catalog = json.load(f)
        
        products = catalog.get('products', [])
        
        # Transform products for database
        db_products = []
        for product in products:
            db_product = {
                'sku': product['sku'],
                'name': product['name'],
                'description': product.get('description', f'{product["name"]} - Available at Kunle Ara Pharmacy'),
                'price': float(product['price']),
                'category': product.get('category', 'General Medicine'),
                'stock_quantity': product.get('stock_quantity', 100),
                'in_stock': True,
                'branch_id': 1  # Default to UCH branch
            }
            db_products.append(db_product)
        
        try:
            # Insert products in batches
            batch_size = 10
            inserted_count = 0
            
            for i in range(0, len(db_products), batch_size):
                batch = db_products[i:i + batch_size]
                response = self.supabase.table('products').insert(batch).execute()
                inserted_count += len(batch)
                print(f'   Inserted batch {i//batch_size + 1}: {len(batch)} products')
            
            print(f'✅ Successfully imported {inserted_count} products')
            
        except Exception as e:
            print(f'❌ Error importing products: {e}')
    
    def setup_sample_staff(self):
        '''Insert sample staff for testing'''
        print('👥 Setting up sample staff...')
        
        staff = [
            {'name': 'John Pharmacist', 'email': 'john@kunlearapharmacy.ng', 'branch_id': 1, 'role': 'pharmacist'},
            {'name': 'Mary Cashier', 'email': 'mary@kunlearapharmacy.ng', 'branch_id': 1, 'role': 'cashier'},
            {'name': 'David Manager', 'email': 'david@kunlearapharmacy.ng', 'branch_id': 1, 'role': 'manager'},
            {'name': 'Sarah Pharmacist', 'email': 'sarah@kunlearapharmacy.ng', 'branch_id': 2, 'role': 'pharmacist'},
            {'name': 'Peter Cashier', 'email': 'peter@kunlearapharmacy.ng', 'branch_id': 2, 'role': 'cashier'},
            {'name': 'Grace Pharmacist', 'email': 'grace@kunlearapharmacy.ng', 'branch_id': 3, 'role': 'pharmacist'}
        ]
        
        try:
            response = self.supabase.table('staff').insert(staff).execute()
            print(f'✅ Inserted {len(staff)} staff members')
        except Exception as e:
            print(f'❌ Error inserting staff: {e}')
    
    def run_full_setup(self):
        '''Run complete database setup'''
        print('🚀 Starting Kunle Ara Pharmacy Database Setup')
        print('=' * 60)
        
        # Setup branches first
        branches = self.setup_branches()
        
        # Import products
        self.import_products()
        
        # Setup staff
        self.setup_sample_staff()
        
        # Verify setup
        try:
            branch_count = self.supabase.table('branches').select('*').execute().count
            product_count = self.supabase.table('products').select('*').execute().count
            staff_count = self.supabase.table('staff').select('*').execute().count
            
            print('\n' + '=' * 60)
            print('✅ DATABASE SETUP COMPLETE!')
            print(f'🏢 Branches: {branch_count}')
            print(f'📦 Products: {product_count}')
            print(f'👥 Staff: {staff_count}')
            print('\n🌐 Your pharmacy database is ready!')
            print(f'🔗 Supabase Dashboard: {self.supabase_url.replace(".supabase.co", "")}/project/{os.getenv("PROJECT_ID")}')
            
        except Exception as e:
            print(f'❌ Error verifying setup: {e}')

if __name__ == '__main__':
    setup = DatabaseSetup()
    setup.run_full_setup()
