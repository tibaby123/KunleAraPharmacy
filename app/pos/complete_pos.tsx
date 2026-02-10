'use client'

import { useState, useMemo, useEffect } from 'react'
import { kunleAraProducts } from '../data/kunle_ara_products'
import { categories } from '../lib/database'

interface CartItem {
  product: any
  quantity: number
}

interface Sale {
  id: string
  items: CartItem[]
  subtotal: number
  tax: number
  total: number
  paymentMethod: 'cash' | 'card' | 'insurance' | 'refund'
  customerName?: string
  customerPhone?: string
  insuranceProvider?: string
  date: Date
  staffId: string
  branchId: string
  receiptNumber: string
}

interface DailySummary {
  totalSales: number
  totalTransactions: number
  cashSales: number
  cardSales: number
  insuranceSales: number
  refunds: number
  topProducts: Array<{name: string, quantity: number, revenue: number}>
}

export default function CompletePOSPage() {
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [staffId, setStaffId] = useState('')
  const [password, setPassword] = useState('')
  const [currentBranch, setCurrentBranch] = useState('uch')
  const [cart, setCart] = useState<CartItem[]>([])
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('all')
  const [customerName, setCustomerName] = useState('')
  const [customerPhone, setCustomerPhone] = useState('')
  const [paymentMethod, setPaymentMethod] = useState<'cash' | 'card' | 'insurance' | 'refund'>('cash')
  const [insuranceProvider, setInsuranceProvider] = useState('')
  const [sales, setSales] = useState<Sale[]>([])
  const [showReports, setShowReports] = useState(false)
  const [showReceipt, setShowReceipt] = useState(false)
  const [lastSale, setLastSale] = useState<Sale | null>(null)

const [showShortcuts, setShowShortcuts] = useState(false)
const [showReceipt, setShowReceipt] = useState(false)
const [lastSale, setLastSale] = useState<Sale | null>(null)


  // Calculate totals
  const subtotal = cart.reduce((sum, item) => sum + (item.product.price * item.quantity), 0)
  const tax = subtotal * 0.075 // 7.5% VAT
  const total = subtotal + tax

  // Filter products
  const filteredProducts = useMemo(() => {
    return kunleAraProducts.filter(product => {
      const matchesSearch = product.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                          product.description.toLowerCase().includes(searchTerm.toLowerCase())
      const matchesCategory = selectedCategory === 'all' || product.category === selectedCategory
      return matchesSearch && matchesCategory && product.inStock
    })
  }, [searchTerm, selectedCategory])

  // Authentication
  const handleLogin = (e: React.FormEvent) => {
    e.preventDefault()
    if (staffId && password) {
      setIsAuthenticated(true)
    }
  }

  // Cart functions
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
  setLastSale(newSale) // Set for receipt display
  setCart([])
  setCustomerName('')
  setShowReceipt(true) // Show receipt automatically
  
  // Success message
  alert(`Sale completed! Total: ₦${total.toLocaleString()}`)
}

    // Validate payment method requirements
    if (paymentMethod === 'insurance' && !insuranceProvider) {
      alert('Please select insurance provider')
      return
    }

    const receiptNumber = `KAP-${Date.now()}`
    
    const newSale: Sale = {
      id: `SALE-${Date.now()}`,
      items: [...cart],
      subtotal,
      tax,
      total,
      paymentMethod,
      customerName: customerName || 'Walk-in Customer',
      customerPhone,
      insuranceProvider: paymentMethod === 'insurance' ? insuranceProvider : undefined,
      date: new Date(),
      staffId,
      branchId: currentBranch,
      receiptNumber
    }

    setSales([...sales, newSale])
    setLastSale(newSale)
    setCart([])
    setCustomerName('')
    setCustomerPhone('')
    setInsuranceProvider('')
    setPaymentMethod('cash')
    setShowReceipt(true)
    
    // Success message based on payment method
    const paymentMessages = {
      cash: `💵 Cash payment of ₦${total.toLocaleString()} completed!`,
      card: `💳 Card payment of ₦${total.toLocaleString()} processed!`,
      insurance: `🏥 Insurance claim of ₦${total.toLocaleString()} submitted to ${insuranceProvider}!`,
      refund: `↩️ Refund of ₦${total.toLocaleString()} processed!`
    }
    
    alert(paymentMessages[paymentMethod])
  }

  // Calculate daily summary
  const getDailySummary = (): DailySummary => {
    const today = new Date().toDateString()
    const todaySales = sales.filter(sale => sale.date.toDateString() === today)
    
    const summary = {
      totalSales: todaySales.reduce((sum, sale) => sum + sale.total, 0),
      totalTransactions: todaySales.length,
      cashSales: todaySales.filter(s => s.paymentMethod === 'cash').reduce((sum, sale) => sum + sale.total, 0),
      cardSales: todaySales.filter(s => s.paymentMethod === 'card').reduce((sum, sale) => sum + sale.total, 0),
      insuranceSales: todaySales.filter(s => s.paymentMethod === 'insurance').reduce((sum, sale) => sum + sale.total, 0),
      refunds: todaySales.filter(s => s.paymentMethod === 'refund').reduce((sum, sale) => sum + sale.total, 0),
      topProducts: []
    }
    
    // Calculate top products
    const productMap = new Map()
    todaySales.forEach(sale => {
      sale.items.forEach(item => {
        const existing = productMap.get(item.product.name) || { quantity: 0, revenue: 0 }
        productMap.set(item.product.name, {
          name: item.product.name,
          quantity: existing.quantity + item.quantity,
          revenue: existing.revenue + (item.product.price * item.quantity)
        })
      })
    })
    
    summary.topProducts = Array.from(productMap.values())
      .sort((a, b) => b.revenue - a.revenue)
      .slice(0, 5)
    
    return summary
  }

  // Login Screen
  if (!isAuthenticated) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-green-50 to-blue-50 flex items-center justify-center">
        <div className="bg-white p-8 rounded-2xl shadow-2xl max-w-md w-full">
          <div className="text-center mb-8">
            <div className="text-4xl mb-4">🏥</div>
            <h1 className="text-3xl font-bold text-gray-800">Kunle Ara Pharmacy</h1>
            <h2 className="text-xl text-green-600 font-semibold">Complete POS System</h2>
          </div>

          <form onSubmit={handleLogin} className="space-y-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Branch Location</label>
              <select
                value={currentBranch}
                onChange={(e) => setCurrentBranch(e.target.value)}
                className="w-full p-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
              >
                <option value="uch">🏥 UCH Branch</option>
                <option value="yemetu">🏪 Yemetu Branch</option>
                <option value="ring-road">🏢 Ring Road Branch</option>
              </select>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Staff ID</label>
              <input
                type="text"
                value={staffId}
                onChange={(e) => setStaffId(e.target.value)}
                className="w-full p-4 border border-gray-300 rounded-lg"
                required
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Password</label>
              <input
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="w-full p-4 border border-gray-300 rounded-lg"
                required
              />
            </div>

            <button type="submit" className="w-full bg-green-600 text-white py-4 rounded-lg hover:bg-green-700 font-semibold">
              Login to POS System
            </button>
          </form>
        </div>
      </div>
    )
  }

  // Receipt Modal
  if (showReceipt && lastSale) {
    return (
      <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
        <div className="bg-white p-8 rounded-lg max-w-md w-full">
          <div className="text-center mb-6">
            <h2 className="text-2xl font-bold">🧾 RECEIPT</h2>
            <p className="text-gray-600">Kunle Ara Pharmacy - {currentBranch.toUpperCase()}</p>
            <p className="text-sm">Receipt #: {lastSale.receiptNumber}</p>
            <p className="text-sm">{lastSale.date.toLocaleString()}</p>
          </div>

          <div className="border-t border-b py-4 mb-4">
            <p><strong>Customer:</strong> {lastSale.customerName}</p>
            {lastSale.customerPhone && <p><strong>Phone:</strong> {lastSale.customerPhone}</p>}
            <p><strong>Staff:</strong> {lastSale.staffId}</p>
            <p><strong>Payment:</strong> {lastSale.paymentMethod.toUpperCase()}</p>
            {lastSale.insuranceProvider && <p><strong>Insurance:</strong> {lastSale.insuranceProvider}</p>}
          </div>

          <div className="space-y-2 mb-4">
            {lastSale.items.map((item, index) => (
              <div key={index} className="flex justify-between">
                <span>{item.product.name} x{item.quantity}</span>
                <span>₦{(item.product.price * item.quantity).toLocaleString()}</span>
              </div>
            ))}
          </div>

          <div className="border-t pt-4 space-y-1">
            <div className="flex justify-between"><span>Subtotal:</span><span>₦{lastSale.subtotal.toLocaleString()}</span></div>
            <div className="flex justify-between"><span>VAT (7.5%):</span><span>₦{lastSale.tax.toLocaleString()}</span></div>
            <div className="flex justify-between font-bold text-lg"><span>Total:</span><span>₦{lastSale.total.toLocaleString()}</span></div>
          </div>

          <button
            onClick={() => setShowReceipt(false)}
            className="w-full mt-6 bg-green-600 text-white py-2 rounded-lg"
          >
            Close Receipt
          </button>
        </div>
      </div>
    )
  }

  // Reports Screen
  if (showReports) {
    const dailySummary = getDailySummary()
    
    return (
      <div className="min-h-screen bg-gray-100">
        <div className="bg-green-600 text-white p-4">
          <div className="flex justify-between items-center">
            <h1 className="text-2xl font-bold">📊 Daily Reports - {currentBranch.toUpperCase()}</h1>
            <button
              onClick={() => setShowReports(false)}
              className="bg-green-700 px-4 py-2 rounded"
            >
              ← Back to POS
            </button>
          </div>
        </div>

        <div className="p-6">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
            <div className="bg-white p-6 rounded-lg shadow">
              <h3 className="text-lg font-semibold text-gray-600">Total Sales</h3>
              <p className="text-3xl font-bold text-green-600">₦{dailySummary.totalSales.toLocaleString()}</p>
            </div>
            <div className="bg-white p-6 rounded-lg shadow">
              <h3 className="text-lg font-semibold text-gray-600">Transactions</h3>
              <p className="text-3xl font-bold text-blue-600">{dailySummary.totalTransactions}</p>
            </div>
            <div className="bg-white p-6 rounded-lg shadow">
              <h3 className="text-lg font-semibold text-gray-600">Cash Sales</h3>
              <p className="text-2xl font-bold text-green-500">₦{dailySummary.cashSales.toLocaleString()}</p>
            </div>
            <div className="bg-white p-6 rounded-lg shadow">
              <h3 className="text-lg font-semibrel text-gray-600">Card Sales</h3>
              <p className="text-2xl font-bold text-purple-500">₦{dailySummary.cardSales.toLocaleString()}</p>
            </div>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
            <div className="bg-white p-6 rounded-lg shadow">
              <h3 className="text-xl font-bold mb-4">💳 Payment Methods</h3>
              <div className="space-y-3">
                <div className="flex justify-between">
                  <span>💵 Cash:</span>
                  <span className="font-semibold">₦{dailySummary.cashSales.toLocaleString()}</span>
                </div>
                <div className="flex justify-between">
                  <span>💳 Card:</span>
                  <span className="font-semibold">₦{dailySummary.cardSales.toLocaleString()}</span>
                </div>
                <div className="flex justify-between">
                  <span>🏥 Insurance:</span>
                  <span className="font-semibold">₦{dailySummary.insuranceSales.toLocaleString()}</span>
                </div>
                <div className="flex justify-between text-red-600">
                  <span>↩️ Refunds:</span>
                  <span className="font-semibold">₦{dailySummary.refunds.toLocaleString()}</span>
                </div>
              </div>
            </div>

            <div className="bg-white p-6 rounded-lg shadow">
              <h3 className="text-xl font-bold mb-4">🏆 Top Products</h3>
              <div className="space-y-3">
                {dailySummary.topProducts.map((product, index) => (
                  <div key={index} className="flex justify-between">
                    <div>
                      <span className="font-medium">{product.name}</span>
                      <span className="text-gray-500 text-sm ml-2">({product.quantity} sold)</span>
                    </div>
                    <span className="font-semibold">₦{product.revenue.toLocaleString()}</span>
                  </div>
                ))}
              </div>
            </div>
          </div>

          <div className="mt-8 bg-white p-6 rounded-lg shadow">
            <h3 className="text-xl font-bold mb-4">📋 Recent Transactions</h3>
            <div className="overflow-x-auto">
              <table className="w-full table-auto">
                <thead>
                  <tr className="bg-gray-50">
                    <th className="p-3 text-left">Time</th>
                    <th className="p-3 text-left">Receipt #</th>
                    <th className="p-3 text-left">Customer</th>
                    <th className="p-3 text-left">Payment</th>
                    <th className="p-3 text-right">Amount</th>
                  </tr>
                </thead>
                <tbody>
                  {sales.slice(-10).reverse().map((sale, index) => (
                    <tr key={index} className="border-b">
                      <td className="p-3">{sale.date.toLocaleTimeString()}</td>
                      <td className="p-3 font-mono text-sm">{sale.receiptNumber}</td>
                      <td className="p-3">{sale.customerName}</td>
                      <td className="p-3">
                        <span className={`px-2 py-1 rounded text-xs font-medium ${
                          sale.paymentMethod === 'cash' ? 'bg-green-100 text-green-800' :
                          sale.paymentMethod === 'card' ? 'bg-purple-100 text-purple-800' :
                          sale.paymentMethod === 'insurance' ? 'bg-blue-100 text-blue-800' :
                          'bg-red-100 text-red-800'
                        }`}>
                          {sale.paymentMethod.toUpperCase()}
                        </span>
                      </td>
                      <td className="p-3 text-right font-semibold">₦{sale.total.toLocaleString()}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    )
  }

  // Main POS Interface
  return (
    <div className="min-h-screen bg-gray-100">
      {/* Header */}
      <div className="bg-green-600 text-white p-4">
        <div className="flex justify-between items-center">
          <div>
            <h1 className="text-2xl font-bold">Kunle Ara Pharmacy - Complete POS</h1>
            <p className="text-green-100">Staff: {staffId} | Branch: {currentBranch.toUpperCase()} | Products: {kunleAraProducts.length}</p>
          </div>
          <div className="flex gap-4">
            <button
              onClick={() => setShowReports(true)}
              className="bg-green-700 hover:bg-green-800 px-4 py-2 rounded"
            >
              📊 Reports
            </button>
            <button
              onClick={() => setIsAuthenticated(false)}
              className="bg-green-700 hover:bg-green-800 px-4 py-2 rounded"
            >
              Logout
            </button>
          </div>
        </div>
      </div>

      <div className="flex h-screen">
        {/* Product Selection */}
        <div className="flex-1 p-4">
          {/* Search and Filter */}
          <div className="bg-white p-4 rounded-lg shadow mb-4">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <input
                type="text"
                placeholder="Search products..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="w-full p-3 border rounded-lg"
              />
              <select
                value={selectedCategory}
                onChange={(e) => setSelectedCategory(e.target.value)}
                className="w-full p-3 border rounded-lg"
              >
                <option value="all">All Categories ({kunleAraProducts.length})</option>
                <option value="prescription-drugs">💊 Prescription Drugs</option>
                <option value="otc-medications">🏥 Over-the-Counter</option>
                <option value="supplements">💪 Health Supplements</option>
                <option value="beverages">🥤 Beverages & Drinks</option>
                <option value="snacks">🍿 Snacks & Confectionery</option>
                <option value="personal-care">🧴 Personal Care</option>
                <option value="household">🏠 Household Items</option>
                <option value="baby-care">👶 Baby Care</option>
                <option value="herbal-natural">🌿 Herbal & Natural</option>
                <option value="fitness-wellness">🏃 Fitness & Wellness</option>
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
              >
                <h3 className="font-semibold text-sm mb-1 line-clamp-2">{product.name}</h3>
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

        {/* Checkout Area */}
        <div className="w-96 bg-white border-l p-4">
          <h2 className="text-xl font-bold mb-4">Current Sale</h2>

          {/* Customer Info */}
          <div className="mb-4 space-y-2">
            <input
              type="text"
              placeholder="Customer name (optional)"
              value={customerName}
              onChange={(e) => setCustomerName(e.target.value)}
              className="w-full p-2 border rounded"
            />
            <input
              type="tel"
              placeholder="Phone number (optional)"
              value={customerPhone}
              onChange={(e) => setCustomerPhone(e.target.value)}
              className="w-full p-2 border rounded"
            />
          </div>

          {/* Payment Method Selection */}
          <div className="mb-4">
            <label className="block text-sm font-medium mb-2">Payment Method</label>
            <div className="grid grid-cols-2 gap-2 mb-3">
              <button
                onClick={() => setPaymentMethod('cash')}
                className={`p-2 rounded text-sm font-medium ${
                  paymentMethod === 'cash' ? 'bg-green-500 text-white' : 'bg-gray-200'
                }`}
              >
                💵 Cash
              </button>
              <button
                onClick={() => setPaymentMethod('card')}
                className={`p-2 rounded text-sm font-medium ${
                  paymentMethod === 'card' ? 'bg-purple-500 text-white' : 'bg-gray-200'
                }`}
              >
                💳 Card
              </button>
              <button
                onClick={() => setPaymentMethod('insurance')}
                className={`p-2 rounded text-sm font-medium ${
                  paymentMethod === 'insurance' ? 'bg-blue-500 text-white' : 'bg-gray-200'
                }`}
              >
                🏥 Insurance
              </button>
              <button
                onClick={() => setPaymentMethod('refund')}
                className={`p-2 rounded text-sm font-medium ${
                  paymentMethod === 'refund' ? 'bg-red-500 text-white' : 'bg-gray-200'
                }`}
              >
                ↩️ Refund
              </button>
            </div>

            {paymentMethod === 'insurance' && (
              <select
                value={insuranceProvider}
                onChange={(e) => setInsuranceProvider(e.target.value)}
                className="w-full p-2 border rounded"
                required
              >
                <option value="">Select Insurance Provider</option>
                <option value="NHIS">NHIS</option>
                <option value="NNPC">NNPC Medical</option>
                <option value="Shell">Shell Health</option>
                <option value="Hygeia">Hygeia HMO</option>
                <option value="Reliance">Reliance HMO</option>
                <option value="Other">Other</option>
              </select>
            )}
          </div>

          {/* Cart Items */}
          <div className="space-y-2 mb-4 max-h-48 overflow-y-auto">
            {cart.map(item => (
              <div key={item.product.id} className="bg-gray-50 p-3 rounded">
                <div className="flex justify-between items-start mb-2">
                  <h4 className="font-semibold text-sm">{item.product.name}</h4>
                  <button
                    onClick={() => updateQuantity(item.product.id, 0)}
                    className="text-red-500 text-xs"
                  >
                    Remove
                  </button>
                </div>
                <div className="flex items-center justify-between">
                  <div className="flex items-center space-x-2">
                    <button
                      onClick={() => updateQuantity(item.product.id, item.quantity - 1)}
                      className="bg-gray-300 px-2 py-1 rounded text-sm"
                    >
                      -
                    </button>
                    <span>{item.quantity}</span>
                    <button
                      onClick={() => updateQuantity(item.product.id, item.quantity + 1)}
                      className="bg-gray-300 px-2 py-1 rounded text-sm"
                    >
                      +
                    </button>
                  </div>
                  <span className="font-bold">₦{(item.product.price * item.quantity).toLocaleString()}</span>
                </div>
              </div>
            ))}
          </div>

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
              className={`w-full py-3 rounded-lg font-semibold ${
                paymentMethod === 'cash' ? 'bg-green-600 hover:bg-green-700' :
                paymentMethod === 'card' ? 'bg-purple-600 hover:bg-purple-700' :
                paymentMethod === 'insurance' ? 'bg-blue-600 hover:bg-blue-700' :
                'bg-red-600 hover:bg-red-700'
              } text-white disabled:bg-gray-400`}
            >
              {paymentMethod === 'cash' ? '💵 Process Cash Payment' :
               paymentMethod === 'card' ? '💳 Process Card Payment' :
               paymentMethod === 'insurance' ? '🏥 Submit Insurance Claim' :
               '↩️ Process Refund'} (₦{total.toLocaleString()})
            </button>
            <button
              onClick={() => setCart([])}
              className="w-full bg-gray-500 text-white py-2 rounded-lg hover:bg-gray-600"
            >
              Clear Cart
            </button>
          </div>

         
          {/* Recent Sales */}
          <div className="mt-6">
            <h3 className="font-semibold mb-2">Recent Sales ({sales.length})</h3>
            <div className="text-xs space-y-1 max-h-32 overflow-y-auto">
              {sales.slice(-5).reverse().map(sale => (
                <div key={sale.id} className="bg-gray-50 p-2 rounded">
                  <div className="flex justify-between items-start">
                    <div className="flex-1">
                      <div className="font-medium text-gray-800">
                        {sale.customerName || 'Walk-in Customer'}
                      </div>
                      <div className="text-gray-500">
                        {sale.date.toLocaleTimeString()} - {sale.items.length} items
                      </div>
                      <div className="text-xs text-gray-400 mt-1">
                        ID: {sale.id}
                      </div>
                    </div>
                    <div className="text-right">
                      <div className="font-bold text-green-600">
                        ₦{sale.total.toLocaleString()}
                      </div>
                      <div className="text-xs text-gray-500">
                        by {sale.staffId}
                      </div>
                    </div>
                  </div>
                  
                  {/* Sale Items Preview */}
                  <div className="mt-2 pt-2 border-t border-gray-200">
                    <div className="text-xs text-gray-600">
                      {sale.items.slice(0, 2).map((item, index) => (
                        <div key={index} className="flex justify-between">
                          <span>{item.product.name}</span>
                          <span>×{item.quantity}</span>
                        </div>
                      ))}
                      {sale.items.length > 2 && (
                        <div className="text-gray-400 italic">
                          +{sale.items.length - 2} more items...
                        </div>
                      )}
                    </div>
                  </div>
                </div>
              ))}
              
              {sales.length === 0 && (
                <div className="text-center py-4 text-gray-500">
                  <div className="text-2xl mb-2">🧾</div>
                  <p>No sales yet today</p>
                  <p className="text-xs">Sales will appear here</p>
                </div>
              )}
            </div>
            
            {/* Quick Stats */}
            <div className="mt-4 pt-4 border-t border-gray-200">
              <div className="grid grid-cols-2 gap-4 text-xs">
                <div className="bg-blue-50 p-2 rounded">
                  <div className="font-semibold text-blue-800">Today's Sales</div>
                  <div className="text-lg font-bold text-blue-600">
                    {sales.length}
                  </div>
                </div>
                <div className="bg-green-50 p-2 rounded">
                  <div className="font-semibold text-green-800">Total Revenue</div>
                  <div className="text-lg font-bold text-green-600">
                    ₦{sales.reduce((sum, sale) => sum + sale.total, 0).toLocaleString()}
                  </div>
                </div>
              </div>
              
              {/* Average Sale Value */}
              {sales.length > 0 && (
                <div className="mt-2 bg-purple-50 p-2 rounded">
                  <div className="text-xs font-semibold text-purple-800">Average Sale</div>
                  <div className="text-sm font-bold text-purple-600">
                    ₦{Math.round(sales.reduce((sum, sale) => sum + sale.total, 0) / sales.length).toLocaleString()}
                  </div>
                </div>
              )}
            </div>

            {/* Action Buttons */}
            <div className="mt-4 space-y-2">
              <button
                onClick={() => {
                  const salesData = JSON.stringify(sales, null, 2);
                  const blob = new Blob([salesData], { type: 'application/json' });
                  const url = URL.createObjectURL(blob);
                  const a = document.createElement('a');
                  a.href = url;
                  a.download = `sales-${new Date().toISOString().split('T')[0]}.json`;
                  document.body.appendChild(a);
                  a.click();
                  document.body.removeChild(a);
                  URL.revokeObjectURL(url);
                }}
                className="w-full bg-blue-500 text-white py-2 px-3 rounded text-xs hover:bg-blue-600 transition-colors"
              >
                📁 Export Sales Data
              </button>
              
              <button
                onClick={() => {
                  if (window.confirm('Clear all sales data? This cannot be undone.')) {
                    setSales([]);
                  }
                }}
                className="w-full bg-red-500 text-white py-2 px-3 rounded text-xs hover:bg-red-600 transition-colors"
              >
                🗑️ Clear Sales History
              </button>
              
              <button
                onClick={() => window.print()}
                className="w-full bg-gray-500 text-white py-2 px-3 rounded text-xs hover:bg-gray-600 transition-colors"
              >
                🖨️ Print Receipt
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* Keyboard Shortcuts Modal */}
      {showShortcuts && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white p-6 rounded-lg max-w-md w-full mx-4">
            <h3 className="text-lg font-semibold mb-4">⌨️ Keyboard Shortcuts</h3>
            <div className="space-y-2 text-sm">
              <div className="flex justify-between">
                <span>Search Products:</span>
                <code className="bg-gray-100 px-2 py-1 rounded">Ctrl + F</code>
              </div>
              <div className="flex justify-between">
                <span>Clear Cart:</span>
                <code className="bg-gray-100 px-2 py-1 rounded">Ctrl + D</code>
              </div>
              <div className="flex justify-between">
                <span>Complete Sale:</span>
                <code className="bg-gray-100 px-2 py-1 rounded">Ctrl + Enter</code>
              </div>
              <div className="flex justify-between">
                <span>Focus Search:</span>
                <code className="bg-gray-100 px-2 py-1 rounded">F3</code>
              </div>
              <div className="flex justify-between">
                <span>New Sale:</span>
                <code className="bg-gray-100 px-2 py-1 rounded">F1</code>
              </div>
            </div>
            <button
              onClick={() => setShowShortcuts(false)}
              className="mt-4 w-full bg-gray-500 text-white py-2 rounded hover:bg-gray-600"
            >
              Close
            </button>
          </div>
        </div>
      )}

      {/* Receipt Modal */}
      {showReceipt && lastSale && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white p-6 rounded-lg max-w-sm w-full mx-4">
            <div className="text-center mb-4">
              <h2 className="text-xl font-bold">Kunle Ara Pharmacy</h2>
              <p className="text-sm text-gray-600">{currentBranch?.name}</p>
              <p className="text-xs text-gray-500">{currentBranch?.location}</p>
              <div className="border-t border-dashed border-gray-300 my-2"></div>
            </div>

            <div className="mb-4">
              <div className="flex justify-between text-sm">
                <span>Receipt #:</span>
                <span>{lastSale.id}</span>
              </div>
              <div className="flex justify-between text-sm">
                <span>Date:</span>
                <span>{lastSale.date.toLocaleString()}</span>
              </div>
              <div className="flex justify-between text-sm">
                <span>Staff:</span>
                <span>{staffId}</span>
              </div>
              <div className="flex justify-between text-sm">
                <span>Customer:</span>
                <span>{lastSale.customerName}</span>
              </div>
            </div>

            <div className="border-t border-gray-300 pt-2 mb-4">
              <div className="space-y-1">
                {lastSale.items.map((item, index) => (
                  <div key={index} className="flex justify-between text-sm">
                    <div className="flex-1">
                      <div>{item.product.name}</div>
                      <div className="text-xs text-gray-500">
                        ₦{item.product.price.toLocaleString()} × {item.quantity}
                      </div>
                    </div>
                    <div className="font-semibold">
                      ₦{(item.product.price * item.quantity).toLocaleString()}
                    </div>
                  </div>
                ))}
              </div>
            </div>

            <div className="border-t border-gray-300 pt-2 mb-4">
              <div className="flex justify-between">
                <span>Subtotal:</span>
                <span>₦{(lastSale.total / 1.075).toLocaleString()}</span>
              </div>
              <div className="flex justify-between">
                <span>VAT (7.5%):</span>
                <span>₦{(lastSale.total - (lastSale.total / 1.075)).toLocaleString()}</span>
              </div>
              <div className="flex justify-between font-bold text-lg border-t border-gray-300 pt-2">
                <span>Total:</span>
                <span>₦{lastSale.total.toLocaleString()}</span>
              </div>
            </div>

            <div className="text-center text-xs text-gray-500 mb-4">
              <p>Thank you for shopping with us!</p>
              <p>Visit us again soon</p>
            </div>

            <div className="space-y-2">
              <button
                onClick={() => window.print()}
                className="w-full bg-green-500 text-white py-2 rounded hover:bg-green-600"
              >
                🖨️ Print Receipt
              </button>
              <button
                onClick={() => setShowReceipt(false)}
                className="w-full bg-gray-500 text-white py-2 rounded hover:bg-gray-600"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
