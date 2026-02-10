// Final Products Database for Kunle Ara Pharmacy POS
// Combines all sources for comprehensive catalog

import { kunleAraProducts } from './kunle_ara_products'
// Uncomment if you want to use the complete dataset
// import { completeKunleAraProducts } from './complete_kunle_ara_products'

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
  source?: string
  scraped_at?: string
  createdAt?: Date
  updatedAt?: Date
}

// Use the most comprehensive dataset
export const allProducts: Product[] = kunleAraProducts.map(product => ({
  ...product,
  createdAt: new Date(),
  updatedAt: new Date()
}))

// Category information
export const categories = {
  'prescription-drugs': { name: 'Prescription Drugs', icon: '💊', color: 'bg-red-50 border-red-200 text-red-800' },
  'otc-medications': { name: 'Over-the-Counter', icon: '🏥', color: 'bg-blue-50 border-blue-200 text-blue-800' },
  'supplements': { name: 'Health Supplements', icon: '💪', color: 'bg-green-50 border-green-200 text-green-800' },
  'beverages': { name: 'Beverages & Drinks', icon: '🥤', color: 'bg-cyan-50 border-cyan-200 text-cyan-800' },
  'snacks': { name: 'Snacks & Confectionery', icon: '🍿', color: 'bg-yellow-50 border-yellow-200 text-yellow-800' },
  'personal-care': { name: 'Personal Care', icon: '🧴', color: 'bg-purple-50 border-purple-200 text-purple-800' },
  'household': { name: 'Household Items', icon: '🏠', color: 'bg-orange-50 border-orange-200 text-orange-800' },
  'baby-care': { name: 'Baby Care', icon: '👶', color: 'bg-pink-50 border-pink-200 text-pink-800' },
  'herbal-natural': { name: 'Herbal & Natural', icon: '🌿', color: 'bg-emerald-50 border-emerald-200 text-emerald-800' },
  'fitness-wellness': { name: 'Fitness & Wellness', icon: '🏃', color: 'bg-indigo-50 border-indigo-200 text-indigo-800' }
}

// Helper functions
export const getProductsByCategory = (category: string) => {
  if (category === 'all') return allProducts
  return allProducts.filter(product => product.category === category)
}

export const searchProducts = (query: string) => {
  const lowerQuery = query.toLowerCase()
  return allProducts.filter(product => 
    product.name.toLowerCase().includes(lowerQuery) ||
    product.description.toLowerCase().includes(lowerQuery) ||
    (product.tags && product.tags.some(tag => tag.toLowerCase().includes(lowerQuery)))
  )
}

export const getProductStats = () => {
  const categoryStats: Record<string, number> = {}
  
  allProducts.forEach(product => {
    categoryStats[product.category] = (categoryStats[product.category] || 0) + 1
  })
  
  return {
    totalProducts: allProducts.length,
    categories: categoryStats,
    totalValue: allProducts.reduce((sum, p) => sum + p.price, 0),
    averagePrice: allProducts.reduce((sum, p) => sum + p.price, 0) / allProducts.length
  }
}
