'use client'

import { useState, useEffect } from 'react'
import { kunleAraProducts } from '../data/kunle_ara_products'
import { categories } from '../lib/database'
import { useCashierTracker, CashierSession } from '../components/CashierTracker'

interface CartItem {
  product: any
  quantity: number
}

export default function EnhancedPOSPage() {
  // Cashier tracking
  const {
    session,
    isOnBreak,
    currentTransaction,
    startSession,
    startTransaction,
    completeTransaction,
    startBreak,
    endBreak,
    endSession
  } = useCashierTracker()

  // POS state
  const [cart, setCart] = useState<CartItem[]>([])
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('all')
  const [customerName, setCustomerName] = useState('')
  const [customerType, setCustomerType] = useState<'walk-in' | 'regular' | 'prescription'>('walk-in')
  const [paymentMethod, setPaymentMethod] = useState<'cash' | 'card' | 'transfer'>('cash')

  // Login state
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [staffId, setStaffId] = useState('')
  const [staffName, setStaffName] = useState('')
  const [password, setPassword] = useState('')
  const [selectedBranch, setSelectedBranch] = useState('')

  // Branches
  const branches = [
    { id: 'uch', name: 'UCH Branch', location: 'University College Hospital Area' },
    { id: 'yemetu', name: 'Yemetu Branch', location: 'Yemetu Area, Ibadan' },
    { id: 'ring-road', name: 'Ring Road Branch', location: 'Ring Road Area, Ibadan' }
  ]

  // Handle login with session tracking
  const handleLogin = (e: React.FormEvent) => {
    e.preventDefault()
    if (staffId && staffName && password && selectedBranch) {
      const branch = branches.find(b => b.id === selectedBranch)!
      
      // Start cashier session tracking
      startSession(staffId, staffName, selectedBranch, branch.name)
      setIsAuthenticated(true)
    }
  }

  // Handle logout with session end
  const handleLogout = () => {
    const finalSession = endSession()
    setIsAuthenticated(false)
    
    // Show session summary
    alert(`Session Summary:
Staff: ${finalSession.staffName}
Login: ${new Date(finalSession.loginTime).toLocaleTimeString()}
Logout: ${finalSession.logoutTime ? new Date(finalSession.logoutTime).toLocaleTimeString() : 'Now'}
Transactions: ${finalSession.transactions.length}
Total Sales: ₦${finalSession.totalSales.toLocaleString()}
Avg Transaction Time: ${finalSession.averageTransactionTime}s
Productivity Score: ${finalSession.productivityScore}/100`)
  }

  // Add to cart (start transaction timing if first item)
  const addToCart = (product: any) => {
    if (isOnBreak) {
      alert('Cannot process sales while on break!')
      return
    }

    // Start transaction timing if this is the first item
    if (cart.length === 0 && !currentTransaction) {
      startTransaction()
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

  // Process sale with transaction completion
  const processSale = () => {
    if (cart.length === 0) {
      alert('Cart is empty!')
      return
    }

    if (!currentTransaction) {
      alert('Transaction timing not started!')
      return
    }

    const subtotal = cart.reduce((sum, item) => sum + (item.product.price * item.quantity), 0)
    const tax = subtotal * 0.075
    const total = subtotal + tax
    const itemCount = cart.reduce((sum, item) => sum + item.quantity, 0)

    // Complete transaction with timing
    const transaction = completeTransaction(itemCount, total, paymentMethod, customerType)

    // Clear cart
    setCart([])
    setCustomerName('')

    alert(`Sale Completed!
Transaction Time: ${transaction.duration} seconds
Items: ${itemCount}
Total: ₦${total.toLocaleString()}
Average so far: ${session?.averageTransactionTime}s`)
  }

  // Break management
  const handleBreakStart = (type: 'lunch' | 'short' | 'emergency') => {
    if (cart.length > 0) {
      alert('Please complete current transaction before taking break')
      return
    }
    startBreak(type)
  }

  // Login screen
  if (!isAuthenticated) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-green-50 to-blue-50 flex items-center justify-center">
        <div className="bg-white p-8 rounded-2xl shadow-2xl max-w-md w-full">
          <div className="text-center mb-8">
            <h1 className="text-3xl font-bold text-gray-800">Kunle Ara Pharmacy</h1>
            <h2 className="text-xl text-green-600 font-semibold">POS System with Tracking</h2>
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
                className="w-full p-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                required
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Full Name
              </label>
              <input
                type="text"
                value={staffName}
                onChange={(e) => setStaffName(e.target.value)}
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
                className="w-full p-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                required
              />
            </div>

            <button
              type="submit"
              className="w-full bg-green-600 text-white py-4 rounded-lg hover:bg-green-700"
            >
              Login & Start Session
            </button>
          </form>
        </div>
      </div>
    )
  }

  // Main POS Interface
  return (
    <div className="min-h-screen bg-gray-100">
      {/* Enhanced Header with Session Info */}
      <div className="bg-green-600 text-white p-4">
        <div className="flex justify-between items-center">
          <div>
            <h1 className="text-2xl font-bold">Kunle Ara Pharmacy - Enhanced POS</h1>
            <div className="flex items-center space-x-6 text-green-100">
              <span>👤 {session?.staffName} ({session?.staffId})</span>
              <span>📍 {session?.branchName}</span>
              <span>🕒 Login: {session?.loginTime ? new Date(session.loginTime).toLocaleTimeString() : ''}</span>
              <span className={`px-2 py-1 rounded text-xs ${isOnBreak ? 'bg-orange-500' : 'bg-green-500'}`}>
                {isOnBreak ? '☕ ON BREAK' : '✅ ACTIVE'}
              </span>
            </div>
          </div>
          <div className="text-right">
            <button
              onClick={handleLogout}
              className="bg-green-700 hover:bg-green-800 px-4 py-2 rounded mr-2"
            >
              Logout
            </button>
            {!isOnBreak ? (
              <div className="space-x-2 mt-2">
                <button
                  onClick={() => handleBreakStart('short')}
                  className="bg-orange-500 hover:bg-orange-600 px-3 py-1 rounded text-xs"
                >
                  Short Break
                </button>
                <button
                  onClick={() => handleBreakStart('lunch')}
                  className="bg-orange-600 hover:bg-orange-700 px-3 py-1 rounded text-xs"
                >
                  Lunch Break
                </button>
              </div>
            ) : (
              <button
                onClick={endBreak}
                className="bg-green-500 hover:bg-green-600 px-4 py-2 rounded text-sm"
              >
                End Break
              </button>
            )}
          </div>
        </div>

        {/* Session Stats */}
        <div className="mt-3 grid grid-cols-4 gap-4 text-center">
          <div className="bg-green-700 p-2 rounded">
            <div className="text-lg font-bold">{session?.transactions.length || 0}</div>
            <div className="text-xs">Transactions</div>
          </div>
          <div className="bg-green-700 p-2 rounded">
            <div className="text-lg font-bold">₦{(session?.totalSales || 0).toLocaleString()}</div>
            <div className="text-xs">Total Sales</div>
          </div>
          <div className="bg-green-700 p-2 rounded">
            <div className="text-lg font-bold">{session?.averageTransactionTime || 0}s</div>
            <div className="text-xs">Avg Transaction</div>
          </div>
          <div className="bg-green-700 p-2 rounded">
            <div className="text-lg font-bold">{session?.productivityScore || 0}/100</div>
            <div className="text-xs">Productivity</div>
          </div>
        </div>
      </div>

      {/* Transaction Status */}
      {currentTransaction && (
        <div className="bg-blue-100 border-l-4 border-blue-500 p-4">
          <div className="flex items-center">
            <div className="animate-pulse w-3 h-3 bg-blue-500 rounded-full mr-2"></div>
            <span className="text-blue-800 font-semibold">
              ⏱️ Transaction in progress... (Started: {new Date().toLocaleTimeString()})
            </span>
          </div>
        </div>
      )}

      {isOnBreak && (
        <div className="bg-orange-100 border-l-4 border-orange-500 p-4">
          <span className="text-orange-800 font-semibold">☕ You are currently on break - Sales disabled</span>
        </div>
      )}

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
                disabled={isOnBreak}
              />
              <select
                value={selectedCategory}
                onChange={(e) => setSelectedCategory(e.target.value)}
                className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                disabled={isOnBreak}
              >
                <option value="all">All Categories</option>
                {Object.entries(categories).map(([id, category]) => (
                  <option key={id} value={id}>
                    {category.icon} {category.name}
                  </option>
                ))}
              </select>
            </div>
          </div>

          {/* Products Grid */}
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 max-h-96 overflow-y-auto">
            {kunleAraProducts
              .filter(product => {
                const matchesSearch = searchTerm === '' || product.name.toLowerCase().includes(searchTerm.toLowerCase())
                const matchesCategory = selectedCategory === 'all' || product.category === selectedCategory
                return matchesSearch && matchesCategory && product.inStock
              })
              .map(product => (
                <button
                  key={product.id}
                  onClick={() => addToCart(product)}
                  className={`bg-white p-4 rounded-lg shadow hover:shadow-md transition-shadow text-left ${
                    isOnBreak ? 'opacity-50 cursor-not-allowed' : ''
                  }`}
                  disabled={isOnBreak}
                >
                  <div className="text-xs px-2 py-1 rounded mb-2 bg-blue-100 text-blue-800">
                    {product.category}
                  </div>
                  <h3 className="font-semibold text-sm mb-1">{product.name}</h3>
                  <div className="flex justify-between items-center">
                    <span className="text-green-600 font-bold">₦{product.price.toLocaleString()}</span>
                    <span className="text-xs text-gray-500">{product.stockQuantity} left</span>
                  </div>
                </button>
              ))}
          </div>
        </div>

        {/* Cart/Checkout Area */}
        <div className="w-96 bg-white border-l border-gray-200 p-4">
          <h2 className="text-xl font-bold mb-4">Current Sale</h2>

          {/* Customer Info */}
          <div className="mb-4 space-y-2">
            <input
              type="text"
              placeholder="Customer name (optional)"
              value={customerName}
              onChange={(e) => setCustomerName(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded"
              disabled={isOnBreak}
            />
            <div className="flex gap-2">
              <select
                value={customerType}
                onChange={(e) => setCustomerType(e.target.value as 'walk-in' | 'regular' | 'prescription')}
                className="flex-1 p-2 border border-gray-300 rounded text-sm"
                disabled={isOnBreak}
              >
                <option value="walk-in">Walk-in</option>
                <option value="regular">Regular</option>
                <option value="prescription">Prescription</option>
              </select>
              <select
                value={paymentMethod}
                onChange={(e) => setPaymentMethod(e.target.value as 'cash' | 'card' | 'transfer')}
                className="flex-1 p-2 border border-gray-300 rounded text-sm"
                disabled={isOnBreak}
              >
                <option value="cash">Cash</option>
                <option value="card">Card</option>
                <option value="transfer">Transfer</option>
              </select>
            </div>
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
          onClick={() => setCart(cart.filter(cartItem => cartItem.product.id !== item.product.id))}
          className="text-red-500 hover:text-red-700 text-xs ml-2"
        >
          ✕ Remove
        </button>
      </div>
      
      {/* Quantity Controls */}
      <div className="flex items-center justify-between mt-2">
        <div className="flex items-center space-x-2">
          <button
            onClick={() => updateQuantity(item.product.id, Math.max(1, item.quantity - 1))}
            className="bg-gray-200 hover:bg-gray-300 px-2 py-1 rounded text-sm"
            disabled={item.quantity <= 1}
          >
            -
          </button>
          <span className="font-semibold min-w-[2rem] text-center">{item.quantity}</span>
          <button
            onClick={() => updateQuantity(item.product.id, Math.min(item.product.stockQuantity, item.quantity + 1))}
            className="bg-gray-200 hover:bg-gray-300 px-2 py-1 rounded text-sm"
            disabled={item.quantity >= item.product.stockQuantity}
          >
            +
          </button>
        </div>
        <div className="text-right">
          <span className="font-bold text-green-600">
            ₦{(item.product.price * item.quantity).toLocaleString()}
          </span>
          <p className="text-xs text-gray-500">
            {item.product.stockQuantity - item.quantity} left
          </p>
        </div>
      </div>

      {/* Prescription Warning */}
      {item.product.prescriptionRequired && (
        <div className="mt-2 bg-red-50 border border-red-200 rounded px-2 py-1">
          <p className="text-xs text-red-600 flex items-center">
            ⚠️ Prescription Required - Verify before dispensing
          </p>
        </div>
      )}

      {/* Low Stock Warning */}
      {item.product.stockQuantity <= 5 && (
        <div className="mt-1 bg-yellow-50 border border-yellow-200 rounded px-2 py-1">
          <p className="text-xs text-yellow-600">
            ⚠️ Low Stock: Only {item.product.stockQuantity} remaining
          </p>
        </div>
      )}
    </div>
  ))}

  {/* Empty Cart Message */}
  {cart.length === 0 && (
    <div className="text-center py-8 text-gray-500">
      <div className="text-4xl mb-2">🛒</div>
      <p className="text-sm">Cart is empty</p>
      <p className="text-xs">Scan or search for products to add</p>
    </div>
  )}
</div>

{/* Cart Summary */}
<div className="border-t pt-4 mb-4">
  <div className="space-y-1 text-sm">
    <div className="flex justify-between">
      <span>Items ({cart.reduce((sum, item) => sum + item.quantity, 0)}):</span>
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
    <div className="flex justify-between font-bold text-lg border-t pt-2 mt-2">
      <span>Total:</span>
      <span className="text-green-600">₦{total.toLocaleString()}</span>
    </div>
  </div>
</div>

{/* Customer Info */}
<div className="mb-4">
  <label className="block text-sm font-medium text-gray-700 mb-1">
    Customer Name (Optional)
  </label>
  <input
    type="text"
    value={customerName}
    onChange={(e) => setCustomerName(e.target.value)}
    placeholder="Enter customer name"
    className="w-full p-2 border border-gray-300 rounded focus:ring-2 focus:ring-green-500 focus:border-transparent"
  />
</div>

{/* Payment Method */}
<div className="mb-4">
  <label className="block text-sm font-medium text-gray-700 mb-2">
    Payment Method
  </label>
  <div className="grid grid-cols-2 gap-2">
    <button
      onClick={() => setPaymentMethod('cash')}
      className={`p-2 rounded text-sm ${
        paymentMethod === 'cash' 
          ? 'bg-green-500 text-white' 
          : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
      }`}
    >
      💵 Cash
    </button>
    <button
      onClick={() => setPaymentMethod('card')}
      className={`p-2 rounded text-sm ${
        paymentMethod === 'card' 
          ? 'bg-blue-500 text-white' 
          : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
      }`}
    >
      💳 Card
    </button>
    <button
      onClick={() => setPaymentMethod('transfer')}
      className={`p-2 rounded text-sm ${
        paymentMethod === 'transfer' 
          ? 'bg-purple-500 text-white' 
          : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
      }`}
    >
      📱 Transfer
    </button>
    <button
      onClick={() => setPaymentMethod('insurance')}
      className={`p-2 rounded text-sm ${
        paymentMethod === 'insurance' 
          ? 'bg-orange-500 text-white' 
          : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
      }`}
    >
      🏥 Insurance
    </button>
  </div>
</div>

{/* Action Buttons */}
<div className="space-y-2">
  {/* Complete Sale Button */}
  <button
    onClick={processSale}
    disabled={cart.length === 0}
    className="w-full bg-green-600 text-white py-3 rounded-lg hover:bg-green-700 disabled:bg-gray-400 disabled:cursor-not-allowed font-semibold transition-colors"
  >
    {cart.length === 0 ? 'Add Items to Cart' : `Complete Sale (₦${total.toLocaleString()})`}
  </button>

  {/* Hold Sale Button */}
  <button
    onClick={holdSale}
    disabled={cart.length === 0}
    className="w-full bg-yellow-600 text-white py-2 rounded-lg hover:bg-yellow-700 disabled:bg-gray-400 disabled:cursor-not-allowed transition-colors"
  >
    🔄 Hold Sale
  </button>

  {/* Clear Cart Button */}
  <button
    onClick={() => {
      if (window.confirm('Clear all items from cart?')) {
        setCart([]);
        setCustomerName('');
        setPaymentMethod('cash');
      }
    }}
    className="w-full bg-red-600 text-white py-2 rounded-lg hover:bg-red-700 transition-colors"
  >
    🗑️ Clear Cart
  </button>
</div>

{/* Quick Actions */}
<div className="mt-4 pt-4 border-t">
  <h4 className="text-sm font-medium text-gray-700 mb-2">Quick Actions</h4>
  <div className="grid grid-cols-2 gap-2">
    <button
      onClick={() => setShowDiscountModal(true)}
      disabled={cart.length === 0}
      className="bg-blue-100 text-blue-700 p-2 rounded text-xs hover:bg-blue-200 disabled:opacity-50"
    >
      💰 Apply Discount
    </button>
    <button
      onClick={printReceipt}
      disabled={!lastSale}
      className="bg-purple-100 text-purple-700 p-2 rounded text-xs hover:bg-purple-200 disabled:opacity-50"
    >
      🖨️ Print Receipt
    </button>
    <button
      onClick={() => setShowHeldSales(true)}
      className="bg-orange-100 text-orange-700 p-2 rounded text-xs hover:bg-orange-200"
    >
      📋 Held Sales ({heldSales.length})
    </button>
    <button
      onClick={openCashDrawer}
      className="bg-gray-100 text-gray-700 p-2 rounded text-xs hover:bg-gray-200"
    >
      💸 Open Drawer
    </button>
  </div>
</div>

{/* Recent Sales */}
<div className="mt-6">
  <h3 className="font-semibold mb-2 text-sm">Recent Sales ({sales.length})</h3>
  <div className="text-xs space-y-1 max-h-32 overflow-y-auto">
    {sales.slice(-5).reverse().map(sale => (
      <div key={sale.id} className="bg-gray-50 p-2 rounded flex justify-between">
        <div>
          <div className="font-medium">{sale.customerName || 'Walk-in Customer'}</div>
          <div className="text-gray-500">
            {sale.items.length} items • {sale.paymentMethod}
          </div>
        </div>
        <div className="text-right">
          <div className="font-semibold">₦{sale.total.toLocaleString()}</div>
          <div className="text-gray-500">{new Date(sale.date).toLocaleTimeString()}</div>
        </div>
      </div>
    ))}
    {sales.length === 0 && (
      <p className="text-gray-500 text-center py-2">No recent sales</p>
    )}
  </div>
</div>

