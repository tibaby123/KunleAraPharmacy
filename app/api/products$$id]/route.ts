import { NextRequest, NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export async function GET(
  request: NextRequest,
  { params }: { params: { id: string } }
) {
  try {
    const product = await prisma.product.findUnique({
      where: { id: params.id },
      include: {
        inventory: {
          include: {
            branch: true,
          },
        },
      },
    });
    
    if (!product) {
      return NextResponse.json(
        { error: 'Product not found' },
        { status: 404 }
      );
    }
    
    const totalStock = product.inventory.reduce((sum, inv) => sum + inv.quantity, 0);
    const availableStock = product.inventory.reduce(
      (sum, inv) => sum + (inv.quantity - inv.reservedQty),
      0
    );
    
    return NextResponse.json({
      id: product.id,
      name: product.name,
      price: product.price,
      category: product.category,
      brand: product.brand,
      description: product.description,
      image: product.image,
      barcode: product.barcode,
      sku: product.sku,
      prescriptionRequired: product.prescriptionRequired,
      totalStock,
      availableStock,
      inStock: availableStock > 0,
      inventory: product.inventory.map(inv => ({
        branchId: inv.branch.id,
        branchName: inv.branch.name,
        branchCode: inv.branch.code,
        location: inv.branch.location,
        address: inv.branch.address,
        phone: inv.branch.phone,
        quantity: inv.quantity,
        reserved: inv.reservedQty,
        available: inv.quantity - inv.reservedQty,
      })),
    });
  } catch (error: any) {
    console.error('Get product error:', error);
    return NextResponse.json(
      { error: 'Failed to fetch product' },
      { status: 500 }
    );
  }
}
