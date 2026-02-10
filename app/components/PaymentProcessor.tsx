'use client'

import { useState } from 'react'

interface PaymentMethod {
  id: string
  name: string
  icon: string
  type: 'cash' | 'card' | 'transfer' | 'mobile'
  enabled: boolean
}

interface PaymentProcessorProps {
  total: number
  onPaymentComplete: (payment: PaymentRecord) => void
  onCancel: () => void
}

interface PaymentRecord {
  method: string
  amount: number
  reference?: string
  timestamp: Date
  status: 'completed' | 'pending' | 'failed'
}

const paymentMethods: PaymentMethod[] = [
  { id: 'cash', name: 'Cash', icon: '💵', type: 'cash', enabled: true },
  { id: 'pos', name: 'POS Card', icon: '💳', type: 'card', enabled: true },
  { id: 'transfer', name: 'Bank Transfer', icon: '🏦', type: 'transfer', enabled: true },
  { id: 'ussd', name: 'USSD (*901#)', icon: '📱', type: 'mobile', enabled: true },
  { id: 'paystack', name: 'Paystack', icon: '💰', type: 'card', enabled: true },
  { id: 'flutterwave', name: 'Flutterwave', icon: '🔄', type: 'card', enabled: true },
  { id: 'mtn', name: 'MTN MoMo', icon: '📲', type: 'mobile', enabled: true },
  { id: 'airtel', name: 'Airtel Money', icon: '📲', type: 'mobile', enabled: true },
]

export default function PaymentProcessor({ total, onPaymentComplete, onCancel }: PaymentProcessorProps) {
  const [selectedMethod, setSelectedMethod] = useState<PaymentMethod | null>(null)
  const [amountReceived, setAmountReceived] = useState<number>(total)
  const [isProcessing, setIsProcessing] = useState(false)
  const [customerPhone, setCustomerPhone] = useState('')
  const [reference, setReference] = useState('')

  const change = amountReceived - total
  const isValidPayment = amountReceived >= total

  const processPayment = async () => {
    if (!selectedMethod || !isValidPayment) return

    setIsProcessing(true)
    
    try {
      let paymentRecord: PaymentRecord

      switch (selectedMethod.type) {
        case 'cash':
          paymentRecord = await processCashPayment()
          break
        case 'card':
          paymentRecord = await processCardPayment()
          break
        case 'transfer':
          paymentRecord = await processTransferPayment()
          break
        case 'mobile':
          paymentRecord = await processMobilePayment()
          break
        default:
          throw new Error('Invalid payment method')
      }

      onPaymentComplete(paymentRecord)
    } catch (error) {
      console.error('Payment processing error:', error)
      alert('Payment failed. Please try again.')
    } finally {
      setIsProcessing(false)
    }
  }

  const processCashPayment = async (): Promise<PaymentRecord> => {
    // Simulate cash processing
    await new Promise(resolve => setTimeout(resolve, 1000))
    
    return {
      method: 'Cash',
      amount: amountReceived,
      timestamp: new Date(),
      status: 'completed'
    }
  }

  const processCardPayment = async (): Promise<PaymentRecord> => {
    // Simulate card processing (integrate with Paystack/Flutterwave)
    await new Promise(resolve => setTimeout(resolve, 3000))
    
    const transactionRef = `TXN_${Date.now()}`
    
    return {
      method: selectedMethod?.name || 'Card',
      amount: total,
      reference: transactionRef,
      timestamp: new Date(),
      status: 'completed'
    }
  }

  const processTransferPayment = async (): Promise<PaymentRecord> => {
    // Show bank details and wait for confirmation
    const bankDetails = {
      accountName: 'Kunle Ara Pharmacy Ltd',
      accountNumber: '0123456789',
      bankName: 'First Bank Nigeria',
      amount: total
    }

    // In real implementation, verify payment via webhook
    await new Promise(resolve => setTimeout(resolve, 2000))
    
    return {
      method: 'Bank Transfer',
      amount: total,
      reference: reference,
      timestamp: new Date(),
      status: 'completed'
    }
  }

  const processMobilePayment = async (): Promise<PaymentRecord> => {
    // Process mobile money payment
    await new Promise(resolve => setTimeout(resolve, 2500))
    
    return {
      method: selectedMethod?.name || 'Mobile Money',
      amount: total,
      reference: `${selectedMethod?.id.toUpperCase()}_${Date.now()}`,
      timestamp: new Date(),
      status: 'completed'
    }
  }

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <div className="bg-white rounded-lg p-6 max-w-md w-full mx-4 max-h-96 overflow-y-auto">
        <div className="flex justify-between items-center mb-6">
          <h2 className="text-2xl font-bold">Payment Processing</h2>
          <button
            onClick={onCancel}
            className="text-gray-500 hover:text-gray-700"
          >
            ✕
          </button>
        </div>

        {/* Payment Summary */}
        <div className="bg-gray-50 p-4 rounded-lg mb-6">
          <div className="flex justify-between items-center text-lg font-semibold">
            <span>Total Amount:</span>
            <span className="text-green-600">₦{total.toLocaleString()}</span>
          </div>
        </div>

        {/* Payment Method Selection */}
        {!selectedMethod ? (
          <div>
            <h3 className="text-lg font-semibold mb-4">Select Payment Method</h3>
            <div className="grid grid-cols-2 gap-3">
              {paymentMethods.filter(method => method.enabled).map(method => (
                <button
                  key={method.id}
                  onClick={() => setSelectedMethod(method)}
                  className="flex flex-col items-center p-4 border border-gray-200 rounded-lg hover:border-blue-500 hover:bg-blue-50 transition-colors"
                >
                  <span className="text-2xl mb-1">{method.icon}</span>
                  <span className="text-sm font-medium">{method.name}</span>
                </button>
              ))}
            </div>
          </div>
        ) : (
          <div>
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-semibold">
                {selectedMethod.icon} {selectedMethod.name}
              </h3>
              <button
                onClick={() => setSelectedMethod(null)}
                className="text-sm text-blue-500 hover:underline"
              >
                Change Method
              </button>
            </div>

            {/* Payment Method Specific UI */}
            {selectedMethod.type === 'cash' && (
              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium mb-1">Amount Received</label>
                  <input
                    type="number"
                    value={amountReceived}
                    onChange={(e) => setAmountReceived(Number(e.target.value))}
                    className="w-full p-3 border border-gray-300 rounded-lg text-lg"
                    min={total}
                  />
                </div>
                {change > 0 && (
                  <div className="bg-yellow-50 border border-yellow-200 p-3 rounded">
                    <strong>Change: ₦{change.toLocaleString()}</strong>
                  </div>
                )}
              </div>
            )}

            {selectedMethod.type === 'mobile' && (
              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium mb-1">Customer Phone Number</label>
                  <input
                    type="tel"
                    value={customerPhone}
                    onChange={(e) => setCustomerPhone(e.target.value)}
                    placeholder="08012345678"
                    className="w-full p-3 border border-gray-300 rounded-lg"
                  />
                </div>
              </div>
            )}

            {selectedMethod.type === 'transfer' && (
              <div className="space-y-4">
                <div className="bg-blue-50 border border-blue-200 p-4 rounded">
                  <h4 className="font-semibold mb-2">Transfer Details:</h4>
                  <p><strong>Account:</strong> Kunle Ara Pharmacy Ltd</p>
                  <p><strong>Number:</strong> 0123456789</p>
                  <p><strong>Bank:</strong> First Bank Nigeria</p>
                  <p><strong>Amount:</strong> ₦{total.toLocaleString()}</p>
                </div>
                <div>
                  <label className="block text-sm font-medium mb-1">Transaction Reference</label>
                  <input
                    type="text"
                    value={reference}
                    onChange={(e) => setReference(e.target.value)}
                    placeholder="Enter transaction reference"
                    className="w-full p-3 border border-gray-300 rounded-lg"
                  />
                </div>
              </div>
            )}

            {/* Process Payment Button */}
            <button
              onClick={processPayment}
              disabled={!isValidPayment || isProcessing}
              className={`w-full py-3 rounded-lg font-semibold mt-6 ${
                isValidPayment && !isProcessing
                  ? 'bg-green-500 text-white hover:bg-green-600'
                  : 'bg-gray-300 text-gray-500 cursor-not-allowed'
              }`}
            >
              {isProcessing ? (
                <span className="flex items-center justify-center">
                  <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-white mr-2"></div>
                  Processing...
                </span>
              ) : (
                `Process Payment (₦${total.toLocaleString()})`
              )}
            </button>
          </div>
        )}
      </div>
    </div>
  )
}
