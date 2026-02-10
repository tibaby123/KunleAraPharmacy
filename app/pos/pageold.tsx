'use client'

import { useState, useMemo } from 'react'
import Link from 'next/link'
import { kunleAraProducts } from '../data/kunle_ara_products'

// TypeScript Interfaces
interface Product {
  id: string
  name: string
  price: number
  category: string
  brand?: string
  inStock: boolean
  stockQuantity: number
  prescriptionRequired: boolean
  barcode?: string
  image?: string
}

interface CartItem {
  product: Product
  quantity: number
}

interface Sale {
  id: string
  items: CartItem[]
  subtotal: number
  tax: number
  total: number
  discount: number
  paymentMethod: 'cash' | 'pos' | 'card'
  amountReceived: number
  change: number
  staffId: string
  customerName?: string
  customerPhone?: string
  branchId: string
  date: Date
}

// Branch Configuration
const branches = [
  { id: 'uch', name: 'UCH Branch', location: 'University College Hospital Area' },
  { id: 'yemetu', name: 'Yemetu Branch', location: 'Yemetu Area, Ibadan' },
  { id: 'ring-road', name: 'Ring Road Branch', location: 'Ring Road Area, Ibadan' }
]

// Categories for filtering
const categories = [
  { id: 'all', name: 'All Categories' },
  { id: 'prescription-drugs', name: 'Prescription Drugs' },
  { id: 'otc-medications', name: 'Over-the-Counter' },
  { id: 'supplements', name: 'Health Supplements' },
  { id: 'beverages', name: 'Beverages & Drinks' },
  { id: 'snacks', name: 'Snacks & Confectionery' },
  { id: 'personal-care', name: 'Personal Care' },
  { id: 'household', name: 'Household Items' },
  { id: 'baby-care', name: 'Baby Care' },
  { id: 'herbal-natural', name: 'Herbal & Natural' },
  { id: 'fitness-wellness', name: 'Fitness & Wellness' }
]

export default function POSPage() {
  // Authentication State
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [staffId, setStaffId] = useState('')
  const [password, setPassword] = useState('')
  const [selectedBranch, setSelectedBranch] = useState('')

  // Cart and Sales State
  const [cart, setCart] = useState<CartItem[]>([])
  const [sales, setSales] = useState<Sale[]>([])
  const [heldSales, setHeldSales] = useState<Sale[]>([])

  // Search and Filter State
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('all')

  // Customer and Payment State
  const [customerName, setCustomerName] = useState('')
  const [customerPhone, setCustomerPhone] = useState('')
  const [paymentMethod, setPaymentMethod] = useState<'cash' | 'card' | 'pos'>('cash')
  const [amountReceived, setAmountReceived] = useState(0)
  const [discount, setDiscount] = useState(0)

  // UI State
  const [showPaymentModal, setShowPaymentModal] = useState(false)

  /* ==================== AUTHENTICATION ==================== */

  const handleLogin = (e: React.FormEvent) => {
    e.preventDefault()
    if (staffId && password && selectedBranch) {
      setIsAuthenticated(true)
    } else {
      alert('Please fill in all fields')
    }
  }

  /* ==================== PRODUCT FILTERING ==================== */

  const filteredProducts = useMemo(() => {
    return kunleAraProducts.filter(product => {
      const matchesSearch = 
        product.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
        (product.barcode && product.barcode.includes(searchTerm))
      
      const matchesCategory = 
        selectedCategory === 'all' || product.category === selectedCategory
      
      return matchesSearch && matchesCategory && product.inStock
    })
  }, [searchTerm, selectedCategory])

  /* ==================== CART OPERATIONS ==================== */

  const addToCart = (product: any) => {
    const existingItem = cart.find(item => item.product.id === product.id)
    
    if (existingItem) {
      setCart(cart.map(item => 
        item.product.id === product.id 
          ? { ...item, quantity: item.quantity + 1 }
          : item
      ))
    } else {
      setCart([...cart, { product, quantity: 1 }])
    }
  }

  const updateQuantity = (productId: string, newQuantity: number) => {
    if (newQuantity <= 0) {
      setCart(cart.filter(item => item.product.id !== productId))
    } else {
      setCart(cart.map(item => 
        item.product.id === productId 
          ? { ...item, quantity: newQuantity }
          : item
      ))
    }
  }

  const clearCart = () => {
    setCart([])
    setCustomerName('')
    setCustomerPhone('')
    setDiscount(0)
    setAmountReceived(0)
  }

  /* ==================== CALCULATIONS ==================== */

  const subtotal = cart.reduce((sum, item) => sum + (item.product.price * item.quantity), 0)
  const tax = subtotal * 0.075 // 7.5% VAT
  const total = subtotal + tax - discount

  /* ==================== SALES OPERATIONS ==================== */

  const applyDiscount = () => {
    const discountInput = prompt('Enter discount amount (₦):')
    if (discountInput && !isNaN(Number(discountInput))) {
      const discountAmount = parseFloat(discountInput)
      if (discountAmount >= 0 && discountAmount <= subtotal) {
        setDiscount(discountAmount)
      } else {
        alert('Invalid discount amount')
      }
    }
  }

  const holdSale = () => {
    if (cart.length === 0) {
      alert('Cart is empty!')
      return
    }

    const heldSale: Sale = {
      id: `HOLD-${Date.now()}`,
      items: [...cart],
      subtotal,
      tax,
      total,
      discount,
      paymentMethod,
      amountReceived: 0,
      change: 0,
      staffId,
      customerName: customerName || 'Walk-in Customer',
      customerPhone,
      branchId: selectedBranch,
      date: new Date()
    }

    setHeldSales([...heldSales, heldSale])
    clearCart()
    alert('Sale held successfully!')
  }

  const processSale = () => {
    if (cart.length === 0) {
      alert('Cart is empty!')
      return
    }

    // Check for prescription items
    const prescriptionItems = cart.filter(item => item.product.prescriptionRequired)
    if (prescriptionItems.length > 0) {
      if (!confirm(`This sale contains ${prescriptionItems.length} prescription item(s). Continue?`)) {
        return
      }
    }

    // Validate cash payment
    if (paymentMethod === 'cash' && amountReceived < total) {
      alert(`Insufficient amount! Required: ₦${total.toLocaleString()}, Received: ₦${amountReceived.toLocaleString()}`)
      return
    }

    const newSale: Sale = {
      id: `SALE-${Date.now()}`,
      items: [...cart],
      subtotal,
      tax,
      total,
      discount,
      paymentMethod,
      amountReceived: paymentMethod === 'cash' ? amountReceived : total,
      change: paymentMethod === 'cash' ? Math.max(0, amountReceived - total) : 0,
      staffId,
      customerName: customerName || 'Walk-in Customer',
      customerPhone,
      branchId: selectedBranch,
      date: new Date()
    }

    setSales([newSale, ...sales])
    clearCart()
    
    if (confirm('Sale completed! Print receipt?')) {
      printReceipt(newSale)
    }
  }

  const printReceipt = (sale: Sale) => {
    const receiptWindow = window.open('', '_blank', 'width=400,height=600')
    if (!receiptWindow) return

    receiptWindow.document.write(`
      <html>
        <head>
          <title>Receipt - ${sale.id}</title>
          <style>
            body { font-family: 'Courier New', monospace; width: 350px; margin: 10px auto; font-size: 12px; }
            .center { text-align: center; }
            .right { text-align: right; }
            .bold { font-weight: bold; }
            hr { border: 1px solid #000; }
            .item-line { display: flex; justify-content: space-between; }
          </style>
        </head>
        <body>
          <div class="center bold">
            <h2>KUNLE ARA PHARMACY</h2>
            <p>${branches.find(b => b.id === sale.branchId)?.name || 'Main Branch'}</p>
          </div>
          <hr>
          <p>Receipt: ${sale.id}</p>
          <p>Date: ${sale.date.toLocaleString()}</p>
          <p>Staff: ${sale.staffId}</p>
          <p>Customer: ${sale.customerName}</p>
          ${sale.customerPhone ? `<p>Phone: ${sale.customerPhone}</p>` : ''}
          <hr>
          ${sale.items.map(item => `
            <div class="item-line">
              <span>${item.product.name}</span>
              <span>₦${(item.product.price * item.quantity).toLocaleString()}</span>
            </div>
            <div style="font-size: 10px; color: #666;">
              ${item.quantity} x ₦${item.product.price.toLocaleString()}
            </div>
          `).join('')}
          <hr>
          <div class="item-line">
            <span>Subtotal:</span>
            <span>₦${sale.subtotal.toLocaleString()}</span>
          </div>
          <div class="item-line">
            <span>VAT (7.5%):</span>
            <span>₦${sale.tax.toLocaleString()}</span>
          </div>
          ${sale.discount > 0 ? `
            <div class="item-line">
              <span>Discount:</span>
              <span>-₦${sale.discount.toLocaleString()}</span>
            </div>
          ` : ''}
          <hr>
          <div class="item-line bold">
            <span>TOTAL:</span>
            <span>₦${sale.total.toLocaleString()}</span>
          </div>
          <div class="item-line">
            <span>Payment Method:</span>
            <span>${sale.paymentMethod.toUpperCase()}</span>
          </div>
          ${sale.paymentMethod === 'cash' ? `
            <div class="item-line">
              <span>Amount Received:</span>
              <span>₦${sale.amountReceived.toLocaleString()}</span>
            </div>
            <div class="item-line">
              <span>Change:</span>
              <span>₦${sale.change.toLocaleString()}</span>
            </div>
          ` : ''}
          <hr>
          <div class="center">
            <p>Thank you for your patronage!</p>
            <p>Visit us again soon</p>
          </div>
        </body>
      </html>
    `)
    
    receiptWindow.document.close()
    receiptWindow.print()
  }

  /* ==================== LOGIN SCREEN ==================== */

  if (!isAuthenticated) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-green-50 to-blue-50 flex items-center justify-center">
        <div className="bg-white p-8 rounded-2xl shadow-2xl max-w-md w-full">
          <div className="text-center mb-8">
            <div className="text-4xl mb-4">🏥</div>
            <h1 className="text-3xl font-bold text-gray-800">Kunle Ara Pharmacy</h1>
            <h2 className="text-xl text-green-600 font-semibold">POS System</h2>
            <p className="text-gray-600 mt-2">Staff Login Required</p>
          </div>

          <form onSubmit={handleLogin} className="space-y-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Select Branch
              </label>
              <select
                value={selectedBranch}
                onChange={(e) => setSelectedBranch(e.target.value)}
                className="w-full p-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                required
              >
                <option value="">Choose your branch...</option>
                {branches.map(branch => (
                  <option key={branch.id} value={branch.id}>
                    {branch.name} - {branch.location}
                  </option>
                ))}
              </select>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Staff ID
              </label>
              <input
                type="text"
                value={staffId}
                onChange={(e) => setStaffId(e.target.value)}
                placeholder="Enter your staff ID"
                className="w-full p-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
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
                className="w-full p-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
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

          <div className="mt-6 text-center text-sm text-gray-500">
            <p>Demo: Select any branch + any credentials</p>
          </div>
        </div>
      </div>
    )
  }

  /* ==================== MAIN POS INTERFACE ==================== */

  return (
    <div className="min-h-screen bg-gray-100">
      {/* Header */}
      <div className="bg-green-600 text-white p-4">
        <div className="flex justify-between items-center">
          <div>
            <h1 className="text-2xl font-bold">Kunle Ara Pharmacy - POS</h1>
            <div className="flex items-center space-x-4 text-green-100">
              <span>📍 {branches.find(b => b.id === selectedBranch)?.name}</span>
              <span>👤 Staff: {staffId}</span>
              <span>📅 {new Date().toLocaleDateString()}</span>
            </div>
          </div>
          <div className="flex space-x-2">
            <Link href="/" className="bg-green-700 hover:bg-green-800 px-4 py-2 rounded transition-colors">
              Home
            </Link>
            <button
              onClick={() => setIsAuthenticated(false)}
              className="bg-green-700 hover:bg-green-800 px-4 py-2 rounded transition-colors"
            >
              Logout
            </button>
          </div>
        </div>
      </div>

      <div className="flex h-screen">
        {/* Products Section */}
        <div className="flex-1 p-4">
          {/* Search and Filter */}
          <div className="bg-white p-4 rounded-lg shadow mb-4">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <input
                type="text"
                placeholder="Search products or scan barcode..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
              />
              <select
                value={selectedCategory}
                onChange={(e) => setSelectedCategory(e.target.value)}
                className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
              >
                {categories.map(category => (
                  <option key={category.id} value={category.id}>
                    {category.name}
                  </option>
                ))}
              </select>
            </div>
          </div>

          {/* Products Grid */}
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 max-h-96 overflow-y-auto">
            {filteredProducts.map(product => (
              <button
                key={product.id}
                onClick={() => addToCart(product)}
                className="bg-white p-4 rounded-lg shadow hover:shadow-md transition-shadow text-left"
                disabled={!product.inStock}
              >
                <h3 className="font-semibold text-sm mb-1">{product.name}</h3>
                <p className="text-xs text-gray-600 mb-2">{product.brand}</p>
                <div className="flex justify-between items-center">
                  <span className="text-green-600 font-bold">₦{product.price.toLocaleString()}</span>
                  <span className="text-xs text-gray-500">{product.stockQuantity} left</span>
                </div>
                {product.prescriptionRequired && (
                  <div className="text-xs bg-red-100 text-red-800 px-1 py-0.5 rounded mt-1">
                    Rx Required
                  </div>
                )}
              </button>
            ))}
          </div>
        </div>

        {/* Cart Section */}
        <div className="w-96 bg-white border-l border-gray-200 p-4">
          <h2 className="text-xl font-bold mb-4">Current Sale</h2>

          {/* Customer Info */}
          <div className="space-y-2 mb-4">
            <input
              type="text"
              placeholder="Customer name (optional)"
              value={customerName}
              onChange={(e) => setCustomerName(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded"
            />
            <input
              type="text"
              placeholder="Customer phone (optional)"
              value={customerPhone}
              onChange={(e) => setCustomerPhone(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded"
            />
          </div>

          {/* Cart Items */}
          <div className="space-y-2 mb-4 max-h-64 overflow-y-auto">
            {cart.map(item => (
              <div key={item.product.id} className="bg-gray-50 p-3 rounded">
                <div className="flex justify-between items-start">
                  <div className="flex-1">
                    <h4 className="font-semibold text-sm">{item.product.name}</h4>
                    <p className="text-xs text-gray-600">₦{item.product.price.toLocaleString()} each</p>
                  </div>
                  <button
                    onClick={() => updateQuantity(item.product.id, 0)}
                    className="text-red-500 hover:text-red-700 text-xs"
                  >
                    Remove
                  </button>
                </div>
                <div className="flex items-center justify-between mt-2">
                  <div className="flex items-center space-x-2">
                    <button
                      onClick={() => updateQuantity(item.product.id, item.quantity - 1)}
                      className="bg-gray-200 hover:bg-gray-300 px-2 py-1 rounded text-sm"
                    >
                      -
                    </button>
                    <span className="font-semibold">{item.quantity}</span>
                    <button
                      onClick={() => updateQuantity(item.product.id, item.quantity + 1)}
                      className="bg-gray-200 hover:bg-gray-300 px-2 py-1 rounded text-sm"
                    >
                      +
                    </button>
                  </div>
                  <span className="font-bold">₦{(item.product.price * item.quantity).toLocaleString()}</span>
                </div>
              </div>
            ))}
          </div>

          {/* Payment Method */}
          <div className="mb-4">
            <label className="block text-sm font-medium mb-2">Payment Method:</label>
            <div className="flex space-x-2">
              <button
                onClick={() => setPaymentMethod('cash')}
                className={`flex-1 py-2 px-3 rounded text-sm ${
                  paymentMethod === 'cash' 
                    ? 'bg-green-600 text-white' 
                    : 'bg-gray-200 text-gray-700'
                }`}
              >
                Cash
              </button>
              <button
                onClick={() => setPaymentMethod('card')}
                className={`flex-1 py-2 px-3 rounded text-sm ${
                  paymentMethod === 'card' 
                    ? 'bg-green-600 text-white' 
                    : 'bg-gray-200 text-gray-700'
                }`}
              >
                Card
              </button>
              <button
                onClick={() => setPaymentMethod('pos')}
                className={`flex-1 py-2 px-3 rounded text-sm ${
                  paymentMethod === 'pos' 
                    ? 'bg-green-600 text-white' 
                    : 'bg-gray-200 text-gray-700'
                }`}
              >
                POS
              </button>
            </div>
          </div>

          {/* Cash Payment Input */}
          {paymentMethod === 'cash' && (
            <div className="mb-4">
              <label className="block text-sm font-medium mb-2">Amount Received:</label>
              <input
                type="number"
                value={amountReceived}
                onChange={(e) => setAmountReceived(parseFloat(e.target.value) || 0)}
                className="w-full p-2 border border-gray-300 rounded"
                placeholder="Enter amount received"
              />
              {amountReceived > 0 && (
                <p className="text-sm text-gray-600 mt-1">
                  Change: ₦{Math.max(0, amountReceived - total).toLocaleString()}
                </p>
              )}
            </div>
          )}

          {/* Totals */}
          <div className="border-t pt-4 space-y-2">
            <div className="flex justify-between">
              <span>Subtotal:</span>
              <span>₦{subtotal.toLocaleString()}</span>
            </div>
            <div className="flex justify-between">
              <span>VAT (7.5%):</span>
              <span>₦{tax.toLocaleString()}</span>
            </div>
            {discount > 0 && (
              <div className="flex justify-between text-green-600">
                <span>Discount:</span>
                <span>-₦{discount.toLocaleString()}</span>
              </div>
            )}
            <div className="flex justify-between font-bold text-lg border-t pt-2">
              <span>Total:</span>
              <span className="text-green-600">₦{total.toLocaleString()}</span>
            </div>
          </div>

          {/* Action Buttons */}
          <div className="space-y-2 mt-4">
            <button
              onClick={processSale}
              disabled={cart.length === 0}
              className="w-full bg-green-600 text-white py-3 rounded-lg hover:bg-green-700 disabled:bg-gray-400 disabled:cursor-not-allowed font-semibold"
            >
              Complete Sale (₦{total.toLocaleString()})
            </button>
            
            <div className="grid grid-cols-2 gap-2">
              <button
                onClick={applyDiscount}
                disabled={cart.length === 0}
                className="bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700 disabled:bg-gray-400 text-sm"
              >
                Apply Discount
              </button>
              <button
                onClick={holdSale}
                disabled={cart.length === 0}
                className="bg-yellow-600 text-white py-2 rounded-lg hover:bg-yellow-700 disabled:bg-gray-400 text-sm"
              >
                Hold Sale
              </button>
            </div>
            
            <button
              onClick={clearCart}
              className="w-full bg-red-600 text-white py-2 rounded-lg hover:bg-red-700"
            >
              Clear Cart
            </button>
          </div>

          {/* Recent Sales */}
          <div className="mt-6">
            <h3 className="font-semibold mb-2">Recent Sales ({sales.length})</h3>
            <div className="text-xs space-y-1 max-h-32 overflow-y-auto">
              {sales.slice(0, 5).map(sale => (
                <div key={sale.id} className="bg-gray-50 p-2 rounded">
                  <div className="flex justify-between">
                    <span>{sale.customerName}</span>
                    <span>₦{sale.total.toLocaleString()}</span>
                  </div>
                  <div className="text-gray-500">{sale.date.toLocaleTimeString()}</div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
