// Master Product Database - Kunle Ara Pharmacy
// Complete catalog: 594 products, ₦3,293,959 total value
// Generated from complete website scraping

import { completeKunleAraProducts } from './complete_kunle_ara_products'

export interface Product {
  id: string
  name: string
  description: string
  price: number
  category: string
  subcategory?: string
  brand: string
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
  scraped_at: string
}

// ✅ PERMANENT PRODUCT DATABASE - 594 Products
export const allProducts: Product[] = completeKunleAraProducts

// Category information
export const categories = [
  { id: 'prescription-drugs', name: 'Prescription Drugs', icon: '💊', count: 134 },
  { id: 'otc-medications', name: 'Over-the-Counter', icon: '🏥', count: 302 },
  { id: 'supplements', name: 'Health Supplements', icon: '💪', count: 22 },
  { id: 'beverages', name: 'Beverages & Drinks', icon: '🥤', count: 2 },
  { id: 'snacks', name: 'Snacks & Confectionery', icon: '🍿', count: 11 },
  { id: 'personal-care', name: 'Personal Care', icon: '🧴', count: 43 },
  { id: 'household', name: 'Household Items', icon: '🏠', count: 70 },
  { id: 'baby-care', name: 'Baby Care', icon: '👶', count: 5 },
  { id: 'herbal-natural', name: 'Herbal & Natural', icon: '🌿', count: 5 }
]

// Utility functions
export const getProductsByCategory = (categoryId: string) => 
  allProducts.filter(product => product.category === categoryId)

export const searchProducts = (query: string) =>
  allProducts.filter(product => 
    product.name.toLowerCase().includes(query.toLowerCase()) ||
    product.description.toLowerCase().includes(query.toLowerCase())
  )

export const getProductStats = () => ({
  totalProducts: 594,
  totalValue: 3293959,
  categoryCounts: {
    'prescription-drugs': 134,
    'otc-medications': 302,
    'supplements': 22,
    'beverages': 2,
    'snacks': 11,
    'personal-care': 43,
    'household': 70,
    'baby-care': 5,
    'herbal-natural': 5
  }
})
