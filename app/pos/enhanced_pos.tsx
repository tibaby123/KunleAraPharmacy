'use client'

import { useState, useMemo, useEffect } from 'react'
import { kunleAraProducts } from '../data/kunle_ara_products'
import { categories } from '../lib/database'

interface CartItem {
  product: any
  quantity: number
  prescriptionVerified?: boolean
  prescriptionId?: string
}

interface Sale {
  id: string
  items: CartItem[]
  subtotal: number
  tax: number
  total: number
  date: Date
  staffId: string
  customerName?: string
  prescriptions: PrescriptionRecord[]
  paymentMethod: 'cash' | 'card' | 'transfer'
}

interface PrescriptionRecord {
  id: string
  productId: string
  productName: string
  prescriptionNumber: string
  doctorName: string
  patientName: string
  dosage: string
  instructions: string
  verifiedBy: string
  verifiedAt: Date
}

interface ReturnItem {
  saleId: string
  productId: string
  productName: string
  quantity: number
  reason: string
  refundAmount: number
  returnedAt: Date
  processedBy: string
}

export default function EnhancedPOSPage() {
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [staffId, setStaffId] = useState('')
  const [password, setPassword] = useState('')
  const [staffRole, setStaffRole] = useState<'pharmacist' | 'technician' | 'cashier'>('cashier')
  const [currentBranch, setCurrentBranch] = useState('UCH Branch')
  
  // POS State
  const [cart, setCart] = useState<CartItem[]>([])
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('all')
  const [customerName, setCustomerName] = useState('')
  const [paymentMethod, setPaymentMethod] = useState<'cash' | 'card' | 'transfer'>('cash')
  
  // Prescription State
  const [prescriptionModal, setPrescriptionModal] = useState(false)
  const [currentPrescriptionProduct, setCurrentPrescriptionProduct] = useState<any>(null)
  const [prescriptionData, setPrescriptionData] = useState({
    prescriptionNumber: '',
    doctorName: '',
    patientName: '',
    dosage: '',
    instructions: ''
  })
  
  // Reports State
  const [showReports, setShowReports] = useState(false)
  const [reportType, setReportType] = useState<'daily' | 'monthly' | 'inventory' | 'staff'>('daily')
  const [reportDate, setReportDate] = useState(new Date().toISOString().split('T')[0])
  
  // Returns State
  const [showReturns, setShowReturns] = useState(false)
  const [returnSaleId, setReturnSaleId] = useState('')
  const [returnReason, setReturnReason] = useState('')
  
  // Data Storage
  const [sales, setSales] = useState<Sale[]>([])
  const [prescriptions, setPrescriptions] = useState<PrescriptionRecord[]>([])
  const [returns, setReturns] = useState<ReturnItem[]>([])

  // Login with role detection
  const handleLogin = (e: React.FormEvent) => {
    e.preventDefault()
    if (staffId && password) {
      // Simulate role detection based on staff ID
      if (staffId.toLowerCase().startsWith('ph')) {
        setStaffRole('pharmacist')
      } else if (staffId.toLowerCase().startsWith('tech')) {
        setStaffRole('technician')
      } else {
        setStaffRole('cashier')
      }
      setIsAuthenticated(true)
    }
  }

  // Check if staff can handle prescriptions
  const canHandlePrescriptions = staffRole === 'pharmacist' || staffRole === 'technician'

  // Add to cart with prescription check
  const addToCart = (product: any) => {
    if (product.prescriptionRequired && !canHandlePrescriptions) {
      alert('❌ Only pharmacists and technicians can handle prescription medications!')
      return
    }

    if (product.prescriptionRequired) {
      setCurrentPrescriptionProduct(product)
      setPrescriptionModal(true)
      return
    }

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

  // Handle prescription verification
  const handlePrescriptionVerification = () => {
    if (!prescriptionData.prescriptionNumber || !prescriptionData.doctorName || !prescriptionData.patientName) {
      alert('Please fill in all prescription details')
      return
    }

    const prescriptionRecord: PrescriptionRecord = {
      id: `RX${Date.now()}`,
      productId: currentPrescriptionProduct.id,
      productName: currentPrescriptionProduct.name,
      prescriptionNumber: prescriptionData.prescriptionNumber,
      doctorName: prescriptionData.doctorName,
      patientName: prescriptionData.patientName,
      dosage: prescriptionData.dosage,
      instructions: prescriptionData.instructions,
      verifiedBy: staffId,
      verifiedAt: new Date()
    }

    setPrescriptions([...prescriptions, prescriptionRecord])

    // Add to cart with prescription verification
    const cartItem: CartItem = {
      product: currentPrescriptionProduct,
      quantity: 1,
      prescriptionVerified: true,
      prescriptionId: prescriptionRecord.id
    }

    setCart([...cart, cartItem])
    setPrescriptionModal(false)
    setPrescriptionData({
      prescriptionNumber: '',
      doctorName: '',
      patientName: '',
      dosage: '',
      instructions: ''
    })
    setCurrentPrescriptionProduct(null)
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

    // Check for unverified prescriptions
    const unverifiedRx = cart.find(item => 
      item.product.prescriptionRequired && !item.prescriptionVerified
    )
    
    if (unverifiedRx) {
      alert('Please verify all prescription medications before completing sale')
      return
    }

    const newSale: Sale = {
      id: `SALE-${Date.now()}`,
      items: [...cart],
      subtotal,
      tax,
      total,
      date: new Date(),
      staffId,
      customerName: customerName || 'Walk-in Customer',
      prescriptions: cart
        .filter(item => item.prescriptionId)
        .map(item => prescriptions.find(rx => rx.id === item.prescriptionId)!)
        .filter(Boolean),
      paymentMethod
    }

    setSales([...sales, newSale])
    setCart([])
    setCustomerName('')
    alert(`✅ Sale completed! Total: ₦${total.toLocaleString()}`)
  }

  // Generate Reports
  const generateDailySalesReport = () => {
    const today = new Date().toDateString()
    const todaySales = sales.filter(sale => sale.date.toDateString() === today)
    
    const totalSales = todaySales.reduce((sum, sale) => sum + sale.total, 0)
    const totalTransactions = todaySales.length
    const prescriptionSales = todaySales.filter(sale => sale.prescriptions.length > 0).length
    
    return {
      date: today,
      totalSales,
      totalTransactions,
      prescriptionSales,
      averageTransaction: totalTransactions > 0 ? totalSales / totalTransactions : 0,
      topProducts: getTopProducts(todaySales),
      staffPerformance: getStaffPerformance(todaySales)
    }
  }

  const generateInventoryReport = () => {
    const lowStockProducts = kunleAraProducts.filter(product => product.stockQuantity < 10)
    const outOfStockProducts = kunleAraProducts.filter(product => product.stockQuantity === 0)
    const prescriptionProducts = kunleAraProducts.filter(product => product.prescriptionRequired)
    
    return {
      totalProducts: kunleAraProducts.length,
      lowStockProducts,
      outOfStockProducts,
      prescriptionProducts: prescriptionProducts.length,
      totalInventoryValue: kunleAraProducts.reduce((sum, product) => 
        sum + (product.price * product.stockQuantity), 0
      )
    }
  }

  const getTopProducts = (salesData: Sale[]) => {
    const productSales: { [key: string]: { name: string, quantity: number, revenue: number } } = {}
    
    salesData.forEach(sale => {
      sale.items.forEach(item => {
        if (!productSales[item.product.id]) {
          productSales[item.product.id] = {
            name: item.product.name,
            quantity: 0,
            revenue: 0
          }
        }
        productSales[item.product.id].quantity += item.quantity
        productSales[item.product.id].revenue += item.product.price * item.quantity
      })
    })

    return Object.values(productSales)
      .sort((a, b) => b.revenue - a.revenue)
      .slice(0, 5)
  }

  const getStaffPerformance = (salesData: Sale[]) => {
    const staffPerformance: { [key: string]: { sales: number, transactions: number } } = {}
    
    salesData.forEach(sale => {
      if (!staffPerformance[sale.staffId]) {
        staffPerformance[sale.staffId] = { sales: 0, transactions: 0 }
      }
      staffPerformance[sale.staffId].sales += sale.total
      staffPerformance[sale.staffId].transactions += 1
    })

    return staffPerformance
  }

  // Handle Returns
  const processReturn = (saleId: string, productId: string, quantity: number, reason: string) => {
    const sale = sales.find(s => s.id === saleId)
    if (!sale) {
      alert('Sale not found!')
      return
    }

    const saleItem = sale.items.find(item => item.product.id === productId)
    if (!saleItem) {
      alert('Product not found in this sale!')
      return
    }

    if (quantity > saleItem.quantity) {
      alert('Cannot return more than was purchased!')
      return
    }

    const refundAmount = (saleItem.product.price * quantity) * 1.075 // Include tax

    const returnItem: ReturnItem = {
      saleId,
      productId,
      productName: saleItem.product.name,
      quantity,
      reason,
      refundAmount,
      returnedAt: new Date(),
      processedBy: staffId
    }

    setReturns([...returns, returnItem])
    alert(`✅ Return processed. Refund: ₦${refundAmount.toLocaleString()}`)
  }

  // Filter products
  const filteredProducts = useMemo(() => {
    return kunleAraProducts.filter(product => {
      const matchesSearch = product.name.toLowerCase().includes(searchTerm.toLowerCase())
      const matchesCategory = selectedCategory === 'all' || product.category === selectedCategory
      return matchesSearch && matchesCategory && product.inStock
    })
  }, [searchTerm, selectedCategory])

  // Login Screen
  if (!isAuthenticated) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-green-50 to-blue-50 flex items-center justify-center">
        <div className="bg-white p-8 rounded-2xl shadow-2xl max-w-md w-full">
          <div className="text-center mb-8">
            <div className="text-4xl mb-4">🏥</div>
            <h1 className="text-3xl font-bold text-gray-800">Kunle Ara Pharmacy</h1>
            <h2 className="text-xl text-green-600 font-semibold">Enhanced POS System</h2>
            <p className="text-gray-600 mt-2">Prescription • Reports • Returns</p>
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
                placeholder="PH001 (Pharmacist), TECH001 (Technician), CASH001 (Cashier)"
                className="w-full p-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                required
              />
              <p className="text-xs text-gray-500 mt-1">
                Start with PH (Pharmacist), TECH (Technician), or other (Cashier)
              </p>
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
              Login to Enhanced POS
            </button>
          </form>
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
            <h1 className="text-2xl font-bold">Kunle Ara Pharmacy - Enhanced POS</h1>
            <div className="flex items-center space-x-4 text-green-100">
              <span>📍 {currentBranch}</span>
              <span>👤 {staffId} ({staffRole.toUpperCase()})</span>
              <span>📅 {new Date().toLocaleDateString()}</span>
              {canHandlePrescriptions && <span className="bg-green-700 px-2 py-1 rounded text-xs">RX AUTHORIZED</span>}
            </div>
          </div>
          <div className="flex space-x-2">
            <button
              onClick={() => setShowReports(true)}
              className="bg-blue-600 hover:bg-blue-700 px-4 py-2 rounded transition-colors text-sm"
            >
              📊 Reports
            </button>
            <button
              onClick={() => setShowReturns(true)}
              className="bg-orange-600 hover:bg-orange-700 px-4 py-2 rounded transition-colors text-sm"
            >
              🔄 Returns
            </button>
            <button
              onClick={() => setIsAuthenticated(false)}
              className="bg-red-600 hover:bg-red-700 px-4 py-2 rounded transition-colors text-sm"
            >
              Logout
            </button>
          </div>
        </div>
      </div>

      <div className="flex h-screen">
        {/* Product Selection Area */}
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
                <option value="all">All Categories</option>
                <option value="prescription-drugs">💊 Prescription Drugs</option>
                <option value="otc-medications">🏥 Over-the-Counter</option>
                <option value="supplements">💪 Supplements</option>
                <option value="beverages">🥤 Beverages</option>
                <option value="snacks">🍿 Snacks</option>
                <option value="personal-care">🧴 Personal Care</option>
                <option value="household">🏠 Household</option>
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
                className={`bg-white p-4 rounded-lg shadow hover:shadow-md transition-shadow text-left ${
                  product.prescriptionRequired ? 'border-2 border-red-300' : ''
                }`}
                disabled={!product.inStock}
              >
                <div className="text-xs px-2 py-1 rounded mb-2 bg-gray-100">
                  {product.category.replace('-', ' ')}
                </div>
                <h3 className="font-semibold text-sm mb-1">{product.name}</h3>
                <p className="text-xs text-gray-600 mb-2">{product.brand}</p>
                <div className="flex justify-between items-center mb-2">
                  <span className="text-green-600 font-bold">₦{product.price.toLocaleString()}</span>
                  <span className="text-xs text-gray-500">{product.stockQuantity} left</span>
                </div>
                {product.prescriptionRequired && (
                  <div className="text-xs bg-red-100 text-red-800 px-1 py-0.5 rounded mb-2">
                    ⚠️ Prescription Required
                    {!canHandlePrescriptions && <div className="text-red-600">❌ Not Authorized</div>}
                  </div>
                )}
              </button>
            ))}
          </div>
        </div>

        {/* Cart/Checkout Area */}
        <div className="w-96 bg-white border-l border-gray-200 p-4">
          <h2 className="text-xl font-bold mb-4">Current Sale</h2>

          {/* Customer & Payment Info */}
          <div className="space-y-3 mb-4">
            <input
              type="text"
              placeholder="Customer name (optional)"
              value={customerName}
              onChange={(e) => setCustomerName(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded"
            />
            <select
              value={paymentMethod}
              onChange={(e) => setPaymentMethod(e.target.value as any)}
              className="w-full p-2 border border-gray-300 rounded"
            >
              <option value="cash">💵 Cash</option>
              <option value="card">💳 Card</option>
              <option value="transfer">📱 Transfer</option>
            </select>
          </div>

          {/* Cart Items */}
          <div className="space-y-2 mb-4 max-h-64 overflow-y-auto">
            {cart.map(item => (
              <div key={item.product.id} className="bg-gray-50 p-3 rounded">
                <div className="flex justify-between items-start">
                  <div className="flex-1">
                    <h4 className="font-semibold text-sm">{item.product.name}</h4>
                    <p className="text-xs text-gray-600">₦{item.product.price.toLocaleString()} each</p>
                    {item.prescriptionVerified && (
                      <div className="text-xs bg-green-100 text-green-800 px-1 py-0.5 rounded mt-1">
                        ✅ Prescription Verified (ID: {item.prescriptionId})
                      </div>
                    )}
                  </div>
                </div>
                <div className="flex items-center justify-between mt-2">
                  <div className="flex items-center space-x-2">
                    <span className="font-semibold">Qty: {item.quantity}</span>
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
              className="w-full bg-green-600 text-white py-3 rounded-lg hover:bg-green-700 disabled:bg-gray-400 font-semibold"
            >
              💳 Complete Sale (₦{total.toLocaleString()})
            </button>
            <button
              onClick={() => setCart([])}
              className="w-full bg-red-600 text-white py-2 rounded-lg hover:bg-red-700"
            >
              🗑️ Clear Cart
            </button>
          </div>

          {/* Recent Sales Summary */}
          <div className="mt-6 p-4 bg-gray-50 rounded-lg">
            <h3 className="font-semibold mb-2">Today's Summary</h3>
            <div className="text-sm space-y-1">
              <div>Sales: {sales.filter(s => s.date.toDateString() === new Date().toDateString()).length}</div>
              <div>Prescriptions: {prescriptions.filter(p => p.verifiedAt.toDateString() === new Date().toDateString()).length}</div>
              <div>Returns: {returns.filter(r => r.returnedAt.toDateString() === new Date().toDateString()).length}</div>
            </div>
          </div>
        </div>
      </div>

      {/* Prescription Modal */}
      {prescriptionModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white p-6 rounded-lg max-w-md w-full mx-4">
            <h3 className="text-xl font-bold mb-4 text-red-600">⚠️ Prescription Verification Required</h3>
            <p className="mb-4">Product: <strong>{currentPrescriptionProduct?.name}</strong></p>
            
            <div className="space-y-4">
              <input
                type="text"
                placeholder="Prescription Number *"
                value={prescriptionData.prescriptionNumber}
                onChange={(e) => setPrescriptionData({...prescriptionData, prescriptionNumber: e.target.value})}
                className="w-full p-3 border border-gray-300 rounded-lg"
                required
              />
              <input
                type="text"
                placeholder="Doctor's Name *"
                value={prescriptionData.doctorName}
                onChange={(e) => setPrescriptionData({...prescriptionData, doctorName: e.target.value})}
                className="w-full p-3 border border-gray-300 rounded-lg"
                required
              />
              <input
                type="text"
                placeholder="Patient's Name *"
                value={prescriptionData.patientName}
                onChange={(e) => setPrescriptionData({...prescriptionData, patientName: e.target.value})}
                className="w-full p-3 border border-gray-300 rounded-lg"
                required
              />
              <input
                type="text"
                placeholder="Dosage Instructions"
                value={prescriptionData.dosage}
                onChange={(e) => setPrescriptionData({...prescriptionData, dosage: e.target.value})}
                className="w-full p-3 border border-gray-300 rounded-lg"
              />
              <textarea
                placeholder="Additional Instructions"
                value={prescriptionData.instructions}
                onChange={(e) => setPrescriptionData({...prescriptionData, instructions: e.target.value})}
                className="w-full p-3 border border-gray-300 rounded-lg"
                rows={3}
              />
            </div>

            <div className="flex space-x-4 mt-6">
              <button
                onClick={handlePrescriptionVerification}
                className="flex-1 bg-green-600 text-white py-2 rounded-lg hover:bg-green-700"
              >
                ✅ Verify & Add to Cart
              </button>
              <button
                onClick={() => setPrescriptionModal(false)}
                className="flex-1 bg-gray-500 text-white py-2 rounded-lg hover:bg-gray-600"
              >
                Cancel
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Reports Modal */}
      {showReports && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white p-6 rounded-lg max-w-4xl w-full mx-4 max-h-[90vh] overflow-y-auto">
            <div className="flex justify-between items-center mb-6">
              <h3 className="text-2xl font-bold">📊 Pharmacy Reports</h3>
              <button
                onClick={() => setShowReports(false)}
                className="text-gray-500 hover:text-gray-700 text-2xl"
              >
                ×
              </button>
            </div>

            {/* Report Type Selector */}
            <div className="flex space-x-4 mb-6">
              {['daily', 'monthly', 'inventory', 'staff'].map(type => (
                <button
                  key={type}
                  onClick={() => setReportType(type as any)}
                  className={`px-4 py-2 rounded-lg ${
                    reportType === type ? 'bg-blue-600 text-white' : 'bg-gray-200'
                  }`}
                >
                  {type.charAt(0).toUpperCase() + type.slice(1)} Report
                </button>
              ))}
            </div>

            {/* Reports Content */}
            {reportType === 'daily' && (
              <div className="space-y-4">
                <h4 className="text-xl font-semibold">📈 Daily Sales Report</h4>
                {(() => {
                  const report = generateDailySalesReport()
                  return (
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                      <div className="bg-green-50 p-4 rounded-lg">
                        <h5 className="font-semibold text-green-700">Total Sales</h5>
                        <p className="text-2xl font-bold">₦{report.totalSales.toLocaleString()}</p>
                      </div>
                      <div className="bg-blue-50 p-4 rounded-lg">
                        <h5 className="font-semibold text-blue-700">Transactions</h5>
                        <p className="text-2xl font-bold">{report.totalTransactions}</p>
                      </div>
                      <div className="bg-red-50 p-4 rounded-lg">
                        <h5 className="font-semibold text-red-700">Prescriptions</h5>
                        <p className="text-2xl font-bold">{report.prescriptionSales}</p>
                      </div>
                      <div className="bg-purple-50 p-4 rounded-lg">
                        <h5 className="font-semibold text-purple-700">Avg Transaction</h5>
                        <p className="text-2xl font-bold">₦{report.averageTransaction.toLocaleString()}</p>
                      </div>
                    </div>
                  )
                })()}

                {/* Top Products */}
                <div className="mt-6">
                  <h5 className="font-semibold mb-4">🔥 Top Selling Products</h5>
                  <div className="bg-gray-50 p-4 rounded-lg">
                    {generateDailySalesReport().topProducts.map((product, index) => (
                      <div key={index} className="flex justify-between items-center py-2 border-b">
                        <span>{product.name}</span>
                        <div className="text-right">
                          <div className="font-semibold">₦{product.revenue.toLocaleString()}</div>
                          <div className="text-sm text-gray-500">Qty: {product.quantity}</div>
                        </div>
                      </div>
                    ))}
                    {generateDailySalesReport().topProducts.map((product, index) => (
                      <div key={index} className="flex justify-between items-center py-2 border-b">
                        <span>{product.name}</span>
                        <div className="text-right">
                          <div className="font-semibold">₦{product.revenue.toLocaleString()}</div>
                          <div className="text-sm text-gray-500">Qty: {product.quantity}</div>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>

                {/* Sales by Category */}
                <div className="mt-6">
                  <h5 className="font-semibold mb-4">📊 Sales by Category</h5>
                  <div className="space-y-3">
                    {generateDailySalesReport().categoryBreakdown.map((category, index) => (
                      <div key={index} className="bg-gray-50 p-3 rounded">
                        <div className="flex justify-between items-center mb-2">
                          <span className="font-medium">{category.icon} {category.name}</span>
                          <span className="font-bold text-green-600">₦{category.revenue.toLocaleString()}</span>
                        </div>
                        <div className="w-full bg-gray-200 rounded-full h-2">
                          <div 
                            className="bg-green-500 h-2 rounded-full transition-all duration-300"
                            style={{ width: `${(category.revenue / generateDailySalesReport().totalSales) * 100}%` }}
                          ></div>
                        </div>
                        <div className="text-xs text-gray-500 mt-1">
                          {category.quantity} items • {((category.revenue / generateDailySalesReport().totalSales) * 100).toFixed(1)}%
                        </div>
                      </div>
                    ))}
                  </div>
                </div>

                {/* Staff Performance */}
                <div className="mt-6">
                  <h5 className="font-semibold mb-4">👥 Staff Performance Today</h5>
                  <div className="bg-gray-50 p-4 rounded-lg">
                    {generateDailySalesReport().staffPerformance.map((staff, index) => (
                      <div key={index} className="flex justify-between items-center py-3 border-b last:border-b-0">
                        <div>
                          <div className="font-medium">{staff.name}</div>
                          <div className="text-sm text-gray-500">{staff.branch} • {staff.sales} sales</div>
                        </div>
                        <div className="text-right">
                          <div className="font-bold text-blue-600">₦{staff.revenue.toLocaleString()}</div>
                          <div className="text-xs text-gray-500">Avg: ₦{Math.round(staff.revenue / staff.sales).toLocaleString()}</div>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>

                {/* Recent Transactions */}
                <div className="mt-6">
                  <h5 className="font-semibold mb-4">🕒 Recent Transactions</h5>
                  <div className="space-y-2 max-h-64 overflow-y-auto">
                    {sales.slice(-10).reverse().map((sale, index) => (
                      <div key={sale.id} className="bg-gray-50 p-3 rounded flex justify-between items-center">
                        <div>
                          <div className="font-medium">Sale #{sale.id.slice(-6)}</div>
                          <div className="text-sm text-gray-500">
                            {sale.customerName || 'Walk-in'} • {sale.items.length} items
                          </div>
                          <div className="text-xs text-gray-400">
                            {new Date(sale.date).toLocaleTimeString()}
                          </div>
                        </div>
                        <div className="text-right">
                          <div className="font-bold">₦{sale.total.toLocaleString()}</div>
                          <div className="text-xs text-gray-500">{sale.staffId}</div>
                        </div>
                      </div>
                    ))}
                    {sales.length === 0 && (
                      <div className="text-center py-8 text-gray-500">
                        <div className="text-4xl mb-2">📄</div>
                        <p>No transactions yet today</p>
                      </div>
                    )}
                  </div>
                </div>

                {/* Quick Actions */}
                <div className="mt-6">
                  <h5 className="font-semibold mb-4">⚡ Quick Actions</h5>
                  <div className="grid grid-cols-2 gap-3">
                    <button
                      onClick={() => exportDailySalesReport()}
                      className="bg-blue-500 text-white p-3 rounded-lg hover:bg-blue-600 transition-colors text-sm font-medium"
                    >
                      📊 Export Report
                    </button>
                    <button
                      onClick={() => printDailyReport()}
                      className="bg-green-500 text-white p-3 rounded-lg hover:bg-green-600 transition-colors text-sm font-medium"
                    >
                      🖨️ Print Report
                    </button>
                    <button
                      onClick={() => emailDailyReport()}
                      className="bg-purple-500 text-white p-3 rounded-lg hover:bg-purple-600 transition-colors text-sm font-medium"
                    >
                      📧 Email Report
                    </button>
                    <button
                      onClick={() => setSales([])}
                      className="bg-red-500 text-white p-3 rounded-lg hover:bg-red-600 transition-colors text-sm font-medium"
                    >
                      🗑️ Clear Day
                    </button>
                  </div>
                </div>

                {/* Branch Comparison */}
                <div className="mt-6">
                  <h5 className="font-semibold mb-4">🏪 Branch Performance</h5>
                  <div className="space-y-3">
                    {['UCH Branch', 'Yemetu Branch', 'Ring Road Branch'].map((branch, index) => {
                      const branchSales = Math.random() * 50000 + 20000; // Simulated data
                      const maxSales = 70000;
                      return (
                        <div key={branch} className="bg-gray-50 p-3 rounded">
                          <div className="flex justify-between items-center mb-2">
                            <span className="font-medium">{['🏥', '🏪', '🏢'][index]} {branch}</span>
                            <span className="font-bold">₦{branchSales.toLocaleString()}</span>
                          </div>
                          <div className="w-full bg-gray-200 rounded-full h-2">
                            <div 
                              className="bg-blue-500 h-2 rounded-full"
                              style={{ width: `${(branchSales / maxSales) * 100}%` }}
                            ></div>
                          </div>
                          <div className="text-xs text-gray-500 mt-1">
                            Target: ₦{maxSales.toLocaleString()} • {((branchSales / maxSales) * 100).toFixed(1)}% achieved
                          </div>
                        </div>
                      );
                    })}
                  </div>
                </div>

                {/* Inventory Alerts */}
                <div className="mt-6">
                  <h5 className="font-semibold mb-4">⚠️ Low Stock Alerts</h5>
                  <div className="space-y-2 max-h-48 overflow-y-auto">
                    {kunleAraProducts
                      .filter(product => product.stockQuantity < 20)
                      .slice(0, 5)
                      .map((product, index) => (
                        <div key={product.id} className="bg-red-50 border border-red-200 p-3 rounded">
                          <div className="flex justify-between items-center">
                            <div>
                              <div className="font-medium text-red-800">{product.name}</div>
                              <div className="text-sm text-red-600">{product.category}</div>
                            </div>
                            <div className="text-right">
                              <div className="font-bold text-red-700">{product.stockQuantity} left</div>
                              <div className="text-xs text-red-500">Reorder needed</div>
                            </div>
                          </div>
                        </div>
                      ))}
                    {kunleAraProducts.filter(product => product.stockQuantity < 20).length === 0 && (
                      <div className="text-center py-4 text-gray-500">
                        <div className="text-2xl mb-2">✅</div>
                        <p>All products well stocked!</p>
                      </div>
                    )}
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Footer */}
        <div className="mt-8 text-center text-sm text-gray-500">
          <p>© 2024 Kunle Ara Pharmacy. All rights reserved.</p>
          <p>POS System v2.0 • Last updated: {new Date().toLocaleDateString()}</p>
        </div>
      </div>
    </div>
  );

  // Helper function to generate daily sales report
  function generateDailySalesReport() {
    const today = new Date().toDateString();
    const todaySales = sales.filter(sale => new Date(sale.date).toDateString() === today);
    
    // Calculate totals
    const totalSales = todaySales.reduce((sum, sale) => sum + sale.total, 0);
    const totalTransactions = todaySales.length;
    const avgTransactionValue = totalTransactions > 0 ? totalSales / totalTransactions : 0;

    // Top products
    const productSales = {};
    todaySales.forEach(sale => {
      sale.items.forEach(item => {
        const productName = item.product.name;
        if (!productSales[productName]) {
          productSales[productName] = { quantity: 0, revenue: 0 };
        }
        productSales[productName].quantity += item.quantity;
        productSales[productName].revenue += item.product.price * item.quantity;
      });
    });

    const topProducts = Object.entries(productSales)
      .map(([name, data]) => ({ name, ...data }))
      .sort((a, b) => b.revenue - a.revenue)
      .slice(0, 5);

    // Category breakdown
    const categoryManager = new Map();
    const categoryIcons = {
      'prescription-drugs': '💊',
      'otc-medications': '🏥',
      'supplements': '💪',
      'beverages': '🥤',
      'snacks': '🍿',
      'personal-care': '🧴',
      'household': '🏠',
      'baby-care': '👶',
      'herbal-natural': '🌿',
      'fitness-wellness': '🏃'
    };

    todaySales.forEach(sale => {
      sale.items.forEach(item => {
        const category = item.product.category;
        if (!categoryManager.has(category)) {
          categoryManager.set(category, { quantity: 0, revenue: 0 });
        }
        const current = categoryManager.get(category);
        current.quantity += item.quantity;
        current.revenue += item.product.price * item.quantity;
      });
    });

    const categoryBreakdown = Array.from(categoryManager.entries())
      .map(([category, data]) => ({
        name: category.charAt(0).toUpperCase() + category.slice(1).replace('-', ' '),
        icon: categoryIcons[category] || '📦',
        ...data
      }))
      .sort((a, b) => b.revenue - a.revenue);

    // Staff performance
    const staffPerformance = [
      { name: staffId || 'Current User', branch: currentBranch?.name || 'Unknown', sales: totalTransactions, revenue: totalSales }
    ];

    return {
      totalSales,
      totalTransactions,
      avgTransactionValue,
      topProducts,
      categoryBreakdown,
      staffPerformance
    };
  }

  // Helper functions for quick actions
  const exportDailySalesReport = () => {
    const report = generateDailySalesReport();
    const csvContent = [
      ['Daily Sales Report', `Date: ${new Date().toLocaleDateString()}`],
      [''],
      ['Summary'],
      ['Total Sales', `₦${report.totalSales.toLocaleString()}`],
      ['Total Transactions', report.totalTransactions],
      ['Average Transaction', `₦${report.avgTransactionValue.toLocaleString()}`],
      [''],
      ['Top Products'],
      ['Product Name', 'Quantity', 'Revenue'],
      ...report.topProducts.map(p => [p.name, p.quantity, `₦${p.revenue.toLocaleString()}`])
    ].map(row => row.join(',')).join('\n');

    const blob = new Blob([csvContent], { type: 'text/csv' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `daily-sales-report-${new Date().toISOString().split('T')[0]}.csv`;
    a.click();
  };

  const printDailyReport = () => {
    const report = generateDailySalesReport();
    const printContent = `
      <html>
        <head><title>Daily Sales Report</title></head>
        <body>
          <h1>Kunle Ara Pharmacy - Daily Sales Report</h1>
          <p>Date: ${new Date().toLocaleDateString()}</p>
          <h2>Summary</h2>
          <p>Total Sales: ₦${report.totalSales.toLocaleString()}</p>
          <p>Total Transactions: ${report.totalTransactions}</p>
          <h2>Top Products</h2>
          <ul>
            ${report.topProducts.map(p => `<li>${p.name}: ${p.quantity} units, ₦${p.revenue.toLocaleString()}</li>`).join('')}
          </ul>
        </body>
      </html>
    `;
    
    const printWindow = window.open('', '_blank');
    printWindow.document.write(printContent);
    printWindow.document.close();
    printWindow.print();
  };

  const emailDailyReport = () => {
    const report = generateDailySalesReport();
    const subject = `Daily Sales Report - ${new Date().toLocaleDateString()}`;
    const body = `
Daily Sales Report for Kunle Ara Pharmacy

Summary:
- Total Sales: ₦${report.totalSales.toLocaleString()}
- Total Transactions: ${report.totalTransactions}
- Average Transaction: ₦${report.avgTransactionValue.toLocaleString()}

Top Products:
${report.topProducts.map(p => `- ${p.name}: ${p.quantity} units, ₦${p.revenue.toLocaleString()}`).join('\n')}
    `;
    
    window.location.href = `mailto:manager@kunlearapharmacy.ng?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(body)}`;
  };
}

export default POSPage;
