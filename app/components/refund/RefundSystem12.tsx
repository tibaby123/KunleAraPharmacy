'use client'

import { useState, useRef } from 'react'
/*import { kunleAraProducts } from '../../data/kunle_ara_products'*/

interface RefundItem {
  id: string
  productId: string
  productName: string
  quantity: number
  unitPrice: number
  totalPrice: number
  refundableQuantity: number
}

interface RefundTransaction {
  refundId: string
  originalReceiptId: string
  originalSaleDate: Date
  refundDate: Date
  items: RefundItem[]
  refundType: 'full' | 'partial' | 'exchange'
  refundAmount: number
  staffId: string
  customerName?: string
  reason: string
  status: 'pending' | 'approved' | 'completed' | 'rejected'
  barcode: string
}

interface OriginalSale {
  receiptId: string
  saleDate: Date
  items: Array<{
    productId: string
    productName: string
    quantity: number
    unitPrice: number
    totalPrice: number
  }>
  totalAmount: number
  staffId: string
  customerName?: string
}

export default function RefundSystem({ staffId }: { staffId: string }) {

  const [currentStep, setCurrentStep] = useState<'lookup' | 'process' | 'complete'>('lookup')
  const [lookupMethod, setLookupMethod] = useState<'receipt' | 'barcode'>('receipt')

  const [lookupValue, setLookupValue] = useState('')
  const [originalSale, setOriginalSale] = useState<OriginalSale | null>(null)
  const [selectedItems, setSelectedItems] = useState<RefundItem[]>([])
  type RefundUIType = 'refund' | 'exchange' | 'adjustment'
type RefundResultType = 'full' | 'partial' | 'exchange'
 
 const [refundType, setRefundType] = useState<RefundUIType>('refund')

  const [refundReason, setRefundReason] = useState('')
  const [customerName, setCustomerName] = useState('')
  const [exchangeItems, setExchangeItems] = useState<any[]>([])
  const [isScanning, setIsScanning] = useState(false)
  const scannerRef = useRef<HTMLInputElement>(null)
  const normaliseLookupValue = (value: string) =>
  value.replace(/\*/g, '').trim().toUpperCase()


  // Generate unique refund ID
  const generateRefundId = () => {
    const timestamp = Date.now().toString(36)
    const random = Math.random().toString(36).substring(2, 8)
    return `REF-${timestamp}-${random}`.toUpperCase()
  }

  // Generate refund barcode
  const generateRefundBarcode = (refundId: string) => {
    return `*${refundId}*` // Code 39 format
  }

  // Mock function to lookup original sale (in real app, this would query your database)
  const lookupOriginalSale = (identifier: string): OriginalSale | null => {
    // Simulate database lookup
    const mockSales: OriginalSale[] = [
      {
        receiptId: 'SALE-001',
        saleDate: new Date(Date.now() - 24 * 60 * 60 * 1000), // Yesterday
        items: [
          {
            productId: 'kunle_ara_001',
            productName: 'Paracetamol 500mg Tablets',
            quantity: 2,
            unitPrice: 600,
            totalPrice: 1200
          },
          {
            productId: 'kunle_ara_002', 
            productName: 'Vitamin C 1000mg',
            quantity: 1,
            unitPrice: 2500,
            totalPrice: 2500
          }
        ],
        totalAmount: 3700,
        staffId: 'STAFF001',
        customerName: 'John Doe'
      },
      {
        receiptId: 'SALE-002',
        saleDate: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000), // 2 days ago
        items: [
          {
            productId: 'kunle_ara_003',
            productName: 'Dettol Antiseptic 250ml',
            quantity: 1,
            unitPrice: 1500,
            totalPrice: 1500
          }
        ],
        totalAmount: 1500,
        staffId: 'STAFF002'
      }
    ]

    return mockSales.find(sale => 
      sale.receiptId === identifier || 
      generateRefundBarcode(sale.receiptId) === identifier
    ) || null
  }

  // Handle sale lookup
  const handleLookup = () => {
    if (!lookupValue.trim()) {
      alert('Please enter a receipt number or scan a barcode')
      return
    }

    const sale = lookupOriginalSale(normaliseLookupValue(lookupValue))

    if (sale) {
      setOriginalSale(sale)
      
      // Initialize refund items
      const refundItems: RefundItem[] = sale.items.map(item => ({
        id: `refund_${item.productId}`,
        productId: item.productId,
        productName: item.productName,
        quantity: item.quantity,
        unitPrice: item.unitPrice,
        totalPrice: item.totalPrice,
        refundableQuantity: item.quantity // Initially all items are refundable
      }))
      
      setSelectedItems(refundItems)
      setCustomerName(sale.customerName || '')
      setCurrentStep('process')
    } else {
      alert('Sale not found. Please check the receipt number or barcode.')
    }
  }

  // Handle barcode scanning
  const handleBarcodeScan = () => {
    setIsScanning(true)
    scannerRef.current?.focus()
    
    // Simulate barcode scanner (in real app, integrate with actual scanner)
    setTimeout(() => {
      setIsScanning(false)
      // Mock scanned barcode
      setLookupValue('*REF-SALE-001*')
    }, 2000)
  }

  // Update refundable quantity
  const updateRefundQuantity = (itemId: string, newQuantity: number) => {
    setSelectedItems(items => 
      items.map(item => 
        item.id === itemId 
          ? { 
              ...item, 
              refundableQuantity: Math.min(Math.max(0, newQuantity), item.quantity),
              totalPrice: item.unitPrice * Math.min(Math.max(0, newQuantity), item.quantity)
            }
          : item
      )
    )
  }

  // Calculate totals
  const calculateRefundTotal = () => {
    return selectedItems.reduce((total, item) => total + (item.unitPrice * item.refundableQuantity), 0)
  }

  const calculateExchangeTotal = () => {
    return exchangeItems.reduce((total, item) => total + (item.price * item.quantity), 0)
  }

  const calculateDifference = () => {
    return calculateExchangeTotal() - calculateRefundTotal()
  }

  // Process refund
  const processRefund = () => {
    const refundId = generateRefundId()
    const barcode = generateRefundBarcode(refundId)
    
    const refundTransaction: RefundTransaction = {
      refundId,
      originalReceiptId: originalSale!.receiptId,
      originalSaleDate: originalSale!.saleDate,
      refundDate: new Date(),
      items: selectedItems.filter(item => item.refundableQuantity > 0),
      refundType:
  refundType === 'exchange'
    ? 'exchange'
    : selectedItems.every(i => i.refundableQuantity === i.quantity)
    ? 'full'
    : 'partial',

      refundAmount: calculateRefundTotal(),
      staffId, // Get from current session
      customerName,
      reason: refundReason,
      status: 'completed',
      barcode
    }

    // In real app, save to database
    console.log('Refund Transaction:', refundTransaction)
    
    // Show completion
    setCurrentStep('complete')
    
    // Print receipt
    printRefundReceipt(refundTransaction)
  }

  // Print refund receipt
  const printRefundReceipt = (transaction: RefundTransaction) => {
    const receiptContent = `
===========================================
        KUNLE ARA PHARMACY
           REFUND RECEIPT
===========================================

Refund ID: ${transaction.refundId}
Original Receipt: ${transaction.originalReceiptId}
Date: ${transaction.refundDate.toLocaleString()}
Staff: ${transaction.staffId}
${transaction.customerName ? `Customer: ${transaction.customerName}` : ''}

-------------------------------------------
REFUNDED ITEMS:
-------------------------------------------
${transaction.items.map(item => 
  `${item.productName}\n  Qty: ${item.refundableQuantity} × ₦${item.unitPrice.toLocaleString()} = ₦${(item.refundableQuantity * item.unitPrice).toLocaleString()}`
).join('\n')}

-------------------------------------------
REFUND TOTAL: ₦${transaction.refundAmount.toLocaleString()}

${refundType === 'exchange' ? `
EXCHANGE ITEMS:
${exchangeItems.map(item => 
  `${item.name}\n  Qty: ${item.quantity} × ₦${item.price.toLocaleString()} = ₦${(item.quantity * item.price).toLocaleString()}`
).join('\n')}

EXCHANGE TOTAL: ₦${calculateExchangeTotal().toLocaleString()}
${calculateDifference() > 0 ? `AMOUNT TO PAY: ₦${calculateDifference().toLocaleString()}` : `REFUND BALANCE: ₦${Math.abs(calculateDifference()).toLocaleString()}`}
` : ''}

Reason: ${transaction.reason}

Refund Barcode: ${transaction.barcode}

===========================================
     Thank you for shopping with us
        Terms and conditions apply
===========================================
    `

    // In real app, send to printer
    console.log('Receipt Content:', receiptContent)
    alert('Refund receipt printed successfully!')
  }

  // Reset process
  const resetProcess = () => {
    setCurrentStep('lookup')
    setLookupValue('')
    setOriginalSale(null)
    setSelectedItems([])
    setRefundType('refund')
    setRefundReason('')
    setCustomerName('')
    setExchangeItems([])
  }

  return (
    <div className="min-h-screen bg-gray-50 p-4">
      <div className="max-w-4xl mx-auto">
        {/* Header */}
        <div className="bg-white rounded-lg shadow-md p-6 mb-6">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold text-gray-800">🔄 Refund Management System</h1>
              <p className="text-gray-600 mt-1">Process returns, exchanges, and price adjustments</p>
            </div>
            {currentStep !== 'lookup' && (
              <button
                onClick={resetProcess}
                className="bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-gray-600"
              >
                New Refund
              </button>
            )}
          </div>
        </div>

        {/* Step 1: Lookup Original Sale */}
        {currentStep === 'lookup' && (
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-2xl font-semibold mb-6">🔍 Lookup Original Sale</h2>
            
            {/* Lookup Method Selection */}
            <div className="mb-6">
              <label className="block text-sm font-medium text-gray-700 mb-3">
                Lookup Method
              </label>
              <div className="flex space-x-4">
                <label className="flex items-center">
                  <input
                    type="radio"
                    value="receipt"
                    checked={lookupMethod === 'receipt'}
                    onChange={(e) => setLookupMethod(e.target.value as 'receipt' | 'barcode')}
                    className="mr-2"
                  />
                  📄 Receipt Number
                </label>
                <label className="flex items-center">
                  <input
                    type="radio"
                    value="barcode"
                    checked={lookupMethod === 'barcode'}
                    onChange={(e) => setLookupMethod(e.target.value as 'receipt' | 'barcode')}
                    className="mr-2"
                  />
                  🔍 Scan Barcode
                </label>
              </div>
            </div>

            {/* Input Section */}
            <div className="mb-6">
              <label className="block text-sm font-medium text-gray-700 mb-2">
                {lookupMethod === 'receipt' ? 'Enter Receipt Number' : 'Scan or Enter Barcode'}
              </label>
              
              <div className="flex space-x-3">
                <input
                  ref={scannerRef}
                  type="text"
                  value={lookupValue}
                  onChange={(e) => setLookupValue(e.target.value)}
                  placeholder={lookupMethod === 'receipt' ? 'e.g., SALE-001' : 'e.g., *REF-12345*'}
                  className="flex-1 p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                  disabled={isScanning}
                />
                
                {lookupMethod === 'barcode' && (
                  <button
                    onClick={handleBarcodeScan}
                    disabled={isScanning}
                    className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 disabled:bg-gray-400 flex items-center"
                  >
                    {isScanning ? (
                      <>
                        <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white mr-2"></div>
                        Scanning...
                      </>
                    ) : (
                      <>📷 Scan</>
                    )}
                  </button>
                )}
                
                <button
                  onClick={handleLookup}
                  className="bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700"
                >
                  🔍 Lookup
                </button>
              </div>
            </div>

            {/* Demo Data Helper */}
            <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
              <h3 className="font-semibold text-blue-800 mb-2">📋 Demo Data Available:</h3>
              <div className="text-sm text-blue-700 space-y-1">
                <p>• Receipt: <code>SALE-001</code> (₦3,700 - Paracetamol + Vitamin C)</p>
                <p>• Receipt: <code>SALE-002</code> (₦1,500 - Dettol Antiseptic)</p>
                <p>• Barcode: <code>*REF-SALE-001*</code></p>
              </div>
            </div>
          </div>
        )}

        {/* Step 2: Process Refund */}
        {currentStep === 'process' && originalSale && (
          <div className="space-y-6">
            {/* Original Sale Info */}
            <div className="bg-white rounded-lg shadow-md p-6">
              <h2 className="text-2xl font-semibold mb-4">📄 Original Sale Details</h2>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                <div>
                  <p><strong>Receipt ID:</strong> {originalSale.receiptId}</p>
                  <p><strong>Sale Date:</strong> {originalSale.saleDate.toLocaleDateString()}</p>
                  <p><strong>Staff:</strong> {originalSale.staffId}</p>
                </div>
                <div>
                  <p><strong>Customer:</strong> {originalSale.customerName || 'Walk-in Customer'}</p>
                  <p><strong>Total Amount:</strong> ₦{originalSale.totalAmount.toLocaleString()}</p>
                </div>
              </div>
            </div>

            {/* Refund Items */}
            <div className="bg-white rounded-lg shadow-md p-6">
              <h3 className="text-xl font-semibold mb-4">🛍️ Select Items to Refund</h3>
              
              <div className="space-y-4">
                {selectedItems.map((item) => (
                  <div key={item.id} className="flex items-center justify-between p-4 border border-gray-200 rounded-lg">
                    <div className="flex-1">
                      <h4 className="font-semibold">{item.productName}</h4>
                      <p className="text-sm text-gray-600">
                        Original: {item.quantity} × ₦{item.unitPrice.toLocaleString()} = ₦{(item.quantity * item.unitPrice).toLocaleString()}
                      </p>
                    </div>
                    
                    <div className="flex items-center space-x-3">
                      <label className="text-sm font-medium">Refund Qty:</label>
                      <input
                        type="number"
                        min="0"
                        max={item.quantity}
                        value={item.refundableQuantity}
                        onChange={(e) => updateRefundQuantity(item.id, parseInt(e.target.value) || 0)}
                        className="w-20 p-2 border border-gray-300 rounded text-center"
                      />
                      <span className="text-sm font-semibold text-green-600">
                        ₦{(item.unitPrice * item.refundableQuantity).toLocaleString()}
                      </span>
                    </div>
                  </div>
                ))}
              </div>
              
              <div className="mt-4 p-4 bg-green-50 border border-green-200 rounded-lg">
                <div className="flex justify-between items-center">
                  <span className="text-lg font-semibold">Refund Total:</span>
                  <span className="text-2xl font-bold text-green-600">₦{calculateRefundTotal().toLocaleString()}</span>
                </div>
              </div>
            </div>

            {/* Refund Type and Details */}
            <div className="bg-white rounded-lg shadow-md p-6">
              <h3 className="text-xl font-semibold mb-4">🔄 Refund Type</h3>
              
              <div className="space-y-4">
                {/* Refund Type Selection */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Select Refund Type</label>
                  <div className="flex space-x-4">
                    <label className="flex items-center">
                      <input
                        type="radio"
                        value="refund"
                        checked={refundType === 'refund'}
                        onChange={(e) => setRefundType(e.target.value as any)}
                        className="mr-2"
                      />
                      💰 Full Refund
                    </label>
                    <label className="flex items-center">
                      <input
                        type="radio"
                        value="exchange"
                        checked={refundType === 'exchange'}
                        onChange={(e) => setRefundType(e.target.value as any)}
                        className="mr-2"
                      />
                      🔄 Exchange
                    </label>
                    <label className="flex items-center">
                      <input
                        type="radio"
                        value="adjustment"
                        checked={refundType === 'adjustment'}
                        onChange={(e) => setRefundType(e.target.value as any)}
                        className="mr-2"
                      />
                      ⚖️ Price Adjustment
                    </label>
                  </div>
                </div>

                {/* Customer Name */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Customer Name</label>
                  <input
                    type="text"
                    value={customerName}
                    onChange={(e) => setCustomerName(e.target.value)}
                    placeholder="Enter customer name"
                    className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                  />
                </div>

                {/* Refund Reason */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Reason for Refund</label>
                  <select
                    value={refundReason}
                    onChange={(e) => setRefundReason(e.target.value)}
                    className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                  >
                    <option value="">Select reason...</option>
                    <option value="defective">Defective Product</option>
                    <option value="expired">Expired Product</option>
                    <option value="wrong-item">Wrong Item Purchased</option>
                    <option value="customer-changed-mind">Customer Changed Mind</option>
                    <option value="price-error">Price Error</option>
                    <option value="damaged-packaging">Damaged Packaging</option>
                    <option value="other">Other</option>
                  </select>
                </div>

                {/* Exchange Items (if exchange selected) */}
                {refundType === 'exchange' && (
                  <div>
                    <h4 className="font-semibold mb-2">🛍️ Exchange Items</h4>
                    <p className="text-sm text-gray-600 mb-4">Select items for exchange:</p>
                    
                    {/* This would be integrated with your product catalog */}
                    <div className="border border-gray-200 rounded-lg p-4 bg-gray-50">
                      <p className="text-sm text-gray-500">Exchange item selection would be integrated with your product catalog here.</p>
                      {calculateDifference() !== 0 && (
                        <div className="mt-4 p-3 bg-blue-50 border border-blue-200 rounded">
                          <p className="text-sm">
                            {calculateDifference() > 0 
                              ? `Customer pays additional: ₦${calculateDifference().toLocaleString()}`
                              : `Refund balance: ₦${Math.abs(calculateDifference()).toLocaleString()}`
                            }
                          </p>
                        </div>
                      )}
                    </div>
                  </div>
                )}
              </div>
            </div>

            {/* Action Buttons */}
            <div className="bg-white rounded-lg shadow-md p-6">
              <div className="flex justify-between">
                <button
                  onClick={() => setCurrentStep('lookup')}
                  className="bg-gray-500 text-white px-6 py-3 rounded-lg hover:bg-gray-600"
                >
                  ← Back to Lookup
                </button>
                
                <button
                  onClick={processRefund}
                  disabled={!refundReason || calculateRefundTotal() === 0}
                  className="bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 disabled:bg-gray-400 disabled:cursor-not-allowed"
                >
                  ✅ Process Refund (₦{calculateRefundTotal().toLocaleString()})
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Step 3: Completion */}
        {currentStep === 'complete' && (
          <div className="bg-white rounded-lg shadow-md p-6 text-center">
            <div className="mb-6">
              <div className="text-6xl mb-4">✅</div>
              <h2 className="text-3xl font-bold text-green-600 mb-2">Refund Processed Successfully!</h2>
              <p className="text-gray-600">The refund receipt has been printed and the transaction is complete.</p>
            </div>
            
            <div className="bg-green-50 border border-green-200 rounded-lg p-4 mb-6">
              <p className="text-green-800">
                <strong>Refund Amount:</strong> ₦{calculateRefundTotal().toLocaleString()}
              </p>
              <p className="text-green-800">
                <strong>Transaction ID:</strong> REF-{Date.now().toString(36).toUpperCase()}
              </p>
            </div>
            
            <button
              onClick={resetProcess}
              className="bg-blue-600 text-white px-8 py-3 rounded-lg hover:bg-blue-700 text-lg"
            >
              🔄 Process Another Refund
            </button>
          </div>
        )}
      </div>
    </div>
  )
}
