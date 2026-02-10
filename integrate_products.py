"""
Complete Kunle Ara Pharmacy Integration Script
Integrates scraped products with Next.js ecommerce system
"""

import json
import os
import shutil
from datetime import datetime

def integrate_kunle_ara_products():
    """Complete integration of scraped products with Next.js system"""
    
    print("🔄 KUNLE ARA PHARMACY - COMPLETE INTEGRATION")
    print("="*60)
    
    # Paths
    scraper_data_path = "data/kunle_ara_products.json"
    ecommerce_data_path = "ecommerce/app/data/"
    
    try:
        # Step 1: Load scraped products
        print("📂 Loading scraped products...")
        with open(scraper_data_path, 'r', encoding='utf-8') as f:
            kunle_ara_products = json.load(f)
        
        print(f"✅ Loaded {len(kunle_ara_products)} products")
        
        # Step 2: Create comprehensive master products file
        print("🔧 Creating master products database...")
        
        master_products_ts = f"""// Master Product Database for Kunle Ara Pharmacy POS System
// Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
// Total Products: {len(kunle_ara_products)}

export interface Product {{
  id: string
  name: string
  description: string
  price: number
  category: ProductCategory
  subcategory?: string
  brand?: string
  image: string
  inStock: boolean
  stockQuantity: number
  barcode?: string
  prescriptionRequired: boolean
  expiryDate?: Date
  manufacturer?: string
  activeIngredients?: string[]
  dosageForm?: 'tablet' | 'capsule' | 'liquid' | 'cream' | 'injection' | 'other'
  tags: string[]
  createdAt: Date
  updatedAt: Date
  source?: string
  scraped_at?: string
}}

export type ProductCategory = 
  | 'prescription-drugs'
  | 'otc-medications'
  | 'supplements'
  | 'beverages'
  | 'snacks'
  | 'personal-care'
  | 'household'
  | 'baby-care'
  | 'herbal-natural'
  | 'fitness-wellness'

export interface CategoryInfo {{
  id: ProductCategory
  name: string
  description: string
  icon: string
  color: string
}}

export const categories: CategoryInfo[] = [
  {{
    id: 'prescription-drugs',
    name: 'Prescription Drugs',
    description: 'Licensed prescription medications',
    icon: '💊',
    color: 'bg-red-50 border-red-200 text-red-800'
  }},
  {{
    id: 'otc-medications',
    name: 'Over-the-Counter',
    description: 'Self-care medications',
    icon: '🏥',
    color: 'bg-blue-50 border-blue-200 text-blue-800'
  }},
  {{
    id: 'supplements',
    name: 'Health Supplements',
    description: 'Vitamins and nutritional supplements',
    icon: '💪',
    color: 'bg-green-50 border-green-200 text-green-800'
  }},
  {{
    id: 'beverages',
    name: 'Beverages & Drinks',
    description: 'Soft drinks, water, health drinks',
    icon: '🥤',
    color: 'bg-cyan-50 border-cyan-200 text-cyan-800'
  }},
  {{
    id: 'snacks',
    name: 'Snacks & Confectionery',
    description: 'Healthy snacks and treats',
    icon: '🍿',
    color: 'bg-yellow-50 border-yellow-200 text-yellow-800'
  }},
  {{
    id: 'personal-care',
    name: 'Personal Care',
    description: 'Hygiene and personal care products',
    icon: '🧴',
    color: 'bg-purple-50 border-purple-200 text-purple-800'
  }},
  {{
    id: 'household',
    name: 'Household Items',
    description: 'Cleaning and household essentials',
    icon: '🏠',
    color: 'bg-orange-50 border-orange-200 text-orange-800'
  }},
  {{
    id: 'baby-care',
    name: 'Baby Care',
    description: 'Products for infants and children',
    icon: '👶',
    color: 'bg-pink-50 border-pink-200 text-pink-800'
  }},
  {{
    id: 'herbal-natural',
    name: 'Herbal & Natural',
    description: 'Natural and traditional remedies',
    icon: '🌿',
    color: 'bg-emerald-50 border-emerald-200 text-emerald-800'
  }},
  {{
    id: 'fitness-wellness',
    name: 'Fitness & Wellness',
    description: 'Sports nutrition and wellness products',
    icon: '🏃',
    color: 'bg-indigo-50 border-indigo-200 text-indigo-800'
  }}
]

// Convert scraped products to proper format
const convertedProducts: Product[] = {json.dumps(kunle_ara_products, indent=2)}.map(product => ({{
  ...product,
  createdAt: new Date(product.scraped_at || new Date().toISOString()),
  updatedAt: new Date(),
  activeIngredients: product.activeIngredients || [],
  dosageForm: (product.dosageForm as any) || 'other',
  tags: product.tags || [product.category?.replace('-', ' ') || 'general']
}}))

export const allProducts: Product[] = convertedProducts

// Utility functions
export const getProductsByCategory = (category: ProductCategory | 'all'): Product[] => {{
  if (category === 'all') return allProducts
  return allProducts.filter(product => product.category === category)
}}

export const searchProducts = (query: string): Product[] => {{
  const lowerQuery = query.toLowerCase()
  return allProducts.filter(product => 
    product.name.toLowerCase().includes(lowerQuery) ||
    product.description.toLowerCase().includes(lowerQuery) ||
    product.tags.some(tag => tag.toLowerCase().includes(lowerQuery)) ||
    product.brand?.toLowerCase().includes(lowerQuery) ||
    product.manufacturer?.toLowerCase().includes(lowerQuery)
  )
}}

export const getProductStats = () => {{
  const categoryStats = {{}}
  allProducts.forEach(product => {{
    const cat = product.category
    categoryStats[cat] = (categoryStats[cat] || 0) + 1
  }})
  
  return {{
    totalProducts: allProducts.length,
    categories: categoryStats,
    totalValue: allProducts.reduce((sum, product) => sum + product.price, 0),
    averagePrice: allProducts.reduce((sum, product) => sum + product.price, 0) / allProducts.length,
    inStockProducts: allProducts.filter(p => p.inStock).length,
    prescriptionProducts: allProducts.filter(p => p.prescriptionRequired).length
  }}
}}

// Export individual categories for easy access
export const prescriptionDrugs = getProductsByCategory('prescription-drugs')
export const otcMedications = getProductsByCategory('otc-medications')
export const supplements = getProductsByCategory('supplements')
export const beverages = getProductsByCategory('beverages')
export const snacks = getProductsByCategory('snacks')
export const personalCare = getProductsByCategory('personal-care')
export const household = getProductsByCategory('household')
export const babyCare = getProductsByCategory('baby-care')
export const herbalNatural = getProductsByCategory('herbal-natural')
export const fitnessWellness = getProductsByCategory('fitness-wellness')
"""
        
        # Step 3: Create enhanced products page
        print("📄 Creating enhanced products page...")
        
        products_page_tsx = """'use client'

import { useState, useMemo } from 'react'
import Link from 'next/link'
import { allProducts, categories, getProductsByCategory, searchProducts, getProductStats } from '../data/master_products'

export default function ProductsPage() {
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategory, setSelectedCategory] = useState<'all' | any>('all')
  const [sortBy, setSortBy] = useState<'name' | 'price' | 'category'>('name')
  const [showPrescriptionOnly, setShowPrescriptionOnly] = useState(false)

  // Get statistics
  const stats = getProductStats()

  // Filter and sort products
  const filteredProducts = useMemo(() => {
    let filtered = searchTerm ? searchProducts(searchTerm) : getProductsByCategory(selectedCategory)
    
    // Filter by prescription requirement
    if (showPrescriptionOnly) {
      filtered = filtered.filter(product => product.prescriptionRequired)
    }

    // Sort products
    filtered.sort((a, b) => {
      switch (sortBy) {
        case 'price':
          return a.price - b.price
        case 'category':
          return a.category.localeCompare(b.category)
        default:
          return a.name.localeCompare(b.name)
      }
    })

    return filtered
  }, [searchTerm, selectedCategory, sortBy, showPrescriptionOnly])

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="container mx-auto px-4 py-8">
        {/* Enhanced Header with Real Statistics */}
        <div className="text-center mb-8">
          <h1 className="text-4xl font-bold text-gray-800 mb-2">Kunle Ara Pharmacy Catalog</h1>
          <p className="text-lg text-gray-600 mb-4">
            Comprehensive collection of {stats.totalProducts} pharmaceutical and wellness products
          </p>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 max-w-4xl mx-auto">
            <div className="bg-white p-4 rounded-lg shadow">
              <div className="text-2xl font-bold text-blue-600">₦{stats.totalValue.toLocaleString()}</div>
              <div className="text-sm text-gray-600">Total Inventory Value</div>
            </div>
            <div className="bg-white p-4 rounded-lg shadow">
              <div className="text-2xl font-bold text-green-600">{stats.inStockProducts}</div>
              <div className="text-sm text-gray-600">Products In Stock</div>
            </div>
            <div className="bg-white p-4 rounded-lg shadow">
              <div className="text-2xl font-bold text-red-600">{stats.prescriptionProducts}</div>
              <div className="text-sm text-gray-600">Prescription Items</div>
            </div>
            <div className="bg-white p-4 rounded-lg shadow">
              <div className="text-2xl font-bold text-purple-600">₦{Math.round(stats.averagePrice).toLocaleString()}</div>
              <div className="text-sm text-gray-600">Average Price</div>
            </div>
          </div>
        </div>

        {/* Enhanced Search and Filters */}
        <div className="bg-white p-6 rounded-lg shadow-md mb-8">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
            {/* Search */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Search Products
              </label>
              <input
                type="text"
                placeholder="Search by name, brand, or description..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
            </div>

            {/* Category Filter */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Category
              </label>
              <select
                value={selectedCategory}
                onChange={(e) => setSelectedCategory(e.target.value)}
                className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
              >
                <option value="all">All Categories ({stats.totalProducts})</option>
                {categories.map(category => {
                  const count = stats.categories[category.id] || 0
                  return (
                    <option key={category.id} value={category.id}>
                      {category.icon} {category.name} ({count})
                    </option>
                  )
                })}
              </select>
            </div>

            {/* Sort */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Sort By
              </label>
              <select
                value={sortBy}
                onChange={(e) => setSortBy(e.target.value as any)}
                className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
              >
                <option value="name">Name (A-Z)</option>
                <option value="price">Price (Low to High)</option>
                <option value="category">Category</option>
              </select>
            </div>

            {/* Prescription Filter */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Special Filters
              </label>
              <label className="flex items-center p-3 border border-gray-300 rounded-lg cursor-pointer hover:bg-gray-50">
                <input
                  type="checkbox"
                  checked={showPrescriptionOnly}
                  onChange={(e) => setShowPrescriptionOnly(e.target.checked)}
                  className="mr-2"
                />
                Prescription Only
              </label>
            </div>
          </div>
        </div>

        {/* Category Overview Grid */}
        <div className="grid grid-cols-2 md:grid-cols-5 gap-4 mb-8">
          {categories.map(category => {
            const productCount = stats.categories[category.id] || 0
            return (
              <button
                key={category.id}
                onClick={() => setSelectedCategory(category.id)}
                className={`p-4 rounded-lg border-2 transition-all hover:shadow-md ${
                  selectedCategory === category.id ? category.color : 'bg-white border-gray-200 hover:border-gray-300'
                }`}
              >
                <div className="text-2xl mb-1">{category.icon}</div>
                <div className="text-sm font-semibold">{category.name}</div>
                <div className="text-xs text-gray-500">{productCount} items</div>
              </button>
            )
          })}
        </div>

        {/* Results Summary */}
        <div className="mb-4 flex justify-between items-center">
          <p className="text-gray-600">
            Showing {filteredProducts.length} of {stats.totalProducts} products
          </p>
          {searchTerm && (
            <button
              onClick={() => setSearchTerm('')}
              className="text-blue-600 hover:text-blue-800"
            >
              Clear Search
            </button>
          )}
        </div>

        {/* Enhanced Products Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {filteredProducts.map(product => {
            const categoryInfo = categories.find(c => c.id === product.category)
            return (
              <div key={product.id} className="bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
                <div className="p-4">
                  {/* Category and Stock Badge */}
                  <div className="flex justify-between items-start mb-2">
                    <div className={`inline-flex items-center px-2 py-1 rounded-full text-xs font-medium ${categoryInfo?.color}`}>
                      {categoryInfo?.icon} {categoryInfo?.name}
                    </div>
                    <span className={`text-xs px-2 py-1 rounded ${
                      product.inStock ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                    }`}>
                      {product.inStock ? `${product.stockQuantity} in stock` : 'Out of stock'}
                    </span>
                  </div>

                  {/* Product Info */}
                  <h3 className="text-lg font-semibold text-gray-800 mb-2 line-clamp-2">{product.name}</h3>
                  <p className="text-sm text-gray-600 mb-3 line-clamp-2">{product.description}</p>

                  {/* Brand and Manufacturer */}
                  {(product.brand || product.manufacturer) && (
                    <p className="text-xs text-gray-500 mb-2">
                      By: {product.brand || product.manufacturer}
                    </p>
                  )}

                  {/* Price */}
                  <div className="flex justify-between items-center mb-3">
                    <span className="text-xl font-bold text-green-600">₦{product.price.toLocaleString()}</span>
                  </div>

                  {/* Special Badges */}
                  <div className="space-y-1 mb-3">
                    {product.prescriptionRequired && (
                      <div className="bg-red-100 text-red-800 text-xs px-2 py-1 rounded">
                        ⚠️ Prescription Required
                      </div>
                    )}
                    {product.dosageForm && product.dosageForm !== 'other' && (
                      <div className="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded">
                        📋 {product.dosageForm}
                      </div>
                    )}
                  </div>

                  {/* Tags */}
                  <div className="flex flex-wrap gap-1 mb-3">
                    {product.tags.slice(0, 2).map(tag => (
                      <span key={tag} className="bg-gray-100 text-gray-600 text-xs px-2 py-1 rounded">
                        {tag}
                      </span>
                    ))}
                  </div>

                  {/* Action Buttons */}
                  <div className="flex gap-2">
                    <button className="flex-1 bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700 transition-colors text-sm">
                      View Details
                    </button>
                    {!product.prescriptionRequired && product.inStock && (
                      <button className="bg-green-600 text-white py-2 px-4 rounded hover:bg-green-700 transition-colors text-sm">
                        Add to Cart
                      </button>
                    )}
                  </div>
                </div>
              </div>
            )
          })}
        </div>

        {/* No Results State */}
        {filteredProducts.length === 0 && (
          <div className="text-center py-12">
            <div className="text-6xl mb-4">🔍</div>
            <h3 className="text-xl font-semibold text-gray-600 mb-2">No products found</h3>
            <p className="text-gray-500 mb-4">Try adjusting your search terms or filters.</p>
            <button
              onClick={() => {
                setSearchTerm('')
                setSelectedCategory('all')
                setShowPrescriptionOnly(false)
              }}
              className="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 transition-colors"
            >
              Reset Filters
            </button>
          </div>
        )}
      </div>
    </div>
  )
}
"""

        # Step 4: Create enhanced POS system
        print("💻 Creating enhanced POS system...")
        
        pos_page_tsx = """'use client'

import { useState, useMemo, useEffect } from 'react'
import { allProducts, categories, getProductsByCategory, searchProducts } from '../data/master_products'

interface CartItem {
  product: any
  quantity: number
}

interface Sale {
  id: string
  items: CartItem[]
  total: number
  date: Date
  staffId?: string
  customerName?: string
}

// Branch configuration
const branches = [
  { id: 'uch', name: 'UCH Branch', location: 'University College Hospital Area', icon: '🏥' },
  { id: 'yemetu', name: 'Yemetu Branch', location: 'Yemetu Area, Ibadan', icon: '🏪' },
  { id: 'ring-road', name: 'Ring Road Branch', location: 'Ring Road Area, Ibadan', icon: '🏢' }
]

export default function POSPage() {
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [staffId, setStaffId] = useState('')
  const [password, setPassword] = useState('')
  const [selectedBranch, setSelectedBranch] = useState('')
  const [currentBranch, setCurrentBranch] = useState(null)
  const [cart, setCart] = useState<CartItem[]>([])
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('all')
  const [customerName, setCustomerName] = useState('')
  const [sales, setSales] = useState<Sale[]>([])

  // Auto-detect location (simplified for demo)
  useEffect(() => {
    // Simulate automatic branch detection
    setTimeout(() => {
      const randomBranch = branches[Math.floor(Math.random() * branches.length)]
      setCurrentBranch(randomBranch)
    }, 1000)
  }, [])

  const handleLogin = (e: React.FormEvent) => {
    e.preventDefault()
    if (staffId && password && currentBranch) {
      setIsAuthenticated(true)
    } else {
      alert('Please enter Staff ID, Password. Branch location will be detected automatically.')
    }
  }

  // Filter products for POS
  const filteredProducts = useMemo(() => {
    let filtered = searchTerm ? searchProducts(searchTerm) : getProductsByCategory(selectedCategory)
    return filtered.filter(product => product.inStock && product.stockQuantity > 0)
  }, [searchTerm, selectedCategory])

  // Add to cart
  const addToCart = (product: any) => {
    const existingItem = cart.find(item => item.product.id === product.id)
    if (existingItem) {
      setCart(cart.map(item => 
        item.product.id === product.id 
          ? { ...item, quantity: Math.min(item.quantity + 1, product.stockQuantity) }
          : item
      ))
    } else {
      setCart([...cart, { product, quantity: 1 }])
    }
  }

  // Update cart quantity
  const updateQuantity = (productId: string, newQuantity: number) => {
    if (newQuantity <= 0) {
      setCart(cart.filter(item => item.product.id !== productId))
    } else {
      const product = cart.find(item => item.product.id === productId)?.product
      const maxQuantity = product?.stockQuantity || 1
      setCart(cart.map(item => 
        item.product.id === productId 
          ? { ...item, quantity: Math.min(newQuantity, maxQuantity) }
          : item
      ))
    }
  }

  // Calculate totals
  const subtotal = cart.reduce((sum, item) => sum + (item.product.price * item.quantity), 0)
  const tax = subtotal * 0.075 // 7.5% VAT
  const total = subtotal + tax

  // Process sale
  const processSale = () => {
    if (cart.length === 0) {
      alert('Cart is empty!')
      return
    }

    const newSale: Sale = {
      id: `SALE-${Date.now()}`,
      items: [...cart],
      total,
      date: new Date(),
      staffId,
      customerName: customerName || 'Walk-in Customer'
    }

    setSales([...sales, newSale])
    setCart([])
    setCustomerName('')
    alert(`Sale completed! Total: ₦${total.toLocaleString()}\\n\\nReceipt details:\\nCustomer: ${newSale.customerName}\\nItems: ${cart.length}\\nTotal: ₦${total.toLocaleString()}`)
  }

  // Location detection screen
  if (!currentBranch) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-50 to-green-50 flex items-center justify-center">
        <div className="bg-white p-8 rounded-2xl shadow-2xl max-w-md w-full text-center">
          <div className="animate-spin text-6xl mb-6">📍</div>
          <h1 className="text-2xl font-bold text-gray-800 mb-4">Detecting Branch Location</h1>
          <p className="text-gray-600 mb-6">
            Automatically identifying your Kunle Ara Pharmacy branch...
          </p>
          <div className="bg-gray-100 rounded-lg p-4">
            <div className="flex items-center justify-center space-x-2">
              <div className="w-2 h-2 bg-blue-500 rounded-full animate-pulse"></div>
              <div className="w-2 h-2 bg-blue-500 rounded-full animate-pulse" style={{animationDelay: '0.2s'}}></div>
              <div className="w-2 h-2 bg-blue-500 rounded-full animate-pulse" style={{animationDelay: '0.4s'}}></div>
            </div>
            <p className="text-sm text-gray-600 mt-2">Checking network location...</p>
          </div>
        </div>
      </div>
    )
  }

  // Login Screen
  if (!isAuthenticated) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-green-50 to-blue-50 flex items-center justify-center">
        <div className="bg-white p-8 rounded-2xl shadow-2xl max-w-md w-full">
          {/* Location Confirmation */}
          <div className="bg-green-50 border border-green-200 rounded-lg p-4 mb-6">
            <div className="flex items-center">
              <span className="text-2xl mr-3">{currentBranch?.icon}</span>
              <div>
                <div className="font-semibold text-green-800">Location Detected</div>
                <div className="text-sm text-green-600">{currentBranch?.name}</div>
                <div className="text-xs text-green-500">{currentBranch?.location}</div>
              </div>
            </div>
          </div>

          <div className="text-center mb-8">
            <div className="text-4xl mb-4">🏥</div>
            <h1 className="text-3xl font-bold text-gray-800">Kunle Ara Pharmacy</h1>
            <h2 className="text-xl text-green-600 font-semibold">POS System</h2>
          </div>

          <form onSubmit={handleLogin} className="space-y-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Staff ID
              </label>
              <input
                type="text"
                value={staffId}
                onChange={(e) => setStaffId(e.target.value)}
                placeholder="Enter your staff ID"
                className="w-full p-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent"
                required
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Password
              </label>
              <input
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="Enter your password"
                className="w-full p-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent"
                required
              />
            </div>

            <button
              type="submit"
              className="w-full bg-green-600 text-white py-4 rounded-lg hover:bg-green-700 transition duration-300 font-semibold"
            >
              Login to POS System
            </button>
          </form>

          <div className="mt-4 text-center">
            <p className="text-sm text-gray-500">Demo: Any Staff ID + Password works</p>
          </div>
        </div>
      </div>
    )
  }

  // Main POS Interface
  return (
    <div className="min-h-screen bg-gray-100">
      {/* Enhanced Header */}
      <div className="bg-green-600 text-white p-4">
        <div className="flex justify-between items-center">
          <div>
            <h1 className="text-2xl font-bold">Kunle Ara Pharmacy - POS</h1>
            <div className="flex items-center space-x-4 text-green-100">
              <span>📍 {currentBranch?.icon} {currentBranch?.name}</span>
              <span>👤 {staffId}</span>
              <span>📅 {new Date().toLocaleDateString()}</span>
              <span>🕒 {new Date().toLocaleTimeString()}</span>
            </div>
          </div>
          <div className="text-right">
            <button
              onClick={() => setIsAuthenticated(false)}
              className="bg-green-700 hover:bg-green-800 px-4 py-2 rounded transition-colors"
            >
              Logout
            </button>
            <div className="text-xs text-green-200 mt-1">
              {currentBranch?.location}
            </div>
          </div>
        </div>
      </div>

      <div className="flex h-screen">
        {/* Product Selection Area */}
        <div className="flex-1 p-4">
          {/* Search and Filter */}
          <div className="bg-white p-4 rounded-lg shadow mb-4">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <input
                  type="text"
                  placeholder="Search products or scan barcode..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent"
                />
              </div>
              <div>
                <select
                  value={selectedCategory}
                  onChange={(e) => setSelectedCategory(e.target.value)}
                  className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent"
                >
                  <option value="all">All Categories</option>
                  {categories.map(category => (
                    <option key={category.id} value={category.id}>
                      {category.icon} {category.name}
                    </option>
                  ))}
                </select>
              </div>
            </div>
          </div>

          {/* Branch-Specific Stock Alert */}
          <div className="bg-blue-50 border border-blue-200 p-3 rounded-lg mb-4">
            <p className="text-blue-800 text-sm">
              📦 Showing inventory for <strong>{currentBranch?.name}</strong> | 
              Total products available: {filteredProducts.length}
            </p>
          </div>

          {/* Products Grid */}
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 max-h-96 overflow-y-auto">
            {filteredProducts.map(product => {
              const categoryInfo = categories.find(c => c.id === product.category)
              const branchStock = getBranchInventory(product)
              
              return (
                <button
                  key={product.id}
                  onClick={() => addToCart(product)}
                  className="bg-white p-4 rounded-lg shadow hover:shadow-md transition-shadow text-left border-2 hover:border-green-300"
                  disabled={branchStock <= 0}
                >
                  {/* Product Image Placeholder */}
                  <div className="w-full h-24 bg-gray-100 rounded mb-2 flex items-center justify-center">
                    <span className="text-2xl">{categoryInfo?.icon || '📦'}</span>
                  </div>
                  
                  {/* Category Badge */}
                  <div className={`text-xs px-2 py-1 rounded mb-2 ${categoryInfo?.color || 'bg-gray-50 border-gray-200 text-gray-800'}`}>
                    {categoryInfo?.icon} {categoryInfo?.name}
                  </div>
                  
                  {/* Product Details */}
                  <h3 className="font-semibold text-sm mb-1 line-clamp-2">{product.name}</h3>
                  <p className="text-xs text-gray-600 mb-2">{product.brand || 'Kunle Ara'}</p>
                  
                  {/* Price and Stock */}
                  <div className="flex justify-between items-center mb-2">
                    <span className="text-green-600 font-bold text-lg">₦{product.price.toLocaleString()}</span>
                    <span className={`text-xs px-2 py-1 rounded ${
                      branchStock > 10 ? 'bg-green-100 text-green-800' : 
                      branchStock > 0 ? 'bg-yellow-100 text-yellow-800' : 
                      'bg-red-100 text-red-800'
                    }`}>
                      {branchStock > 0 ? `${branchStock} left` : 'Out of stock'}
                    </span>
                  </div>
                  
                  {/* Prescription Badge */}
                  {product.prescriptionRequired && (
                    <div className="text-xs bg-red-100 text-red-800 px-2 py-1 rounded mb-2">
                      ⚠️ Rx Required
                    </div>
                  )}
                  
                  {/* Add Button */}
                  <div className="mt-2">
                    <div className={`text-center py-2 rounded font-semibold text-sm ${
                      branchStock > 0 
                        ? 'bg-green-500 text-white hover:bg-green-600' 
                        : 'bg-gray-300 text-gray-500 cursor-not-allowed'
                    }`}>
                      {branchStock > 0 ? '+ Add to Cart' : 'Out of Stock'}
                    </div>
                  </div>
                </button>
              )
            })}
          </div>
          
          {/* No Products Found */}
          {filteredProducts.length === 0 && (
            <div className="text-center py-12">
              <div className="text-6xl mb-4">🔍</div>
              <h3 className="text-xl font-semibold text-gray-600 mb-2">No products found</h3>
              <p className="text-gray-500">Try adjusting your search terms or category filters.</p>
            </div>
          )}
        </div>

        {/* Cart/Checkout Area */}
        <div className="w-96 bg-white border-l border-gray-200 p-4">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-xl font-bold">Current Sale</h2>
            <div className="text-sm text-gray-600">
              {currentBranch?.icon} {currentBranch?.name}
            </div>
          </div>

          {/* Customer Info */}
          <div className="mb-4">
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Customer Name (Optional)
            </label>
            <input
              type="text"
              placeholder="Enter customer name"
              value={customerName}
              onChange={(e) => setCustomerName(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded focus:ring-2 focus:ring-green-500 focus:border-transparent"
            />
          </div>

          {/* Cart Items */}
          <div className="mb-4">
            <div className="flex justify-between items-center mb-2">
              <h3 className="font-semibold">Items ({cart.length})</h3>
              {cart.length > 0 && (
                <button
                  onClick={() => setCart([])}
                  className="text-red-500 hover:text-red-700 text-sm"
                >
                  Clear All
                </button>
              )}
            </div>
            
            {/* Cart Items List */}
            <div className="space-y-2 max-h-64 overflow-y-auto">
              {cart.length === 0 ? (
                <div className="text-center py-8 text-gray-500">
                  <div className="text-4xl mb-2">🛒</div>
                  <p>Cart is empty</p>
                  <p className="text-sm">Add products to start a sale</p>
                </div>
              ) : (
                cart.map(item => (
                  <div key={item.product.id} className="bg-gray-50 p-3 rounded border">
                    <div className="flex justify-between items-start mb-2">
                      <div className="flex-1">
                        <h4 className="font-semibold text-sm">{item.product.name}</h4>
                        <p className="text-xs text-gray-600">
                          ₦{item.product.price.toLocaleString()} each
                        </p>
                        {item.product.prescriptionRequired && (
                          <span className="text-xs bg-red-100 text-red-800 px-1 py-0.5 rounded">
                            Rx Required
                          </span>
                        )}
                      </div>
                      <button
                        onClick={() => updateQuantity(item.product.id, 0)}
                        className="text-red-500 hover:text-red-700 text-xs ml-2"
                      >
                        Remove
                      </button>
                    </div>
                    
                    {/* Quantity Controls */}
                    <div className="flex items-center justify-between">
                      <div className="flex items-center space-x-2">
                        <button
                          onClick={() => updateQuantity(item.product.id, item.quantity - 1)}
                          className="bg-gray-200 hover:bg-gray-300 px-2 py-1 rounded text-sm font-semibold"
                        >
                          −
                        </button>
                        <span className="font-semibold min-w-[30px] text-center">{item.quantity}</span>
                        <button
                          onClick={() => updateQuantity(item.product.id, item.quantity + 1)}
                          className="bg-gray-200 hover:bg-gray-300 px-2 py-1 rounded text-sm font-semibold"
                        >
                          +
                        </button>
                      </div>
                      <span className="font-bold text-green-600">
                        ₦{(item.product.price * item.quantity).toLocaleString()}
                      </span>
                    </div>
                  </div>
                ))
              )}
            </div>
          </div>

          {/* Order Summary */}
          <div className="border-t pt-4 space-y-2">
            <div className="flex justify-between text-sm">
              <span>Subtotal ({cart.reduce((sum, item) => sum + item.quantity, 0)} items):</span>
              <span>₦{subtotal.toLocaleString()}</span>
            </div>
            <div className="flex justify-between text-sm">
              <span>VAT (7.5%):</span>
              <span>₦{tax.toLocaleString()}</span>
            </div>
            <div className="flex justify-between font-bold text-lg border-t pt-2">
              <span>Total:</span>
              <span className="text-green-600">₦{total.toLocaleString()}</span>
            </div>
          </div>

          {/* Payment Method Selection */}
          <div className="mt-4">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Payment Method
            </label>
            <select className="w-full p-2 border border-gray-300 rounded focus:ring-2 focus:ring-green-500">
              <option value="cash">Cash</option>
              <option value="card">Card/POS</option>
              <option value="transfer">Bank Transfer</option>
              <option value="credit">Store Credit</option>
            </select>
          </div>

          {/* Action Buttons */}
          <div className="space-y-2 mt-6">
            <button
              onClick={processSale}
              disabled={cart.length === 0}
              className="w-full bg-green-600 text-white py-3 rounded-lg hover:bg-green-700 disabled:bg-gray-400 disabled:cursor-not-allowed font-semibold transition-colors"
            >
              Complete Sale (₦{total.toLocaleString()})
            </button>
            
            <div className="grid grid-cols-2 gap-2">
              <button
                onClick={() => {/* Hold transaction */}}
                disabled={cart.length === 0}
                className="bg-yellow-500 text-white py-2 rounded-lg hover:bg-yellow-600 disabled:bg-gray-400 disabled:cursor-not-allowed text-sm"
              >
                Hold Sale
              </button>
              <button
                onClick={() => {/* Print receipt */}}
                disabled={cart.length === 0}
                className="bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600 disabled:bg-gray-400 disabled:cursor-not-allowed text-sm"
              >
                Print Receipt
              </button>
            </div>
          </div>

          {/* Recent Sales */}
          <div className="mt-6">
            <h3 className="font-semibold mb-2 text-sm">Recent Sales ({sales.length})</h3>
            <div className="text-xs space-y-1 max-h-32 overflow-y-auto">
              {sales.length === 0 ? (
                <p className="text-gray-500 text-center py-2">No recent sales</p>
              ) : (
                sales.slice(-5).reverse().map(sale => (
                  <div key={sale.id} className="bg-gray-50 p-2 rounded">
                    <div className="flex justify-between">
                      <span className="font-medium">{sale.customerName || 'Walk-in'}</span>
                      <span className="text-green-600 font-semibold">₦{sale.total.toLocaleString()}</span>
                    </div>
                    <div className="text-gray-500">
                      {sale.items.length} items • {new Date(sale.date).toLocaleTimeString()}
                    </div>
                  </div>
                ))
              )}
            </div>
          </div>

          {/* Quick Stats */}
          <div className="mt-4 p-3 bg-gray-50 rounded-lg">
            <h4 className="font-semibold text-sm mb-2">Today's Summary</h4>
            <div className="text-xs space-y-1">
              <div className="flex justify-between">
                <span>Total Sales:</span>
                <span className="font-semibold">₦{sales.reduce((sum, sale) => sum + sale.total, 0).toLocaleString()}</span>
              </div>
              <div className="flex justify-between">
                <span>Transactions:</span>
                <span className="font-semibold">{sales.length}</span>
              </div>
              <div className="flex justify-between">
                <span>Avg. Sale:</span>
                <span className="font-semibold">
                  ₦{sales.length > 0 ? Math.round(sales.reduce((sum, sale) => sum + sale.total, 0) / sales.length).toLocaleString() : '0'}
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

