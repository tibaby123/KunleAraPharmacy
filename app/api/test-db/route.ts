import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export async function GET() {
  try {
    const count = await prisma.product.count();
    return NextResponse.json({ 
      success: true, 
      productCount: count,
      database: process.env.DATABASE_URL?.split('@')[1]?.split('/')[0] || 'unknown'
    });
  } catch (error: any) {
    return NextResponse.json({ 
      success: false, 
      error: error.message,
      database: process.env.DATABASE_URL?.split('@')[1]?.split('/')[0] || 'unknown'
    }, { status: 500 });
  }
}
