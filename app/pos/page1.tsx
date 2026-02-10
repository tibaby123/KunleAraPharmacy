'use client'

import { useState, useMemo } from 'react'
import Link from 'next/link'
import { kunleAraProducts } from '../data/kunle_ara_products'
// import RefundSystem from '../components/refund/RefundSystem' // Uncomment when component exists

// All your existing interfaces...
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

interface RefundItem {
  productId: string
  productName: string
  quantity: number
  unitPrice: number
  totalPrice: number
}

interface Branch {
  id: string
  name: string
  location: string
}

// CartItem interface to include prescription tracking
interface CartItem {
  product: Product
  quantity: number
  prescriberId?: string  // ADD this line to your existing interface
}

//  Sale interface to include prescription validations
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
  prescriptionValidations: PrescriptionValidation[] // ADD this line
}

// Add these NEW state variables after your existing ones
// Add these NEW interfaces at the top with your existing interfaces
interface PrescriptionValidation {
  itemId: string
  itemName: string
  prescriberId: string
  prescriberName: string
  validatedAt: Date
  validatedBy: string
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
const [showPrescriptionModal, setShowPrescriptionModal] = useState(false)
const [currentPrescriptionItem, setCurrentPrescriptionItem] = useState<CartItem | null>(null)
const [prescriberId, setPrescriberId] = useState('')
const [prescriberName, setPrescriberName] = useState('')
const [prescriptionValidations, setPrescriptionValidations] = useState<PrescriptionValidation[]>([])



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
  
  // MODIFY your existing activeTab state to include reports
  const [activeTab, setActiveTab] = useState<'sales' | 'refund' | 'reports'>('sales')


  // Add this after your other state declarations
  const currentBranch = branches.find(b => b.id === selectedBranch) || null

  /* ==================== AUTHENTICATION ==================== */

  const handleLogin = (e: React.FormEvent) => {
    e.preventDefault()
    if (staffId && password && selectedBranch) {
      setIsAuthenticated(true)
    } else {
      alert('Please fill in all fields')
    }
  }

  // Handler functions
  const handleRefund = (saleId: string, items: RefundItem[], reason: string) => {
    const originalSale = sales.find(sale => sale.id === saleId)
    if (!originalSale) {
      alert('Original sale not found')
      return
    }

    const refundAmount = items.reduce((total, item) => total + item.totalPrice, 0)
    
    const refund = {
      id: `REFUND-${Date.now()}`,
      originalSaleId: saleId,
      items,
      refundAmount,
      reason,
      processedBy: staffId,
      processedAt: new Date(),
      branchId: selectedBranch
    }

    console.log('Refund processed:', refund)
  }

  const handleStockUpdate = (productId: string, newStock: number, reason: string) => {
    console.log(`Stock updated for ${productId}: ${newStock}, Reason: ${reason}`)
    
    const stockUpdate = {
      productId,
      previousStock: kunleAraProducts.find(p => p.id === productId)?.stockQuantity || 0,
      newStock,
      reason,
      updatedBy: staffId,
      updatedAt: new Date(),
      branchId: selectedBranch
    }
    
    console.log('Stock update:', stockUpdate)
  }

  const handleAddProduct = (product: Omit<Product, 'id'>) => {
    const newProduct: Product = {
      ...product,
      id: `PROD-${Date.now()}`
    }
    
    console.log('New product added:', newProduct)
  }

  const handleSettingsUpdate = (settings: any) => {
    console.log('Settings updated:', settings)
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

  // REPLACE your existing addToCart function with this enhanced version
const addToCart = (product: any) => {
  const existingItem = cart.find(item => item.product.id === product.id)
  
  if (existingItem) {
    // If item already exists and has prescription validation, just increase quantity
    if (product.prescriptionRequired && !existingItem.prescriberId) {
      // Needs validation
      setCurrentPrescriptionItem({
        product,
        quantity: existingItem.quantity + 1
      })
      setShowPrescriptionModal(true)
    } else {
      // Already validated OR not prescription required
      setCart(cart.map(item => 
        item.product.id === product.id 
          ? { ...item, quantity: item.quantity + 1 }
          : item
      ))
    }
  } else {
    // New item
    if (product.prescriptionRequired) {
      setCurrentPrescriptionItem({
        product,
        quantity: 1
      })
      setShowPrescriptionModal(true)
    } else {
      setCart([...cart, { product, quantity: 1 }])
    }
  }
}


// ADD this NEW function after your existing handlers
const handlePrescriptionValidation = () => {
  const prescriberRegex = /^PR\d{5}$/
  if (!prescriberRegex.test(prescriberId)) {
    alert('Invalid Prescriber ID format. Must be PR00001 to PR99999')
    return
  }

  if (!prescriberName.trim()) {
    alert('Prescriber name is required')
    return
  }

  if (!currentPrescriptionItem) return

  const validation: PrescriptionValidation = {
    itemId: currentPrescriptionItem.product.id,
    itemName: currentPrescriptionItem.product.name,
    prescriberId: prescriberId,
    prescriberName: prescriberName,
    validatedAt: new Date(),
    validatedBy: staffId
  }

  setPrescriptionValidations([...prescriptionValidations, validation])

  const cartItem: CartItem = {
    ...currentPrescriptionItem,
    prescriberId: prescriberId
  }

  const existingItem = cart.find(item => item.product.id === currentPrescriptionItem.product.id)
  
  if (existingItem) {
    setCart(cart.map(item => 
      item.product.id === currentPrescriptionItem.product.id 
        ? cartItem
        : item
    ))
  } else {
    setCart([...cart, cartItem])
  }

  setShowPrescriptionModal(false)
  setCurrentPrescriptionItem(null)
  setPrescriberId('')
  setPrescriberName('')
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
      date: new Date(),
      prescriptionValidations: []
    }

    setHeldSales([...heldSales, heldSale])
    clearCart()
    alert('Sale held successfully!')
  }

 
  /*  const prescriptionItems = cart.filter(item => item.product.prescriptionRequired)
    if (prescriptionItems.length > 0) {
      if (!confirm(`This sale contains ${prescriptionItems.length} prescription item(s). Continue?`)) {
        return
      }
    }

    if (paymentMethod === 'cash' && amountReceived < total) {
      alert(`Insufficient amount! Required: ₦${total.toLocaleString()}, Received: ₦${amountReceived.toLocaleString()}`)
      return
    }*/
   
   // REPLACE your existing processSale function with this enhanced version
        const processSale = () => {
  if (cart.length === 0) {
    alert('Cart is empty!')
    return
  }

  // Check for prescription items without validation
  const unvalidatedPrescriptions = cart.filter(item => 
    item.product.prescriptionRequired && !item.prescriberId
  )

  if (unvalidatedPrescriptions.length > 0) {
    alert(`Cannot complete sale. The following prescription items need prescriber validation:\n${
      unvalidatedPrescriptions.map(item => item.product.name).join('\n')
    }`)
    return
  }

  // Check for prescription items confirmation
  const prescriptionItems = cart.filter(item => item.product.prescriptionRequired)
  if (prescriptionItems.length > 0) {
    if (!confirm(`This sale contains ${prescriptionItems.length} prescription item(s). Continue?`)) {
      return
    }
  }

  // Check payment amount
  if (paymentMethod === 'cash' && amountReceived < total) {
    alert(`Insufficient amount! Required: ₦${total.toLocaleString()}, Received: ₦${amountReceived.toLocaleString()}`)
    return
  }

  // Create the sale
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
    date: new Date(),
    prescriptionValidations: [...prescriptionValidations]
  }

  setSales([newSale, ...sales])
  clearCart()
  setPrescriptionValidations([])
  
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
          <div className="flex items-center space-x-2">
            {/* FIXED: Tab navigation */}
            
             // MODIFY your existing tab navigation to include reports
<div className="flex space-x-1 mr-4">
  <button
    onClick={() => setActiveTab('sales')}
    className={`px-3 py-1 rounded text-sm ${
      activeTab === 'sales'
        ? 'bg-green-700 text-white'
        : 'bg-green-500 text-green-100'
    }`}
  >
    Sales
  </button>
  <button
    onClick={() => setActiveTab('refund')}
    className={`px-3 py-1 rounded text-sm ${
      activeTab === 'refund'
        ? 'bg-green-700 text-white'
        : 'bg-green-500 text-green-100'
    }`}
  >
    Refunds
  </button>
  {/* ADD this new Reports tab */}
  <button
    onClick={() => setActiveTab('reports')}
    className={`px-3 py-1 rounded text-sm ${
      activeTab === 'reports'
        ? 'bg-green-700 text-white'
        : 'bg-green-500 text-green-100'
    }`}
  >
    Reports
  </button>
</div>

            
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
      {/* FIXED: Tab Content */}
      {activeTab === 'sales' && (
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
             {/* REPLACE your existing cart items section with this enhanced version */}
<div className="space-y-2 mb-4 max-h-64 overflow-y-auto">
  {cart.map(item => (
    <div key={item.product.id} className={`p-3 rounded ${
      item.product.prescriptionRequired ? 'bg-red-50 border border-red-200' : 'bg-gray-50'
    }`}>
      <div className="flex justify-between items-start">
        <div className="flex-1">
          <h4 className="font-semibold text-sm">{item.product.name}</h4>
          <p className="text-xs text-gray-600">₦{item.product.price.toLocaleString()} each</p>
          
          {/* ADD prescription status indicator */}
          {item.product.prescriptionRequired && (
            <div className="text-xs mt-1">
              {item.prescriberId ? (
                <span className="text-green-700 font-semibold">
                  ✅ Validated: {item.prescriberId}
                </span>
              ) : (
                <span className="text-red-700 font-semibold">
                  ⚠️ NEEDS VALIDATION
                </span>
              )}
            </div>
          )}
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

{/* ADD prescription summary after cart items */}
{cart.some(item => item.product.prescriptionRequired) && (
  <div className="bg-yellow-50 border border-yellow-200 p-3 rounded mb-4">
    <h4 className="font-semibold text-sm text-yellow-800 mb-2">
      🔒 Prescription Items Summary
    </h4>
    {cart.filter(item => item.product.prescriptionRequired).map(item => (
      <div key={item.product.id} className="text-xs text-yellow-700">
        • {item.product.name} - {item.prescriberId ? '✅ Validated' : '⚠️ Pending'}
      </div>
    ))}
  </div>
)}


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
      )}
{/* FIXED: Refund Tab Content */}
{activeTab === 'refund' && (
  <div className="p-4">
    <div className="bg-white rounded-lg p-6">
      <h2 className="text-2xl font-bold mb-4 text-red-600">Refund & Returns</h2>
      <p className="text-gray-600 mb-6">Process customer refunds and manage returns efficiently</p>
      
      {/* Refund Search Section */}
      <div className="bg-gray-50 rounded-lg p-4 mb-6">
        <h3 className="text-lg font-semibold mb-3">Find Transaction</h3>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <input
            type="text"
            placeholder="Receipt Number"
            className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500"
          />
          <input
            type="text"
            placeholder="Customer Phone"
            className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500"
          />
          <button className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">
            🔍 Search Transaction
          </button>
        </div>
      </div>

      {/* Refund Reasons */}
      <div className="mb-6">
        <h3 className="text-lg font-semibold mb-3">Refund Reason</h3>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
          {[
            'Product Expired',
            'Wrong Product Dispensed', 
            'Customer Changed Mind',
            'Product Defective',
            'Doctor Changed Prescription',
            'Duplicate Purchase',
            'Product Recall',
            'Other'
          ].map((reason) => (
            <label key={reason} className="flex items-center p-3 border border-gray-200 rounded-lg hover:bg-gray-50">
              <input
                type="radio"
                name="refundReason"
                value={reason}
                className="mr-3 text-red-600"
              />
              <span>{reason}</span>
            </label>
          ))}
        </div>
      </div>

      {/* Sample Transaction for Demo */}
      <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 mb-6">
        <h3 className="text-lg font-semibold mb-3 text-yellow-800">Sample Transaction Found</h3>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <p><strong>Receipt:</strong> REC-20240107-001</p>
            <p><strong>Date:</strong> January 7, 2024</p>
            <p><strong>Staff:</strong> {staffId}</p>
            <p><strong>Customer:</strong> Walk-in Customer</p>
          </div>
          <div>
            <p><strong>Total Amount:</strong> ₦3,500</p>
            <p><strong>Payment Method:</strong> Cash</p>
            <p><strong>Branch:</strong> {currentBranch?.name}</p>
          </div>
        </div>

        {/* Items to Refund */}
        <div className="mt-4">
          <h4 className="font-semibold mb-2">Items Purchased:</h4>
          <div className="space-y-2">
            {[
              { name: 'Paracetamol 500mg', qty: 2, price: 1200 },
              { name: 'Vitamin C 1000mg', qty: 1, price: 2300 }
            ].map((item, index) => (
              <div key={index} className="flex items-center justify-between p-3 bg-white rounded border">
                <div className="flex items-center">
                  <input
                    type="checkbox"
                    className="mr-3 text-red-600"
                    defaultChecked
                  />
                  <div>
                    <span className="font-medium">{item.name}</span>
                    <span className="text-gray-500 ml-2">Qty: {item.qty}</span>
                  </div>
                </div>
                <span className="font-semibold">₦{item.price.toLocaleString()}</span>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Refund Amount Calculation */}
      <div className="bg-red-50 border border-red-200 rounded-lg p-4 mb-6">
        <h3 className="text-lg font-semibold mb-3 text-red-800">Refund Calculation</h3>
        <div className="space-y-2">
          <div className="flex justify-between">
            <span>Items Total:</span>
            <span>₦3,500</span>
          </div>
          <div className="flex justify-between">
            <span>Restocking Fee (5%):</span>
            <span className="text-red-600">-₦175</span>
          </div>
          <div className="border-t pt-2 flex justify-between font-bold text-lg">
            <span>Refund Amount:</span>
            <span className="text-green-600">₦3,325</span>
          </div>
        </div>
      </div>

      {/* Refund Actions */}
      <div className="flex flex-col md:flex-row gap-4">
        <button className="flex-1 bg-red-600 text-white py-3 px-6 rounded-lg hover:bg-red-700 transition-colors">
          💰 Process Full Refund (₦3,325)
        </button>
        <button className="flex-1 bg-orange-600 text-white py-3 px-6 rounded-lg hover:bg-orange-700 transition-colors">
          🔄 Process Partial Refund
        </button>
        <button className="flex-1 bg-green-600 text-white py-3 px-6 rounded-lg hover:bg-green-700 transition-colors">
          🔄 Exchange for Store Credit
        </button>
      </div>

      {/* Additional Notes */}
      <div className="mt-6">
        <label className="block text-sm font-medium text-gray-700 mb-2">
          Additional Notes (Optional)
        </label>
        <textarea
          rows={3}
          className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500"
          placeholder="Enter any additional notes about this refund..."
        ></textarea>
      </div>

      {/* Recent Refunds */}
      <div className="mt-8">
        <h3 className="text-lg font-semibold mb-4">Recent Refunds Today</h3>
        <div className="bg-gray-50 rounded-lg p-4">
          {[
            { id: 'REF-001', amount: 1200, reason: 'Product Expired', time: '14:30' },
            { id: 'REF-002', amount: 3500, reason: 'Wrong Product', time: '12:15' },
            { id: 'REF-003', amount: 800, reason: 'Customer Changed Mind', time: '10:45' }
          ].map((refund, index) => (
            <div key={index} className="flex justify-between items-center p-3 bg-white rounded mb-2">
              <div>
                <span className="font-medium">{refund.id}</span>
                <span className="text-gray-500 ml-2">- {refund.reason}</span>
              </div>
              <div className="text-right">
                <div className="font-semibold text-red-600">₦{refund.amount.toLocaleString()}</div>
                <div className="text-xs text-gray-500">{refund.time}</div>
              </div>
            </div>
          ))}
          
          {/* Refund Summary */}
          <div className="mt-4 pt-4 border-t">
            <div className="flex justify-between font-bold">
              <span>Total Refunds Today:</span>
              <span className="text-red-600">₦5,500</span>
            </div>
            <div className="flex justify-between text-sm text-gray-600">
              <span>Number of Refunds:</span>
              <span>3 transactions</span>
            </div>
          </div>
        </div>
      </div>

      {/* Refund Policies Reminder */}
      <div className="mt-6 bg-blue-50 border border-blue-200 rounded-lg p-4">
        <h4 className="font-semibold mb-2 text-blue-800">🏥 Kunle Ara Pharmacy Refund Policy</h4>
        <ul className="text-sm text-blue-700 space-y-1">
          <li>• Prescription drugs: Refundable only if unopened and not expired</li>
          <li>• OTC medications: 30-day return policy with receipt</li>
          <li>• Personal care items: Must be unopened and in original packaging</li>
          <li>• Restocking fee applies to non-defective returns (5% of item value)</li>
          <li>• Manager approval required for refunds above ₦10,000</li>
        </ul>
      </div>
    </div>
  </div>
)}
{/* ADD this Prescription Validation Modal before your closing </div> */}
{showPrescriptionModal && currentPrescriptionItem && (
  <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
    <div className="bg-white p-8 rounded-2xl shadow-2xl max-w-md w-full mx-4">
      <div className="text-center mb-6">
        <div className="text-4xl mb-2">🔒</div>
        <h2 className="text-2xl font-bold text-red-600">Prescription Validation Required</h2>
        <p className="text-gray-600 mt-2">This item requires prescriber authorization</p>
      </div>

      <div className="bg-red-50 border border-red-200 p-4 rounded-lg mb-6">
        <h3 className="font-semibold text-red-800">{currentPrescriptionItem.product.name}</h3>
        <p className="text-sm text-red-600">Quantity: {currentPrescriptionItem.quantity}</p>
        <p className="text-sm text-red-600">Price: ₦{currentPrescriptionItem.product.price.toLocaleString()}</p>
      </div>

      <div className="space-y-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">
            Prescriber ID <span className="text-red-500">*</span>
          </label>
          <input
            type="text"
            value={prescriberId}
            onChange={(e) => setPrescriberId(e.target.value.toUpperCase())}
            placeholder="PR00001 to PR99999"
            pattern="PR\d{5}"
            maxLength={7}
            className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
            required
          />
          <p className="text-xs text-gray-500 mt-1">Format: PR followed by 5 digits (e.g., PR00123)</p>
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">
            Prescriber Name <span className="text-red-500">*</span>
          </label>
          <input
            type="text"
            value={prescriberName}
            onChange={(e) => setPrescriberName(e.target.value)}
            placeholder="Dr. John Smith"
            className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
            required
          />
        </div>

        <div className="bg-yellow-50 border border-yellow-200 p-3 rounded">
          <p className="text-xs text-yellow-800">
            <strong>Validation Info:</strong><br/>
            Cashier: {staffId}<br/>
            Branch: {branches.find(b => b.id === selectedBranch)?.name}<br/>
            Time: {new Date().toLocaleString()}
          </p>
        </div>
      </div>

      <div className="flex space-x-3 mt-6">
        <button
          onClick={() => {
            setShowPrescriptionModal(false)
            setCurrentPrescriptionItem(null)
            setPrescriberId('')
            setPrescriberName('')
          }}
          className="flex-1 bg-gray-500 text-white py-3 rounded-lg hover:bg-gray-600"
        >
          Cancel
        </button>
        <button
          onClick={handlePrescriptionValidation}
          disabled={!prescriberId || !prescriberName}
          className="flex-1 bg-green-600 text-white py-3 rounded-lg hover:bg-green-700 disabled:bg-gray-400 disabled:cursor-not-allowed font-semibold"
        >
          Validate & Add to Cart
        </button>
      </div>
    </div>
  </div>
)}

{/* ADD this Reports Tab Content after your refund tab */}
{activeTab === 'reports' && (
  <div className="p-4">
    <div className="bg-white rounded-lg p-6">
      <h2 className="text-2xl font-bold mb-4 text-blue-600">📊 Sales & Prescription Reports</h2>
      
      {/* Daily Summary */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div className="bg-green-50 border border-green-200 rounded-lg p-4">
          <h3 className="text-lg font-semibold text-green-800 mb-2">💰 Today's Sales</h3>
          <div className="text-2xl font-bold text-green-600">
            ₦{sales.reduce((sum, sale) => sum + sale.total, 0).toLocaleString()}
          </div>
          <p className="text-sm text-green-600">{sales.length} transactions</p>
        </div>
        
        <div className="bg-red-50 border border-red-200 rounded-lg p-4">
          <h3 className="text-lg font-semibold text-red-800 mb-2">🔒 Prescription Sales</h3>
          <div className="text-2xl font-bold text-red-600">
            {sales.filter(sale => sale.prescriptionValidations.length > 0).length}
          </div>
          <p className="text-sm text-red-600">
            {sales.reduce((sum, sale) => sum + sale.prescriptionValidations.length, 0)} items validated
          </p>
        </div>
        
        <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
          <h3 className="text-lg font-semibold text-blue-800 mb-2">📈 Average Sale</h3>
          <div className="text-2xl font-bold text-blue-600">
            ₦{sales.length > 0 ? (sales.reduce((sum, sale) => sum + sale.total, 0) / sales.length).toLocaleString() : '0'}
          </div>
          <p className="text-sm text-blue-600">per transaction</p>
        </div>
      </div>

      {/* Prescription Validations Today */}
      <div className="mb-8">
        <h3 className="text-xl font-semibold mb-4">🔒 Prescription Validations Today</h3>
        <div className="bg-gray-50 rounded-lg p-4">
          {sales.filter(sale => sale.prescriptionValidations.length > 0).length === 0 ? (
            <p className="text-gray-500 text-center py-8">No prescription validations today</p>
          ) : (
            <div className="space-y-3">
              {sales.filter(sale => sale.prescriptionValidations.length > 0).map(sale => (
                <div key={sale.id} className="bg-white border border-red-200 rounded-lg p-3">
                  <div className="flex justify-between items-start mb-2">
                    <div>
                      <span className="font-semibold">{sale.id}</span>
                      <span className="text-gray-500 ml-2">- {sale.customerName}</span>
                    </div>
                    <div className="text-right">
                      <div className="font-semibold">₦{sale.total.toLocaleString()}</div>
                      <div className="text-xs text-gray-500">{sale.date.toLocaleString()}</div>
                    </div>
                  </div>
                  
                  <div className="space-y-1">
                    {sale.prescriptionValidations.map((validation, index) => (
                      <div key={index} className="bg-red-50 p-2 rounded text-sm">
                        <div className="flex justify-between">
                          <span className="font-medium">{validation.itemName}</span>
                          <span className="text-red-600">{validation.prescriberId}</span>
                        </div>
                        <div className="text-gray-600">
                          Prescribed by: {validation.prescriberName}
                        </div>
                        <div className="text-xs text-gray-500">
                          Validated by {validation.validatedBy} at {validation.validatedAt.toLocaleString()}
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>

      {/* Sales Breakdown by Category */}
      <div className="mb-8">
        <h3 className="text-xl font-semibold mb-4">📊 Sales by Category</h3>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          {categories.filter(cat => cat.id !== 'all').map(category => {
            const categorySales = sales.reduce((sum, sale) => {
              return sum + sale.items
                .filter(item => item.product.category === category.id)
                .reduce((itemSum, item) => itemSum + (item.product.price * item.quantity), 0)
            }, 0)
            
            const categoryCount = sales.reduce((sum, sale) => {
              return sum + sale.items
                .filter(item => item.product.category === category.id)
                .reduce((itemSum, item) => itemSum + item.quantity, 0)
            }, 0)

            if (categoryCount === 0) return null

            return (
              <div key={category.id} className="bg-white border border-gray-200 rounded-lg p-4">
                <h4 className="font-semibold text-gray-800">{category.name}</h4>
                <div className="text-lg font-bold text-green-600">₦{categorySales.toLocaleString()}</div>
                <p className="text-sm text-gray-600">{categoryCount} items sold</p>
              </div>
            )
          })}
        </div>
      </div>

      {/* Export Options */}
      <div className="border-t pt-6">
        <h3 className="text-xl font-semibold mb-4">📄 Export Reports</h3>
        <div className="flex flex-wrap gap-3">
          <button className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">
            📊 Export Sales Data
          </button>
          <button className="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700">
            🔒 Export Prescription Log
          </button>
          <button className="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700">
            💰 Export Financial Summary
          </button>
        </div>
      </div>
    </div>
  </div>
)}

 </div>
  )
}
