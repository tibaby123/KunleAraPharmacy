// compare-data.js
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

async function compareData() {
  // Count records in Supabase
  const productCount = await prisma.product.count()
  const branchCount = await prisma.branch.count()
  const saleCount = await prisma.sale.count()
  const staffCount = await prisma.staff.count()
  
  console.log('=== SUPABASE DATABASE ===')
  console.log(`Products: ${productCount}`)
  console.log(`Branches: ${branchCount}`)
  console.log(`Sales: ${saleCount}`)
  console.log(`Staff: ${staffCount}`)
  
  // Show sample products
  const products = await prisma.product.findMany({ take: 5 })
  console.log('\n=== SAMPLE PRODUCTS ===')
  products.forEach(p => {
    console.log(`${p.name} - ₦${p.price} - Stock: ${p.stockQuantity}`)
  })
  
  await prisma.$disconnect()
}

compareData()
