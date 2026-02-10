// Combined Products: Existing + Scraped Kunle Ara Products
// Total: 140 existing + 76 scraped = 216 products

import { sampleProducts } from './products'  // Your existing 140 products
import { kunleAraProducts } from './kunle_ara_products'  // New 76 scraped products
import { Product } from '../lib/database'

// Combine all products with unique IDs
export const allProducts: Product[] = [
  // Keep all your existing 140 products
  ...sampleProducts.map(product => ({
    ...product,
    id: `existing_${product.id}`,  // Ensure unique IDs
    source: product.source || 'Original Database'
  })),
  
  // Add the 76 new scraped products
  ...kunleAraProducts.map(product => ({
    ...product,
    id: `scraped_${product.id}`,  // Ensure unique IDs
    createdAt: new Date(product.scraped_at),
    updatedAt: new Date(product.scraped_at),
    tags: product.category ? [product.category.replace('-', ' ')] : ['general'],
    activeIngredients: product.activeIngredients || [],
    dosageForm: (product.dosageForm as any) || 'other'
  }))
]

// Export product statistics
export const productStats = {
  totalProducts: allProducts.length,
  existingProducts: sampleProducts.length,
  scrapedProducts: kunleAraProducts.length,
  categories: getCategoryBreakdown(),
  lastUpdated: new Date().toISOString()
}

// Get category breakdown
function getCategoryBreakdown() {
  const breakdown: { [key: string]: number } = {}
  
  allProducts.forEach(product => {
    const category = product.category
    breakdown[category] = (breakdown[category] || 0) + 1
  })
  
  return breakdown
}

// Export filtered functions
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

// Export by source
export const getExistingProducts = () => allProducts.filter(p => p.id.startsWith('existing_'))
export const getScrapedProducts = () => allProducts.filter(p => p.id.startsWith('scraped_'))

console.log(`📊 Combined Products Loaded:`)
console.log(`   📦 Total: ${allProducts.length} products`)
console.log(`   🏪 Existing: ${sampleProducts.length} products`)  
console.log(`   🌐 Scraped: ${kunleAraProducts.length} products`)
