import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'

// GET - Fetch sales with filtering
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams
    const branchId = searchParams.get('branchId')
    const staffId = searchParams.get('staffId')
    const startDate = searchParams.get('startDate')
    const endDate = searchParams.get('endDate')

    const where: any = {}

    if (branchId) where.branchId = branchId
    if (staffId) where.staffId = staffId
    
    if (startDate || endDate) {
      where.createdAt = {}
      if (startDate) where.createdAt.gte = new Date(startDate)
      if (endDate) where.createdAt.lte = new Date(endDate)
    }

    const sales = await prisma.sale.findMany({
      where,
      include: {
        items: {
          include: {
            product: true,
          },
        },
        prescriptionValidations: true,
        staff: true,
        branch: true,
      },
      orderBy: { createdAt: 'desc' },
      take: 100, // Limit to last 100 sales
    })

    // Calculate totals
    const totalSales = sales.reduce((sum, sale) => sum + sale.total, 0)
    const totalTransactions = sales.length

    return NextResponse.json({
      sales,
      summary: {
        totalSales,
        totalTransactions,
        averageSale: totalTransactions > 0 ? totalSales / totalTransactions : 0,
      },
    })
  } catch (error) {
    console.error('Get sales error:', error)
    return NextResponse.json(
      { error: 'Failed to fetch sales' },
      { status: 500 }
    )
  }
}

// POST - Create new sale
export async function POST(request: NextRequest) {
  try {
    const body = await request.json()

    // Generate receipt number
    const receiptNumber = `SALE-${Date.now()}`

    // Create sale with items and prescriptions
    const sale = await prisma.sale.create({
      data: {
        receiptNumber,
        subtotal: body.subtotal,
        tax: body.tax,
        total: body.total,
        discount: body.discount || 0,
        paymentMethod: body.paymentMethod,
        amountReceived: body.amountReceived,
        change: body.change,
        staffId: body.staffId,
        customerName: body.customerName,
        customerPhone: body.customerPhone,
        branchId: body.branchId,
        items: {
          create: body.items.map((item: any) => ({
            productId: item.product.id,
            productName: item.product.name,
            quantity: item.quantity,
            unitPrice: item.product.price,
            totalPrice: item.product.price * item.quantity,
            prescriberId: item.prescriberId,
          })),
        },
        prescriptionValidations: {
          create: body.prescriptionValidations || [],
        },
      },
      include: {
        items: true,
        prescriptionValidations: true,
      },
    })

    // Update product stock quantities
    for (const item of body.items) {
      await prisma.product.update({
        where: { id: item.product.id },
        data: {
          stockQuantity: {
            decrement: item.quantity,
          },
        },
      })
    }

    return NextResponse.json({ sale }, { status: 201 })
  } catch (error) {
    console.error('Create sale error:', error)
    return NextResponse.json(
      { error: 'Failed to create sale' },
      { status: 500 }
    )
  }
}
