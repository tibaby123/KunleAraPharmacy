import json

# Load and count records
with open('data/kunle_ara_products_from_csv_20260108_154057.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Check if it's a list or dict with products
if isinstance(data, list):
    count = len(data)
    print(f"📊 Total records: {count}")
elif isinstance(data, dict) and 'products' in data:
    count = len(data['products'])
    print(f"📊 Total records: {count}")
elif isinstance(data, dict):
    count = len(data)
    print(f"📊 Total records: {count}")
else:
    print("❌ Unknown data format")

# Show first few records for verification
if isinstance(data, list) and len(data) > 0:
    print(f"\n📝 Sample record:")
    print(f"   Name: {data[0].get('name', 'N/A')}")
    print(f"   Price: {data[0].get('price', 'N/A')}")
    print(f"   Category: {data[0].get('category', 'N/A')}")
