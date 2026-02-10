'use client'

import { useState, useMemo } from 'react'
import Link from 'next/link'
import { kunleAraProducts } from '../data/kunle_ara_products'
import { 
  Staff, 
  Prescriber, 
  Transaction, 
  ManagerOverride,
  PrescriberCodeGenerator,
  ManagerOverrideSystem,
  PrescriptionTracker,
  ReportsAccessControl,
  samplePrescribers,
  sampleStaff 
} from '../lib/pharmacySystem'

interface CartItem {
  product: any
  quantity: number
  prescriber?: Prescriber
}




export default function EnhancedPOSPage() {
  // Authentication & Staff Management
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [currentStaff, setCurrentStaff] = useState<Staff | null>(null)
  const [staffId, setStaffId] = useState('')
  const [password, setPassword] = useState('')
  const [currentBranch, setCurrentBranch] = useState<string>('')

  // Cart & Transaction Management  
  const [cart, setCart] = useState<CartItem[]>([])
  const [customerName, setCustomerName] = useState('')
  const [paymentMethod, setPaymentMethod] = useState<'cash' | 'card' | 'transfer' | 'insurance'>('cash')

  // Prescription Management
  const [selectedPrescriber, setSelectedPrescriber] = useState<Prescriber | null>(null)
  const [prescriptionMode, setPrescriptionMode] = useState(false)
  const [prescribers] = useState<Prescriber[]>(samplePrescribers)

  // Override & Refund Management
  const [showOverrideDialog, setShowOverrideDialog] = useState(false)
  const [overrideReason, setOverrideReason] = useState('')
  const [pendingRefund, setPendingRefund] = useState<any>(null)

  // Search & Filter
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('all')

  // Enhanced Login with Role-based Access
  const handleLogin = (e: React.FormEvent) => {
    e.preventDefault()
    
    // Find staff member (in real app, this would be server-side authentication)
    const staff = sampleStaff.find(s => s.staffCode.toLowerCase() === staffId.toLowerCase())
    
    if (staff && password) {
      setCurrentStaff(staff)
      setCurrentBranch(staff.branch)
      setIsAuthenticated(true)
      console.log(`Logged in: ${staff.name} (${staff.role}) at ${staff.branch} branch`)
    } else {
      alert('Invalid credentials. Try ADMIN001, PHARM001, or MGR001')
    }
  }

  // Enhanced Product Filtering
  const filteredProducts = useMemo(() => {
    return kunleAraProducts.filter(product => {
      const matchesSearch = product.name.toLowerCase().includes(searchTerm.toLowerCase())
      const matchesCategory = selectedCategory === 'all' || product.category === selectedCategory
      return matchesSearch && matchesCategory && product.inStock
    })
  }, [searchTerm, selectedCategory])

  // Add to Cart with Prescription Validation
  const addToCart = (product: any) => {
    if (product.prescriptionRequired && !prescriptionMode) {
      alert('This is a prescription medication. Please enable prescription mode and select a prescriber.')
      return
    }

    if (product.prescriptionRequired && prescriptionMode && !selectedPrescriber) {
      alert('Please select a prescriber for this prescription medication.')
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
      const newItem: CartItem = {
        product,
        quantity: 1,
        prescriber: product.prescriptionRequired ? selectedPrescriber! : undefined
      }
      setCart([...cart, newItem])
    }
  }

  // Calculate totals
  const subtotal = cart.reduce((sum, item) => sum + (item.product.price * item.quantity), 0)
  const tax = subtotal * 0.075 // 7.5% VAT
  const total = subtotal + tax

  // Process Sale with Full Audit Trail
  const processSale = () => {
    if (cart.length === 0) {
      alert('Cart is empty!')
      return
    }

    if (!currentStaff) {
      alert('Staff authentication required!')
      return
    }

    // Validate prescription items
    const prescriptionItems = cart.filter(item => item.product.prescriptionRequired)
    if (prescriptionItems.length > 0 && !selectedPrescriber) {
      alert('Prescriber selection required for prescription items!')
      return
    }

    // Create transaction with full audit trail
    const transactionItems = cart.map(item => ({
      productId: item.product.id,
      productName: item.product.name,
      quantity: item.quantity,
      unitPrice: item.product.price,
      totalPrice: item.product.price * item.quantity,
      isPrescription: item.product.prescriptionRequired,
      prescriber: item.prescriber
    }))

    const transaction: Transaction = {
      id: `TXN_${Date.now()}`,
      type: 'sale',
      items: transactionItems,
      subtotal,
      tax,
      total,
      paymentMethod,
      
      // Full audit trail as requested
      cashier: currentStaff,
      till: 'TILL001', // Would be dynamic in real system
      branch: currentBranch,
      prescriber: selectedPrescriber || undefined,
      prescriptionNumber: prescriptionItems.length > 0 ? `RX${currentBranch}${Date.now().toString().slice(-6)}` : undefined,
      
      createdAt: new Date(),
      updatedAt: new Date(),
      status: 'completed'
    }

    console.log('Transaction processed with full audit trail:', transaction)
    
    // Clear cart and reset
    setCart([])
    setCustomerName('')
    setSelectedPrescriber(null)
    setPrescriptionMode(false)
    
    alert(`Sale completed! 
    Total: ₦${total.toLocaleString()}
    Transaction ID: ${transaction.id}
    ${transaction.prescriptionNumber ? `Prescription #: ${transaction.prescriptionNumber}` : ''}
    Cashier: ${currentStaff.name}
    Branch: ${currentBranch}`)
  }

  // Request Manager Override
  const requestManagerOverride = async (reason: string, amount: number) => {
    if (!currentStaff) return

    const override = await ManagerOverrideSystem.requestOverride(
      currentStaff,
      reason,
      amount,
      'current_transaction'
    )

    console.log('Manager override requested:', override)
    alert(`Override code generated: ${override.code}\nWaiting for manager approval...`)
    
    setShowOverrideDialog(false)
    setOverrideReason('')
  }

  // Login Screen
  if (!isAuthenticated) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-green-50 to-blue-50 flex items-center justify-center">
        <div className="bg-white p-8 rounded-2xl shadow-2xl max-w-md w-full">
          <div className="text-center mb-8">
            <div className="text-4xl mb-4">🏥</div>
            <h1 className="text-3xl font-bold text-gray-800">Kunle Ara Pharmacy</h1>
            <h2 className="text-xl text-green-600 font-semibold">Enhanced POS System</h2>
            <p className="text-gray-600 mt-2">Professional Pharmacy Management</p>
          </div>

          <form onSubmit={handleLogin} className="space-y-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Staff Code
              </label>
              <input
                type="text"
                value={staffId}
                onChange={(e) => setStaffId(e.target.value)}
                placeholder="Enter your staff code (e.g., ADMIN001)"
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
              Login to Enhanced POS
            </button>
          </form>

          <div className="mt-6 text-center text-sm text-gray-500">
            <p>Demo Staff Codes:</p>
            <p>ADMIN001 - Full Access | PHARM001 - Pharmacist | MGR001 - Manager</p>
          </div>
        </div>
      </div>
    )
  }

  // Main Enhanced POS Interface
  return (
    <div className="min-h-screen bg-gray-100">
      {/* Enhanced Header with Full Staff Info */}
      <div className="bg-green-600 text-white p-4">
        <div className="flex justify-between items-center">
          <div>
            <h1 className="text-2xl font-bold">Kunle Ara Pharmacy - Enhanced POS</h1>
            <div className="flex items-center space-x-6 text-green-100 text-sm">
              <span>👤 {currentStaff?.name} ({currentStaff?.role.toUpperCase()})</span>
              <span>🏢 {currentBranch} Branch</span>
              <span>📅 {new Date().toLocaleDateString()}</span>
              <span>🕒 {new Date().toLocaleTimeString()}</span>
            </div>
          </div>
          <div className="flex space-x-2">
            {ReportsAccessControl.canAccessReports(currentStaff!) && (
              <Link href="/reports">
                <button className="bg-blue-600 hover:bg-blue-700 px-4 py-2 rounded text-sm">
                  📊 Reports
                </button>
              </Link>
            )}
            <button
              onClick={() => setIsAuthenticated(false)}
              className="bg-red-600 hover:bg-red-700 px-4 py-2 rounded text-sm"
            >
              Logout
            </button>
          </div>
        </div>

        {/* Prescription Mode Toggle */}
        <div className="mt-4 flex items-center space-x-4">
          <label className="flex items-center">
            <input
              type="checkbox"
              checked={prescriptionMode}
              onChange={(e) => setPrescriptionMode(e.target.checked)}
              className="mr-2"
            />
            <span className="text-sm">💊 Prescription Mode</span>
          </label>
          
          {prescriptionMode && (
            <select
              value={selectedPrescriber?.code || ''}
              onChange={(e) => {
                const prescriber = prescribers.find(p => p.code === e.target.value)
                setSelectedPrescriber(prescriber || null)
              }}
              className="text-black px-3 py-1 rounded text-sm"
            >
              <option value="">Select Prescriber...</option>
              {prescribers.map(prescriber => (
                <option key={prescriber.code} value={prescriber.code}>
                  {prescriber.code} - Dr. {prescriber.name}
                </option>
              ))}
            </select>
          )}
        </div>
      </div>

      {/* Rest of POS interface with all 76 products... */}
      <div className="p-4">
        <div className="bg-blue-50 border border-blue-200 p-3 rounded-lg mb-4">
          <p className="text-blue-800 text-sm">
            📦 Enhanced POS with {kunleAraProducts.length} products | 
            🔐 Role-based access | 💊 Prescription tracking | 📊 Full audit trail
          </p>
        </div>
        
        {/* Search and filters */}
        <div className="bg-white p-4 rounded-lg shadow mb-4">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
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
              <option value="supplements">💪 Health Supplements</option>
              <option value="beverages">🥤 Beverages & Drinks</option>
              <option value="snacks">🍿 Snacks & Confectionery</option>
              <option value="personal-care">🧴 Personal Care</option>
              <option value="household">🏠 Household Items</option>
              <option value="baby-care">👶 Baby Care</option>
              <option value="herbal-natural">🌿 Herbal & Natural</option>
              <option value="fitness-wellness">🏃 Fitness & Wellness</option>
            </select>
            <select
              value={paymentMethod}
              onChange={(e) => setPaymentMethod(e.target.value as any)}
              className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
            >
              <option value="cash">💰 Cash</option>
              <option value="card">💳 Card</option>
              <option value="transfer">🏦 Transfer</option>
              <option value="insurance">🏥 Insurance</option>
            </select>
          </div>
        </div>

        {/* Products grid showing all 76 products */}
        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 max-h-96 overflow-y-auto">
          {filteredProducts.map(product => (
            <button
              key={product.id}
              onClick={() => addToCart(product)}
              className="bg-white p-4 rounded-lg shadow hover:shadow-md transition-shadow text-left"
            >
              <h3 className="font-semibold text-sm mb-1">{product.name}</h3>
              <p className="text-xs text-gray-600 mb-2">{product.brand}</p>
              <div className="flex justify-between items-center">
                <span className="text-green-600 font-bold">₦{product.price.toLocaleString()}</span>
                <span className="text-xs text-gray-500">{product.stockQuantity} left</span>
              </div>
              {product.prescriptionRequired && (
                <div className="text-xs bg-red-100 text-red-800 px-1 py-0.5 rounded mt-1">
                  💊 Rx Required
                </div>
              )}
            </button>
          ))}
        </div>
      </div>

      {/* Enhanced Cart with Prescription Tracking */}
      <div className="fixed right-4 top-20 w-96 bg-white rounded-lg shadow-2xl p-4 max-h-screen overflow-y-auto">
        <h2 className="text-xl font-bold mb-4">Current Sale - {currentBranch}</h2>
        
        {/* Customer Info */}
        <input
          type="text"
          placeholder="Customer name (optional)"
          value={customerName}
          onChange={(e) => setCustomerName(e.target.value)}
          className="w-full p-2 border border-gray-300 rounded mb-4"
        />

        {/* Cart Items with Prescription Info */}
        <div className="space-y-2 mb-4 max-h-64 overflow-y-auto">
          {cart.map(item => (
            <div key={item.product.id} className="bg-gray-50 p-3 rounded">
              <h4 className="font-semibold text-sm">{item.product.name}</h4>
              <p className="text-xs text-gray-600">₦{item.product.price.toLocaleString()} each</p>
              {item.prescriber && (
                <p className="text-xs text-blue-600">👨‍⚕️ Dr. {item.prescriber.name} ({item.prescriber.code})</p>
              )}
              <div className="flex items-center justify-between mt-2">
                <div className="flex items-center space-x-2">
                  <button
                    onClick={() => {
                      if (item.quantity > 1) {
                        setCart(cart.map(cartItem => 
                          cartItem.product.id === item.product.id 
                            ? { ...cartItem, quantity: cartItem.quantity - 1 }
                            : cartItem
                        ))
                      } else {
                        setCart(cart.filter(cartItem => cartItem.product.id !== item.product.id))
                      }
                    }}
                    className="bg-gray-200 hover:bg-gray-300 px-2 py-1 rounded text-sm"
                  >
                    -
                  </button>
                  <span className="font-semibold">{item.quantity}</span>
                  <button
                    onClick={() => {
                      setCart(cart.map(cartItem => 
                        cartItem.product.id === item.product.id 
                          ? { ...cartItem, quantity: cartItem.quantity + 1 }
                          : cartItem
                      ))
                    }}
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


{/* Enhanced Totals */}
<div className="border-t pt-4 space-y-2">
  <div className="flex justify-between">
    <span>Subtotal:</span>
    <span>₦{subtotal.toLocaleString()}</span>
  </div>
  <div className="flex justify-between">
    <span>VAT (7.5%):</span>
    <span>₦{tax.toLocaleString()}</span>
  </div>
  <div className="flex justify-between">
    <span>Discount:</span>
    <span className="text-green-600">-₦{discount.toLocaleString()}</span>
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
  <select
    value={paymentMethod}
    onChange={(e) => setPaymentMethod(e.target.value)}
    className="w-full p-2 border border-gray-300 rounded focus:ring-2 focus:ring-green-500"
  >
    <option value="cash">💵 Cash</option>
    <option value="card">💳 Card</option>
    <option value="transfer">🏦 Bank Transfer</option>
    <option value="pos">📱 POS Terminal</option>
  </select>
</div>

{/* Cash Payment Input */}
{paymentMethod === 'cash' && (
  <div className="mt-4">
    <label className="block text-sm font-medium text-gray-700 mb-2">
      Amount Received
    </label>
    <input
      type="number"
      value={amountReceived}
      onChange={(e) => setAmountReceived(parseFloat(e.target.value) || 0)}
      placeholder="Enter amount received"
      className="w-full p-2 border border-gray-300 rounded focus:ring-2 focus:ring-green-500"
    />
    {amountReceived >= total && (
      <div className="mt-2 text-sm">
        <span className="text-gray-600">Change: </span>
        <span className="font-bold text-green-600">
          ₦{(amountReceived - total).toLocaleString()}
        </span>
      </div>
    )}
  </div>
)}

{/* Action Buttons */}
<div className="space-y-2 mt-6">
  <button
    onClick={processSale}
    disabled={cart.length === 0 || (paymentMethod === 'cash' && amountReceived < total)}
    className="w-full bg-green-600 text-white py-3 rounded-lg hover:bg-green-700 disabled:bg-gray-400 disabled:cursor-not-allowed font-semibold text-lg"
  >
    {paymentMethod === 'cash' ? 
      `Complete Sale - Change: ₦${Math.max(0, amountReceived - total).toLocaleString()}` :
      `Complete Sale - ₦${total.toLocaleString()}`
    }
  </button>
  
  <div className="grid grid-cols-2 gap-2">
    <button
      onClick={() => setCart([])}
      className="bg-red-600 text-white py-2 rounded-lg hover:bg-red-700"
    >
      Clear Cart
    </button>
    <button
      onClick={holdSale}
      className="bg-yellow-600 text-white py-2 rounded-lg hover:bg-yellow-700"
    >
      Hold Sale
    </button>
  </div>
  
  <button
    onClick={applyDiscount}
    className="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700"
  >
    Apply Discount
  </button>
</div>

{/* Customer Information */}
<div className="mt-6 border-t pt-4">
  <h3 className="font-semibold mb-2">Customer Information</h3>
  <input
    type="text"
    placeholder="Customer name (optional)"
    value={customerName}
    onChange={(e) => setCustomerName(e.target.value)}
    className="w-full p-2 border border-gray-300 rounded mb-2"
  />
  <input
    type="tel"
    placeholder="Phone number (optional)"
    value={customerPhone}
    onChange={(e) => setCustomerPhone(e.target.value)}
    className="w-full p-2 border border-gray-300 rounded"
  />
</div>

{/* Recent Sales */}
<div className="mt-6">
  <h3 className="font-semibold mb-2">Recent Sales ({sales.length})</h3>
  <div className="text-xs space-y-1 max-h-32 overflow-y-auto">
    {sales.slice(-5).reverse().map(sale => (
      <div key={sale.id} className="bg-gray-50 p-2 rounded flex justify-between">
        <div>
          <div className="font-medium">{sale.customerName || 'Walk-in'}</div>
          <div className="text-gray-500">{new Date(sale.date).toLocaleTimeString()}</div>
        </div>
        <div className="text-right">
          <div className="font-bold">₦{sale.total.toLocaleString()}</div>
          <div className="text-gray-500">{sale.items.length} items</div>
        </div>
      </div>
    ))}
  </div>
</div>

{/* Daily Summary */}
<div className="mt-6 bg-blue-50 p-3 rounded-lg">
  <h3 className="font-semibold mb-2 text-blue-800">Daily Summary</h3>
  <div className="text-sm space-y-1">
    <div className="flex justify-between">
      <span>Sales Count:</span>
      <span className="font-bold">{sales.length}</span>
    </div>
    <div className="flex justify-between">
      <span>Total Revenue:</span>
      <span className="font-bold text-green-600">
        ₦{sales.reduce((sum, sale) => sum + sale.total, 0).toLocaleString()}
      </span>
    </div>
    <div className="flex justify-between">
      <span>Average Sale:</span>
      <span className="font-bold">
        ₦{sales.length > 0 ? Math.round(sales.reduce((sum, sale) => sum + sale.total, 0) / sales.length).toLocaleString() : '0'}
      </span>
    </div>
  </div>
</div>
