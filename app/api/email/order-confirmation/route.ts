// app/api/email/order-confirmation/route.ts
import { NextRequest, NextResponse } from 'next/server'
import { emailService } from '../../../lib/email/service'

export async function POST(request: NextRequest) {
  try {
    const orderData = await request.json()
    
    const success = await emailService.sendOrderConfirmation({
      customerEmail: orderData.customerEmail,
      customerName: orderData.customerName,
      orderNumber: orderData.orderNumber,
      items: orderData.items,
      total: orderData.total,
      branch: orderData.branch
    })

    if (success) {
      return NextResponse.json({ success: true, message: 'Order confirmation sent' })
    } else {
      return NextResponse.json({ success: false, message: 'Failed to send email' }, { status: 500 })
    }
  } catch (error) {
    return NextResponse.json({ success: false, error: error.message }, { status: 500 })
  }
}
