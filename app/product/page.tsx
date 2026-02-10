'use client'

import { useState, useEffect } from 'react'
import Link from 'next/link'

interface Product {
  id: string
  name: string
  price: number
  category: string
  brand: string | null
  description: string | null
  image: string | null
  prescriptionRequired: boolean
  totalStock: number
  availableStock: number
  inStock: boolean
  inventory: {
    branchId: string
    branchName: string
    branchCode: string
    available: number
  }[]
}

const categoryInfo = {
  'prescription-drugs': { icon: '💊', name: 'Prescription Drugs', color: 'bg-red-50 border-red-200 text-red-800' },
  'otc-medications': { icon: '🏥', name: 'Over-the-Counter', color: 'bg-blue-50 border-blue-200 text-blue-800' },
  'supplements': { icon: '💪', name: 'Health Supplements', color: 'bg-green-50 border-green-200 text-green-800' },
  'beverages': { icon: '🥤', name: 'Beverages & Drinks', color: 'bg-cyan-50 border-cyan-200 text-cyan-800' },
  'snacks': { icon: '🍿', name: 'Snacks', color: 'bg-yellow-50 border-yellow-200 text-yellow-800' },
  'personal-care': { icon: '🧴', name: 'Personal Care', color: 'bg-purple-50 border-purple-200 text-purple-800' },
  'household': { icon: '🏠', name: 'Household Items', color: 'bg-orange-50 border-orange-200 text-orange-800' },
  'baby-care': { icon: '👶', name: 'Baby Care', color: 'bg-pink-50 border-pink-200 text-pink-800' },
  'herbal-natural': { icon: '🌿', name: 'Herbal & Natural', color: 'bg-emerald-50 border-emerald-200 text-emerald-800' },
  'fitness-wellness': { icon: '🏃', name: 'Fitness & Wellness', color: 'bg-indigo-50 border-indigo-200 text-indigo-800' }
}

export default function ProductPage() {
  const [products, setProducts] = useState<Product[]>([])
  const [loading, setLoading] = useState(true)
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('all')
  const [sortBy, setSortBy] = useState('name')

  useEffect(() => {
    fetchProducts()
  }, [selectedCategory, searchTerm])

  // const fetchProducts = async () => {
  //   setLoading(true)
  //   try {
  //     const params = new URLSearchParams()
  //     if (selectedCategory !== 'all') params.append('category', selectedCategory)
  //     if (searchTerm) params.append('search', searchTerm)
      
  //     const response = await fetch(`/api/products?${params}`)
  //     const data = await response.json()
  //     setProducts(data.products || [])
  //   } catch (error) {
  //     console.error('Failed to fetch products:', error)
  //   } finally {
  //     setLoading(false)
  //   }
  // }

  const fetchProducts = async () => {
  setLoading(true)
  try {
    const params = new URLSearchParams()
    if (selectedCategory !== 'all') params.append('category', selectedCategory)
    if (searchTerm) params.append('search', searchTerm)
    
    const url = `/api/products?${params}`
    console.log('Fetching:', url)
    
    const response = await fetch(url)
    console.log('ResponseStatus:', response.status)
    
    const data = await response.json()
    console.log('Response data:', data)
    
    setProducts(data.products || [])
  } catch (error) {
    console.error('Failed to fetch products:', error)
  } finally {
    setLoading(false)
  }
}

  const sortedProducts = [...products].sort((a, b) => {
    switch (sortBy) {
      case 'price':
        return a.price - b.price
      case 'category':
        return a.category.localeCompare(b.category)
      default:
        return a.name.localeCompare(b.name)
    }
  })

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="container mx-auto px-4 py-8">
        <div className="text-center mb-8">
          <h1 className="text-4xl font-bold text-gray-800 mb-2">Kunle Ara Pharmacy</h1>
          <p className="text-lg text-gray-600">
            Browse our comprehensive collection
          </p>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-md mb-8">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Search Products
              </label>
              <input
                type="text"
                placeholder="Search by name..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Category
              </label>
              <select
                value={selectedCategory}
                onChange={(e) => setSelectedCategory(e.target.value)}
                className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
              >
                <option value="all">All Categories</option>
                {Object.entries(categoryInfo).map(([categoryId, info]) => (
                  <option key={categoryId} value={categoryId}>
                    {info.icon} {info.name}
                  </option>
                ))}
              </select>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Sort By
              </label>
              <select
                value={sortBy}
                onChange={(e) => setSortBy(e.target.value)}
                className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
              >
                <option value="name">Name (A-Z)</option>
                <option value="price">Price (Low to High)</option>
                <option value="category">Category</option>
              </select>
            </div>
          </div>
        </div>

        <div className="mb-4">
          <p className="text-gray-600">
            Showing {sortedProducts.length} products
          </p>
        </div>

        {loading ? (
          <div className="text-center py-12">
            <div className="text-4xl mb-4">⏳</div>
            <p className="text-gray-600">Loading products...</p>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            {sortedProducts.map(product => {
              const category = categoryInfo[product.category as keyof typeof categoryInfo] || { icon: '📦', name: product.category, color: 'bg-gray-50' }
              return (
                <div key={product.id} className="bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
                  <div className="p-4">
                    <div className={`inline-flex items-center px-2 py-1 rounded-full text-xs font-medium mb-2 ${category.color}`}>
                      {category.icon} {category.name}
                    </div>

                    <h3 className="text-lg font-semibold text-gray-800 mb-2">{product.name}</h3>
                    <p className="text-sm text-gray-600 mb-3 line-clamp-2">{product.description}</p>

                    <div className="flex justify-between items-center mb-3">
                      <span className="text-xl font-bold text-green-600">₦{product.price.toLocaleString()}</span>
                      <span className={`text-xs px-2 py-1 rounded ${
                        product.inStock ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                      }`}>
                        {product.inStock ? `${product.availableStock} in stock` : 'Out of stock'}
                      </span>
                    </div>

                    {/* Branch Availability */}
                    <div className="mb-3 text-xs text-gray-600">
                      {product.inventory.map(inv => (
                        <div key={inv.branchId} className="flex justify-between">
                          <span>{inv.branchCode}:</span>
                          <span className="font-medium">{inv.available} units</span>
                        </div>
                      ))}
                    </div>

                    {product.prescriptionRequired && (
                      <div className="bg-red-100 text-red-800 text-xs px-2 py-1 rounded mb-3">
                        ⚠️ Prescription Required
                      </div>
                    )}

                    <div className="flex gap-2">
                      <Link href={`/product/${product.id}`} className="flex-1">
                        <button className="w-full bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700 transition-colors">
                          View Details
                        </button>
                      </Link>
                    </div>
                  </div>
                </div>
              )
            })}
          </div>
        )}

        {!loading && sortedProducts.length === 0 && (
          <div className="text-center py-12">
            <div className="text-6xl mb-4">🔍</div>
            <h3 className="text-xl font-semibold text-gray-600 mb-2">No products found</h3>
            <p className="text-gray-500">Try adjusting your search or filters.</p>
          </div>
        )}
      </div>
    </div>
  )
}
