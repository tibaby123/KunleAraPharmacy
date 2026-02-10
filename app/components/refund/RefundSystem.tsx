'use client'

import { useState, useRef } from 'react'

/* ================= TYPES ================= */

type RefundUIType = 'refund' | 'exchange' | 'adjustment'
type RefundResultType = 'full' | 'partial' | 'exchange'
type RefundMethod = 'cash' | 'bank' | 'pos_reversal' | 'store_credit'

interface RefundItem {
  id: string
  productId: string
  productName: string
  quantity: number
  unitPrice: number
  refundableQuantity: number
}

interface OriginalSale {
  receiptId: string
  saleDate: Date
  staffId: string
  customerName?: string
  items: {
    productId: string
    productName: string
    quantity: number
    unitPrice: number
  }[]
}

interface StoreCredit {
  creditId: string        // REF-xxx
  originalSaleId: string // SALE-xxx
  issuedAmount: number
  remainingBalance: number
  status: 'open' | 'partially_used' | 'consumed'
  createdAt: string
}

/* ================= COMPONENT ================= */

export default function RefundSystem({ staffId }: { staffId: string }) {

  /* ---------- STATE ---------- */

  const [currentStep, setCurrentStep] =
    useState<'lookup' | 'process' | 'complete'>('lookup')

  const [lookupValue, setLookupValue] = useState('')
  const [originalSale, setOriginalSale] = useState<OriginalSale | null>(null)
  const [selectedItems, setSelectedItems] = useState<RefundItem[]>([])

  const [refundType, setRefundType] = useState<RefundUIType>('refund')
  const [refundMethod, setRefundMethod] =
    useState<RefundMethod>('pos_reversal')

  const [refundReason, setRefundReason] = useState('')
  const [customerName, setCustomerName] = useState('')
  const [customerEmail, setCustomerEmail] = useState('')

  const scannerRef = useRef<HTMLInputElement>(null)

  /* ---------- HELPERS ---------- */

  const normaliseLookupValue = (value: string) =>
    value.replace(/\*/g, '').trim().toUpperCase()

  const generateRefundId = () =>
    `REF-${Date.now().toString(36).toUpperCase()}`

  const generateRefundBarcode = (id: string) => `*${id}*`

  const saveStoreCredit = (credit: StoreCredit) => {
    const existing: StoreCredit[] = JSON.parse(
      localStorage.getItem('kunleara_store_credits') || '[]'
    )

    existing.push(credit)

    localStorage.setItem(
      'kunleara_store_credits',
      JSON.stringify(existing)
    )
  }

  /* ---------- MOCK SALES LOOKUP (TEMPORARY) ---------- */

  const lookupOriginalSale = (key: string): OriginalSale | null => {
    const mockSales: OriginalSale[] = [
      {
        receiptId: 'SALE-001',
        saleDate: new Date(Date.now() - 86400000),
        staffId: 'STAFF001',
        customerName: 'John Doe',
        items: [
          {
            productId: 'P001',
            productName: 'Paracetamol 500mg',
            quantity: 2,
            unitPrice: 600
          }
        ]
      }
    ]

    return mockSales.find(s => s.receiptId === key) || null
  }

  /* ---------- LOOKUP ---------- */

  const handleLookup = () => {
    const key = normaliseLookupValue(lookupValue)
    if (!key) {
      alert('Enter receipt number or scan barcode')
      return
    }

    const sale = lookupOriginalSale(key)
    if (!sale) {
      alert('Sale not found')
      return
    }

    setOriginalSale(sale)
    setCustomerName(sale.customerName || '')

    setSelectedItems(
      sale.items.map(i => ({
        id: `refund_${i.productId}`,
        productId: i.productId,
        productName: i.productName,
        quantity: i.quantity,
        unitPrice: i.unitPrice,
        refundableQuantity: i.quantity
      }))
    )

    setCurrentStep('process')
  }

  /* ---------- TOTAL ---------- */

  const refundTotal = selectedItems.reduce(
    (sum, i) => sum + i.unitPrice * i.refundableQuantity,
    0
  )

  /* ---------- RECEIPT OUTPUT ---------- */

  const outputReceipt = (content: string) => {
    if (customerEmail) {
      window.location.href =
        `mailto:${customerEmail}?subject=Refund Receipt&body=${encodeURIComponent(content)}`
    } else {
      const win = window.open('', '_blank')
      if (win) {
        win.document.write(`<pre>${content}</pre>`)
        win.print()
      }
    }
  }

  /* ---------- PROCESS REFUND ---------- */

  const processRefund = () => {
    if (!originalSale) return

    const refundId = generateRefundId()

    const resultType: RefundResultType =
      refundType === 'exchange'
        ? 'exchange'
        : selectedItems.every(i => i.refundableQuantity === i.quantity)
        ? 'full'
        : 'partial'

    if (refundMethod === 'store_credit') {
      const credit: StoreCredit = {
        creditId: refundId,
        originalSaleId: originalSale.receiptId,
        issuedAmount: refundTotal,
        remainingBalance: refundTotal,
        status: 'open',
        createdAt: new Date().toISOString()
      }
      saveStoreCredit(credit)
    }

    const receiptContent = `
===========================================
        KUNLE ARA PHARMACY
           REFUND RECEIPT
===========================================

Refund Ref: ${refundId}
Original Receipt: ${originalSale.receiptId}
Date: ${new Date().toLocaleString()}
Staff: ${staffId}
Customer: ${customerName || 'Walk-in'}

-------------------------------------------
${selectedItems
  .filter(i => i.refundableQuantity > 0)
  .map(
    i =>
      `${i.productName}
  ${i.refundableQuantity} × ₦${i.unitPrice.toLocaleString()} = ₦${(
        i.refundableQuantity * i.unitPrice
      ).toLocaleString()}`
  )
  .join('\n')}

-------------------------------------------
Refund Type: ${resultType.toUpperCase()}
Refund Method: ${refundMethod.replace('_', ' ').toUpperCase()}

${refundMethod === 'store_credit' ? `
STORE CREDIT ISSUED
Credit Ref: ${refundId}
Credit Amount: ₦${refundTotal.toLocaleString()}
Credit Balance: ₦${refundTotal.toLocaleString()}
` : `
Amount Refunded: ₦${refundTotal.toLocaleString()}
`}

Refund Barcode: ${generateRefundBarcode(refundId)}
===========================================
`

    outputReceipt(receiptContent)
    setCurrentStep('complete')
  }

  /* ---------- UI ---------- */

  return (
    <div className="bg-white p-6 rounded shadow max-w-3xl mx-auto">

      {currentStep === 'lookup' && (
        <>
          <h2 className="text-xl font-bold mb-4">Refund Lookup</h2>
          <input
            ref={scannerRef}
            value={lookupValue}
            onChange={e => setLookupValue(e.target.value)}
            placeholder="Receipt number or barcode"
            className="border p-2 w-full mb-3"
          />
          <button
            onClick={handleLookup}
            className="bg-green-600 text-white px-4 py-2 rounded"
          >
            Lookup Sale
          </button>
        </>
      )}

      {currentStep === 'process' && (
        <>
          <h2 className="text-xl font-bold mb-4">Process Refund</h2>

          <div className="mb-3">
            <label className="block text-sm font-medium mb-1">Refund Method</label>
            <select
              value={refundMethod}
              onChange={e => setRefundMethod(e.target.value as RefundMethod)}
              className="border p-2 w-full"
            >
              <option value="pos_reversal">POS Reversal</option>
              <option value="cash">Cash</option>
              <option value="bank">Bank Transfer</option>
              <option value="store_credit">Store Credit</option>
            </select>
          </div>

          <div className="mb-3">
            <label className="block text-sm font-medium mb-1">Refund Reason</label>
            <select
              value={refundReason}
              onChange={e => setRefundReason(e.target.value)}
              className="border p-2 w-full"
            >
              <option value="">Select reason</option>
              <option value="expired">Expired</option>
              <option value="defective">Defective</option>
              <option value="wrong-item">Wrong Item</option>
            </select>
          </div>

          <input
            placeholder="Customer email (optional)"
            value={customerEmail}
            onChange={e => setCustomerEmail(e.target.value)}
            className="border p-2 w-full mb-4"
          />

          <button
            onClick={processRefund}
            disabled={!refundReason || refundTotal === 0}
            className="bg-green-600 text-white px-4 py-2 rounded disabled:opacity-50"
          >
            Process Refund ₦{refundTotal.toLocaleString()}
          </button>
        </>
      )}

      {currentStep === 'complete' && (
        <div className="text-center text-green-600 font-bold">
          Refund completed successfully
        </div>
      )}
    </div>
  )
}
