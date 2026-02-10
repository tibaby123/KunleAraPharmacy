<<<<<<< HEAD
import { NextRequest, NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export async function GET(request: NextRequest) {
  try {
    console.log('DB URL:', process.env.DATABASE_URL?.substring(0, 50) + '...')
    const { searchParams } = new URL(request.url);
    const category = searchParams.get('category');
    const search = searchParams.get('search');
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '20');
    
    const where: any = {};
    
    if (category) {
      where.category = category;
    }
    
    if (search) {
      where.OR = [
        { name: { contains: search, mode: 'insensitive' } },
        { brand: { contains: search, mode: 'insensitive' } },
      ];
    }
    
    const [products, total] = await Promise.all([
      prisma.product.findMany({
        where,
        include: {
          inventory: {
            include: {
              branch: {
                select: {
                  id: true,
                  name: true,
                  code: true,
                },
              },
            },
          },
        },
        skip: (page - 1) * limit,
        take: limit,
        orderBy: { name: 'asc' },
      }),
      prisma.product.count({ where }),
    ]);
    
    const productsWithStock = products.map(product => {
      const totalStock = product.inventory.reduce((sum, inv) => sum + inv.quantity, 0);
      const availableStock = product.inventory.reduce(
        (sum, inv) => sum + (inv.quantity - inv.reservedQty),
        0
      );
      
      return {
        id: product.id,
        name: product.name,
        price: product.price,
        category: product.category,
        brand: product.brand,
        description: product.description,
        image: product.image,
        prescriptionRequired: product.prescriptionRequired,
        totalStock,
        availableStock,
        inStock: availableStock > 0,
        inventory: product.inventory.map(inv => ({
          branchId: inv.branch.id,
          branchName: inv.branch.name,
          branchCode: inv.branch.code,
          quantity: inv.quantity,
          reserved: inv.reservedQty,
          available: inv.quantity - inv.reservedQty,
        })),
      };
    });
    
    return NextResponse.json({
      products: productsWithStock,
      pagination: {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit),
      },
    });
  } catch (error: any) {
    console.error('Get products error:', error);
    return NextResponse.json(
      { error: 'Failed to fetch products', details: error.message },
      { status: 500 }
    );
=======
import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'

// GET - Fetch all products with filtering
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams
    const search = searchParams.get('search') || ''
    const category = searchParams.get('category') || ''
    const inStock = searchParams.get('inStock')

    const where: any = {}

    // Search by name or barcode
    if (search) {
      where.OR = [
        { name: { contains: search, mode: 'insensitive' } },
        { barcode: { contains: search } },
      ]
    }

    // Filter by category
    if (category && category !== 'all') {
      where.category = category
    }

    // Filter by stock status
    if (inStock === 'true') {
      where.inStock = true
      where.stockQuantity = { gt: 0 }
    }

    const products = await prisma.product.findMany({
      where,
      orderBy: { name: 'asc' },
    })

    return NextResponse.json({ products, total: products.length })
  } catch (error) {
    console.error('Get products error:', error)
    return NextResponse.json(
      { error: 'Failed to fetch products' },
      { status: 500 }
    )
  }
}

// POST - Create new product
export async function POST(request: NextRequest) {
  try {
    const body = await request.json()

    const product = await prisma.product.create({
      data: {
        name: body.name,
        price: parseFloat(body.price),
        category: body.category,
        brand: body.brand,
        inStock: body.inStock ?? true,
        stockQuantity: parseInt(body.stockQuantity),
        prescriptionRequired: body.prescriptionRequired ?? false,
        barcode: body.barcode,
        image: body.image,
      },
    })

    return NextResponse.json({ product }, { status: 201 })
  } catch (error) {
    console.error('Create product error:', error)
    return NextResponse.json(
      { error: 'Failed to create product' },
      { status: 500 }
    )
  }
}

// PUT - Update product
export async function PUT(request: NextRequest) {
  try {
    const body = await request.json()
    const { id, ...updateData } = body

    const product = await prisma.product.update({
      where: { id },
      data: updateData,
    })

    return NextResponse.json({ product })
  } catch (error) {
    console.error('Update product error:', error)
    return NextResponse.json(
      { error: 'Failed to update product' },
      { status: 500 }
    )
>>>>>>> f96f68f (Fix: Working version with all dependencies installed)
  }
}
