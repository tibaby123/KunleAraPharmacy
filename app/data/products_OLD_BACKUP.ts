import { Product } from '../lib/database'

export const sampleProducts: Product[] = [
  // Prescription Drugs
  {
    id: 'rx-001',
    name: 'Amoxicillin 500mg',
    description: 'Antibiotic for bacterial infections',
    price: 2500,
    category: 'prescription-drugs',
    subcategory: 'Antibiotics',
    brand: 'GSK',
    image: '/images/amoxicillin.jpg',
    inStock: true,
    stockQuantity: 50,
    barcode: '123456789012',
    prescriptionRequired: true,
    manufacturer: 'GlaxoSmithKline',
    activeIngredients: ['Amoxicillin'],
    dosageForm: 'capsule',
    tags: ['antibiotic', 'infection', 'bacterial'],
    createdAt: new Date(),
    updatedAt: new Date()
  },

  // OTC Medications
  {
    id: 'otc-001',
    name: 'Paracetamol 500mg',
    description: 'Pain relief and fever reducer',
    price: 500,
    category: 'otc-medications',
    subcategory: 'Pain Relief',
    brand: 'Emzor',
    image: '/images/paracetamol.jpg',
    inStock: true,
    stockQuantity: 200,
    barcode: '123456789013',
    prescriptionRequired: false,
    manufacturer: 'Emzor Pharmaceuticals',
    activeIngredients: ['Paracetamol'],
    dosageForm: 'tablet',
    tags: ['pain relief', 'fever', 'headache'],
    createdAt: new Date(),
    updatedAt: new Date()
  },

  // Supplements
  {
    id: 'sup-001',
    name: 'Vitamin C 1000mg',
    description: 'Immune system support',
    price: 3500,
    category: 'supplements',
    subcategory: 'Vitamins',
    brand: 'Nature\'s Bounty',
    image: '/images/vitamin-c.jpg',
    inStock: true,
    stockQuantity: 75,
    prescriptionRequired: false,
    activeIngredients: ['Ascorbic Acid'],
    dosageForm: 'tablet',
    tags: ['vitamin', 'immune', 'antioxidant'],
    createdAt: new Date(),
    updatedAt: new Date()
  },

  // Beverages
  {
    id: 'bev-001',
    name: 'Coca Cola 35cl',
    description: 'Classic soft drink',
    price: 200,
    category: 'beverages',
    subcategory: 'Soft Drinks',
    brand: 'Coca Cola',
    image: '/images/coca-cola.jpg',
    inStock: true,
    stockQuantity: 120,
    barcode: '123456789014',
    prescriptionRequired: false,
    tags: ['soft drink', 'cola', 'refreshment'],
    createdAt: new Date(),
    updatedAt: new Date()
  },

  // Snacks
  {
    id: 'snk-001',
    name: 'Digestive Biscuits',
    description: 'Healthy wholemeal biscuits',
    price: 800,
    category: 'snacks',
    subcategory: 'Biscuits',
    brand: 'McVitie\'s',
    image: '/images/digestive.jpg',
    inStock: true,
    stockQuantity: 45,
    prescriptionRequired: false,
    tags: ['biscuit', 'wholemeal', 'healthy snack'],
    createdAt: new Date(),
    updatedAt: new Date()
  },

  // Personal Care
  {
    id: 'pc-001',
    name: 'Dettol Antiseptic 250ml',
    description: 'Antiseptic liquid for wounds',
    price: 1500,
    category: 'personal-care',
    subcategory: 'Antiseptics',
    brand: 'Dettol',
    image: '/images/dettol.jpg',
    inStock: true,
    stockQuantity: 80,
    prescriptionRequired: false,
    tags: ['antiseptic', 'wound care', 'hygiene'],
    createdAt: new Date(),
    updatedAt: new Date()
  },

  // Household
  {
    id: 'hh-001',
    name: 'Hand Sanitizer 100ml',
    description: 'Alcohol-based hand sanitizer',
    price: 600,
    category: 'household',
    subcategory: 'Sanitizers',
    brand: 'Purell',
    image: '/images/sanitizer.jpg',
    inStock: true,
    stockQuantity: 150,
    prescriptionRequired: false,
    tags: ['sanitizer', 'hand hygiene', 'alcohol'],
    createdAt: new Date(),
    updatedAt: new Date()
  }
]
