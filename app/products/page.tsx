'use client'

<<<<<<< HEAD
import { useState, useEffect } from 'react'
import Link from 'next/link'

=======
import { useState, useMemo } from 'react'
import Link from 'next/link'
import { kunleAraProducts } from '../data/kunle_ara_products'
import { Search, Filter, Package, ShoppingCart, AlertCircle, CheckCircle } from 'lucide-react'
import Image from 'next/image'


// Product interface
>>>>>>> f96f68f (Fix: Working version with all dependencies installed)
interface Product {
  id: string
  name: string
  price: number
  category: string
<<<<<<< HEAD
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
    quantity: number
    reserved: number
    available: number
  }[]
}

const categoryInfo: any = {
  'prescription-drugs': { icon: '💊', name: 'Prescription Drugs', color: 'bg-red-50 border-red-200 text-red-800' },
  'otc-medications': { icon: '🏥', name: 'Over-the-Counter', color: 'bg-blue-50 border-blue-200 text-blue-800' },
  'supplements': { icon: '💪', name: 'Health Supplements', color: 'bg-green-50 border-green-200 text-green-800' },
  'beverages': { icon: '🥤', name: 'Beverages', color: 'bg-cyan-50 border-cyan-200 text-cyan-800' },
  'household': { icon: '🏠', name: 'Household', color: 'bg-orange-50 border-orange-200 text-orange-800' },
  'personal-care': { icon: '🧴', name: 'Personal Care', color: 'bg-purple-50 border-purple-200 text-purple-800' },
}

export default function ProductsPage() {
  const [products, setProducts] = useState<Product[]>([])
  const [loading, setLoading] = useState(true)
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('all')

  useEffect(() => {
    fetchProducts()
  }, [selectedCategory, searchTerm])

  const fetchProducts = async () => {
    setLoading(true)
    try {
      const params = new URLSearchParams()
      if (selectedCategory !== 'all') params.append('category', selectedCategory)
      if (searchTerm) params.append('search', searchTerm)

      const response = await fetch(`/api/products?${params}`)
      const data = await response.json()
      setProducts(data.products || [])
    } catch (error) {
      console.error('Failed to fetch products:', error)
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="container mx-auto px-4 py-8">
        {/* Header */}
        <div className="text-center mb-8">
          <h1 className="text-4xl font-bold text-gray-800 mb-2">Kunle Ara Pharmacy</h1>
          <p className="text-lg text-gray-600">
            Browse our collection of {products.length} products across 3 branches
          </p>
        </div>

        {/* Search and Filters */}
        <div className="bg-white p-6 rounded-lg shadow-md mb-8">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
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
                {Object.entries(categoryInfo).map(([id, info]: [string, any]) => (
                  <option key={id} value={id}>
                    {info.icon} {info.name}
                  </option>
                ))}
              </select>
=======
  brand?: string
  inStock: boolean
  stockQuantity: number
  prescriptionRequired: boolean
  barcode?: string
  image?: string
}

// Categories for filtering
const categories = [
  { id: 'all', name: 'All Categories', count: 0 },
  { id: 'prescription-drugs', name: 'Prescription Drugs', icon: '💊' },
  { id: 'otc-medications', name: 'Over-the-Counter', icon: '🏥' },
  { id: 'supplements', name: 'Health Supplements', icon: '💪' },
  { id: 'beverages', name: 'Beverages & Drinks', icon: '🥤' },
  { id: 'snacks', name: 'Snacks & Confectionery', icon: '🍫' },
  { id: 'personal-care', name: 'Personal Care', icon: '🧴' },
  { id: 'household', name: 'Household Items', icon: '🏠' },
  { id: 'baby-care', name: 'Baby Care', icon: '👶' },
  { id: 'herbal-natural', name: 'Herbal & Natural', icon: '🌿' },
  { id: 'fitness-wellness', name: 'Fitness & Wellness', icon: '🏋️' }
]

export default function ProductsPage() {
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('all')
  const [showOutOfStock, setShowOutOfStock] = useState(true)
  const [sortBy, setSortBy] = useState<'name' | 'price' | 'stock'>('name')

  // Filter and sort products
  const filteredProducts = useMemo(() => {
    let filtered = kunleAraProducts.filter(product => {

        const matchesSearch =
  product.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
  (product.brand &&
    product.brand.toLowerCase().includes(searchTerm.toLowerCase()))

      
      const matchesCategory = 
        selectedCategory === 'all' || product.category === selectedCategory
      
      const matchesStock = showOutOfStock || product.inStock

      return matchesSearch && matchesCategory && matchesStock
    })

    // Sort
    filtered.sort((a, b) => {
      if (sortBy === 'name') return a.name.localeCompare(b.name)
      if (sortBy === 'price') return a.price - b.price
      if (sortBy === 'stock') return b.stockQuantity - a.stockQuantity
      return 0
    })

    return filtered
  }, [searchTerm, selectedCategory, showOutOfStock, sortBy])

  // Category counts
  const categoryCounts = useMemo(() => {
    const counts: { [key: string]: number } = {}
    kunleAraProducts.forEach(product => {
      counts[product.category] = (counts[product.category] || 0) + 1
    })
    return counts
  }, [])

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white border-b shadow-sm sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center space-x-3">
              
              <Image 
  src="/logo.png" 
  alt="Kunle Ara Pharmacy" 
  width={120} 
  height={40}
  className="h-10 w-auto"
/>
              <div>
                <h1 className="text-2xl font-bold text-gray-900">Kunle Ara Pharmacy</h1>
                <p className="text-sm text-gray-600">Product Catalog</p>
              </div>
            </div>
            
            <div className="flex items-center space-x-4">
              <Link 
                href="/pos"
                className="bg-green-600 text-white px-6 py-2 rounded-lg hover:bg-green-700 transition shadow-md flex items-center"
              >
                <ShoppingCart className="h-5 w-5 mr-2" />
                Go to POS
              </Link>
            </div>
          </div>
        </div>
      </header>

      <div className="max-w-7xl mx-auto px-4 py-8">
        {/* Stats Bar */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mb-8">
          <div className="bg-white rounded-lg shadow-md p-6 border-l-4 border-green-500">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-gray-600 text-sm">Total Products</p>
                <p className="text-3xl font-bold text-gray-900">{kunleAraProducts.length}</p>
              </div>
              <Package className="h-12 w-12 text-green-500 opacity-20" />
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-md p-6 border-l-4 border-blue-500">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-gray-600 text-sm">In Stock</p>
                <p className="text-3xl font-bold text-gray-900">
                  {kunleAraProducts.filter(p => p.inStock).length}
                </p>
              </div>
              <CheckCircle className="h-12 w-12 text-blue-500 opacity-20" />
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-md p-6 border-l-4 border-red-500">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-gray-600 text-sm">Out of Stock</p>
                <p className="text-3xl font-bold text-gray-900">
                  {kunleAraProducts.filter(p => !p.inStock).length}
                </p>
              </div>
              <AlertCircle className="h-12 w-12 text-red-500 opacity-20" />
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-md p-6 border-l-4 border-purple-500">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-gray-600 text-sm">Showing</p>
                <p className="text-3xl font-bold text-gray-900">{filteredProducts.length}</p>
              </div>
              <Filter className="h-12 w-12 text-purple-500 opacity-20" />
>>>>>>> f96f68f (Fix: Working version with all dependencies installed)
            </div>
          </div>
        </div>

<<<<<<< HEAD
        {/* Loading State */}
        {loading && (
          <div className="text-center py-12">
            <div className="text-4xl mb-4">⏳</div>
            <p className="text-gray-600">Loading products...</p>
          </div>
        )}

        {/* Products Grid */}
        {!loading && products.length > 0 && (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            {products.map(product => {
              const category = categoryInfo[product.category] || { icon: '📦', name: product.category, color: 'bg-gray-50' }
              return (
                <div key={product.id} className="bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
                  <div className="p-4">
                    {/* Category Badge */}
                    <div className={`inline-flex items-center px-2 py-1 rounded-full text-xs font-medium mb-2 ${category.color}`}>
                      {category.icon} {category.name}
                    </div>

                    {/* Product Info */}
                    <h3 className="text-lg font-semibold text-gray-800 mb-2 line-clamp-2">{product.name}</h3>
                    
                    {/* Brand */}
                    {product.brand && (
                      <p className="text-sm text-gray-500 mb-2">{product.brand}</p>
                    )}

                    {/* Price */}
                    <div className="mb-3">
                      <span className="text-2xl font-bold text-green-600">₦{product.price.toLocaleString()}</span>
                    </div>

                    {/* Branch Availability */}
                    <div className="mb-3 space-y-1">
                      <p className="text-xs font-semibold text-gray-700 mb-1">Available at:</p>
                      {product.inventory.map(inv => (
                        <div key={inv.branchId} className="flex justify-between text-xs">
                          <span className="text-gray-600">{inv.branchCode}:</span>
                          <span className={inv.available > 0 ? 'text-green-600 font-medium' : 'text-red-600'}>
                            {inv.available > 0 ? `${inv.available} in stock` : 'Out of stock'}
                          </span>
                        </div>
                      ))}
                      <div className="flex justify-between text-xs font-bold border-t pt-1">
                        <span>Total:</span>
                        <span className="text-blue-600">{product.availableStock} available</span>
                      </div>
                    </div>

                    {/* Prescription Badge */}
                    {product.prescriptionRequired && (
                      <div className="bg-red-100 text-red-800 text-xs px-2 py-1 rounded mb-3">
                        ⚠️ Prescription Required
                      </div>
                    )}

                    {/* Action Buttons */}
                    <div className="flex gap-2">
                      <Link 
                        href={`/products/${product.id}`}
                        className="flex-1 bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700 transition-colors text-center"
                      >
                        View Details
                      </Link>
                      {!product.prescriptionRequired && product.inStock && (
                        <button className="bg-green-600 text-white py-2 px-4 rounded hover:bg-green-700 transition-colors">
                          Add to Cart
                        </button>
                      )}
                    </div>
                  </div>
                </div>
              )
            })}
          </div>
        )}

        {/* No Results */}
        {!loading && products.length === 0 && (
          <div className="text-center py-12">
            <div className="text-6xl mb-4">🔍</div>
            <h3 className="text-xl font-semibold text-gray-600 mb-2">No products found</h3>
            <p className="text-gray-500">Try adjusting your search or category filter.</p>
          </div>
        )}
=======
        <div className="grid lg:grid-cols-4 gap-8">
          {/* Sidebar Filters */}
          <div className="lg:col-span-1">
            <div className="bg-white rounded-lg shadow-md p-6 sticky top-24">
              <h2 className="text-lg font-bold text-gray-900 mb-4 flex items-center">
                <Filter className="h-5 w-5 mr-2 text-green-600" />
                Filters
              </h2>

              {/* Search */}
              <div className="mb-6">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Search Products
                </label>
                <div className="relative">
                  <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-5 w-5 text-gray-400" />
                  <input
                    type="text"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    placeholder="Name, barcode, brand..."
                    className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent"
                  />
                </div>
              </div>

              {/* Categories */}
              <div className="mb-6">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Category
                </label>
                <div className="space-y-2 max-h-96 overflow-y-auto">
                  {categories.map(category => (
                    <button
                      key={category.id}
                      onClick={() => setSelectedCategory(category.id)}
                      className={`w-full text-left px-4 py-2 rounded-lg transition ${
                        selectedCategory === category.id
                          ? 'bg-green-600 text-white'
                          : 'bg-gray-50 text-gray-700 hover:bg-gray-100'
                      }`}
                    >
                      <div className="flex items-center justify-between">
                        <span className="flex items-center">
                          {category.icon && <span className="mr-2">{category.icon}</span>}
                          <span className="text-sm">{category.name}</span>
                        </span>
                        {category.id !== 'all' && (
                          <span className="text-xs bg-white/20 px-2 py-0.5 rounded-full">
                            {categoryCounts[category.id] || 0}
                          </span>
                        )}
                      </div>
                    </button>
                  ))}
                </div>
              </div>

              {/* Stock Filter */}
              <div className="mb-6">
                <label className="flex items-center cursor-pointer">
                  <input
                    type="checkbox"
                    checked={showOutOfStock}
                    onChange={(e) => setShowOutOfStock(e.target.checked)}
                    className="w-4 h-4 text-green-600 border-gray-300 rounded focus:ring-green-500"
                  />
                  <span className="ml-2 text-sm text-gray-700">Show out of stock</span>
                </label>
              </div>

              {/* Sort By */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Sort By
                </label>
                <select
                  value={sortBy}
                  onChange={(e) => setSortBy(e.target.value as 'name' | 'price' | 'stock')}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent"
                >
                  <option value="name">Name (A-Z)</option>
                  <option value="price">Price (Low to High)</option>
                  <option value="stock">Stock Level</option>
                </select>
              </div>
            </div>
          </div>

          {/* Products Grid */}
          <div className="lg:col-span-3">
            {filteredProducts.length === 0 ? (
              <div className="bg-white rounded-lg shadow-md p-12 text-center">
                <Package className="h-16 w-16 text-gray-400 mx-auto mb-4" />
                <h3 className="text-xl font-semibold text-gray-900 mb-2">No products found</h3>
                <p className="text-gray-600">Try adjusting your search or filters</p>
              </div>
            ) : (
              <div className="grid sm:grid-cols-2 xl:grid-cols-3 gap-6">
                {filteredProducts.map(product => (
                  <div
                    key={product.id}
                    className={`bg-white rounded-lg shadow-md hover:shadow-xl transition-all duration-300 overflow-hidden border-2 ${
                      !product.inStock ? 'border-red-200' : 'border-transparent hover:border-green-200'
                    }`}
                  >
                    {/* Product Image Placeholder */}
                    <div className="h-48 bg-gradient-to-br from-green-100 to-blue-100 flex items-center justify-center relative">
                      <Package className="h-20 w-20 text-green-600 opacity-20" />
                      
                      {/* Stock Badge */}
                      <div className="absolute top-3 right-3">
                        {product.inStock ? (
                          <span className="bg-green-500 text-white text-xs px-3 py-1 rounded-full font-semibold">
                            In Stock
                          </span>
                        ) : (
                          <span className="bg-red-500 text-white text-xs px-3 py-1 rounded-full font-semibold">
                            Out of Stock
                          </span>
                        )}
                      </div>

                      {/* Prescription Badge */}
                      {product.prescriptionRequired && (
                        <div className="absolute top-3 left-3">
                          <span className="bg-red-600 text-white text-xs px-3 py-1 rounded-full font-semibold">
                            Rx Required
                          </span>
                        </div>
                      )}
                    </div>

                    {/* Product Details */}
                    <div className="p-4">
                      <h3 className="font-bold text-gray-900 mb-1 line-clamp-2 min-h-[3rem]">
                        {product.name}
                      </h3>
                      
                      {product.brand && (
                        <p className="text-sm text-gray-600 mb-2">
                          Brand: <span className="font-semibold">{product.brand}</span>
                        </p>
                      )}

                      <div className="flex items-center justify-between mb-3">
                        <div>
                          <p className="text-2xl font-bold text-green-600">
                            ₦{product.price.toLocaleString()}
                          </p>
                        </div>
                        <div className="text-right">
                          <p className="text-sm text-gray-600">Stock</p>
                          <p className={`font-bold ${
                            product.stockQuantity === 0 ? 'text-red-600' :
                            product.stockQuantity < 10 ? 'text-orange-600' :
                            'text-green-600'
                          }`}>
                            {product.stockQuantity}
                          </p>
                        </div>
                      </div>


                      <div className="pt-3 border-t">
                        <span className="inline-block bg-gray-100 text-gray-700 text-xs px-3 py-1 rounded-full">
                          {categories.find(c => c.id === product.category)?.name || product.category}
                        </span>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
>>>>>>> f96f68f (Fix: Working version with all dependencies installed)
      </div>
    </div>
  )
}
