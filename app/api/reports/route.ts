import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'

// GET - Generate reports
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams
    const reportType = searchParams.get('type') // 'daily', 'cashier', 'branch', 'refunds'
    const branchId = searchParams.get('branchId')
    const staffId = searchParams.get('staffId')
    const date = searchParams.get('date') || new Date().toISOString().split('T')[0]

    const startOfDay = new Date(date)
    startOfDay.setHours(0, 0, 0, 0)
    const endOfDay = new Date(date)
    endOfDay.setHours(23, 59, 59, 999)

    switch (reportType) {
      case 'daily': {
        const sales = await prisma.sale.findMany({
          where: {
            branchId: branchId || undefined,
            createdAt: {
              gte: startOfDay,
              lte: endOfDay,
            },
          },
          include: {
            items: true,
            prescriptionValidations: true,
          },
        })

        const totalSales = sales.reduce((sum, sale) => sum + sale.total, 0)
        const totalTransactions = sales.length
        const prescriptionSales = sales.filter(s => s.prescriptionValidations.length > 0).length

        return NextResponse.json({
          date,
          totalSales,
          totalTransactions,
          prescriptionSales,
          averageSale: totalTransactions > 0 ? totalSales / totalTransactions : 0,
          sales,
        })
      }

      case 'cashier': {
        const sales = await prisma.sale.findMany({
          where: {
            staffId: staffId || undefined,
            createdAt: {
              gte: startOfDay,
              lte: endOfDay,
            },
          },
          include: {
            items: true,
          },
        })

        const totalSales = sales.reduce((sum, sale) => sum + sale.total, 0)

        return NextResponse.json({
          staffId,
          date,
          totalSales,
          totalTransactions: sales.length,
          sales,
        })
      }

      case 'branch': {
        const sales = await prisma.sale.findMany({
          where: {
            branchId: branchId || undefined,
            createdAt: {
              gte: startOfDay,
              lte: endOfDay,
            },
          },
          include: {
            items: true,
            staff: true,
          },
        })

        const totalSales = sales.reduce((sum, sale) => sum + sale.total, 0)

        return NextResponse.json({
          branchId,
          date,
          totalSales,
          totalTransactions: sales.length,
          sales,
        })
      }

      case 'refunds': {
        const refunds = await prisma.refund.findMany({
          where: {
            branchId: branchId || undefined,
            createdAt: {
              gte: startOfDay,
              lte: endOfDay,
            },
          },
          include: {
            originalSale: true,
            reason: true,
          },
        })

        const totalRefunded = refunds.reduce((sum, refund) => sum + refund.refundAmount, 0)

        return NextResponse.json({
          date,
          totalRefunded,
          totalRefunds: refunds.length,
          refunds,
        })
      }

      default:
        return NextResponse.json({ error: 'Invalid report type' }, { status: 400 })
    }
  } catch (error) {
    console.error('Generate report error:', error)
    return NextResponse.json(
      { error: 'Failed to generate report' },
      { status: 500 }
    )
  }
}
