import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'

// GET - Fetch all active refund reasons
export async function GET() {
  try {
    const reasons = await prisma.refundReason.findMany({
      where: { isActive: true },
      orderBy: { reason: 'asc' },
    })

    return NextResponse.json({ reasons })
  } catch (error) {
    console.error('Get refund reasons error:', error)
    return NextResponse.json(
      { error: 'Failed to fetch refund reasons' },
      { status: 500 }
    )
  }
}
