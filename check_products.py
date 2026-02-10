import json
import os
from datetime import datetime
import csv

def find_latest_products():
    '''Find the file with your 358 products'''
    data_dir = 'data'
    
    # Check for CSV files
    csv_files = [f for f in os.listdir(data_dir) if f.endswith('.csv')]
    json_files = [f for f in os.listdir(data_dir) if f.endswith('.json')]
    
    print('📁 Found data files:')
    for f in csv_files:
        file_path = os.path.join(data_dir, f)
        if f.endswith('.csv'):
            with open(file_path, 'r', encoding='utf-8') as file:
                reader = csv.reader(file)
                row_count = sum(1 for row in reader) - 1  # Subtract header
                print(f'   - {f}: {row_count} records')
    
    for f in json_files:
        file_path = os.path.join(data_dir, f)
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                data = json.load(file)
                if isinstance(data, list):
                    print(f'   - {f}: {len(data)} records')
                elif isinstance(data, dict) and 'products' in data:
                    print(f'   - {f}: {len(data["products"])} records')
                elif isinstance(data, dict):
                    print(f'   - {f}: {len(data)} records')
        except:
            print(f'   - {f}: Could not read')

def create_catalog_from_358_products():
    '''Create proper catalog from your 358 products'''
    
    print('📦 Creating Catalog from Your 358 Products')
    print('=' * 60)
    
    # You tell me which file has your 358 products!
    # For now, let's check what we have
    find_latest_products()
    
    print('\n💡 Please tell me which file contains your 358 products!')

if __name__ == '__main__':
    create_catalog_from_358_products()
