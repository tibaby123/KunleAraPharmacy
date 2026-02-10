import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'

// GET - Fetch refunds
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams
    const branchId = searchParams.get('branchId')

    const where: any = {}
    if (branchId) where.branchId = branchId

    const refunds = await prisma.refund.findMany({
      where,
      include: {
        originalSale: {
          include: {
            items: true,
          },
        },
        reason: true,
        branch: true,
      },
      orderBy: { createdAt: 'desc' },
    })

    return NextResponse.json({ refunds })
  } catch (error) {
    console.error('Get refunds error:', error)
    return NextResponse.json(
      { error: 'Failed to fetch refunds' },
      { status: 500 }
    )
  }
}

// POST - Create refund
export async function POST(request: NextRequest) {
  try {
    const body = await request.json()

    const refund = await prisma.refund.create({
      data: {
        originalSaleId: body.originalSaleId,
        refundAmount: body.refundAmount,
        reasonId: body.reasonId,
        customReason: body.customReason,
        processedBy: body.processedBy,
        branchId: body.branchId,
      },
      include: {
        originalSale: true,
        reason: true,
      },
    })

    return NextResponse.json({ refund }, { status: 201 })
  } catch (error) {
    console.error('Create refund error:', error)
    return NextResponse.json(
      { error: 'Failed to create refund' },
      { status: 500 }
    )
  }
}
