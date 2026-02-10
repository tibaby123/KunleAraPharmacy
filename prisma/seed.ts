import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  console.log('🌱 Starting database seed...')

  // ------------------------
  // Create Branches
  // ------------------------
  const branches = await Promise.all([
    prisma.branches.upsert({
      where: { id: 1 },
      update: {},
      create: {
        id: 1,
        name: 'UCH Branch',
        address: 'University College Hospital Area',
      },
    }),
    prisma.branches.upsert({
      where: { id: 2 },
      update: {},
      create: {
        id: 2,
        name: 'Yemetu Branch',
        address: 'Yemetu Area, Ibadan',
      },
    }),
    prisma.branches.upsert({
      where: { id: 3 },
      update: {},
      create: {
        id: 3,
        name: 'Ring Road Branch',
        address: 'Ring Road Area, Ibadan',
      },
    }),
  ])

  console.log(`✅ Created ${branches.length} branches`)

  // ------------------------
  // Create Refund Reasons
  // ------------------------
  const refundReasons = await Promise.all([
    prisma.refundReason.upsert({
      where: { reason: 'Product Expired' },
      update: {},
      create: { reason: 'Product Expired' },
    }),
    prisma.refundReason.upsert({
      where: { reason: 'Wrong Product Dispensed' },
      update: {},
      create: { reason: 'Wrong Product Dispensed' },
    }),
    prisma.refundReason.upsert({
      where: { reason: 'Customer Changed Mind' },
      update: {},
      create: { reason: 'Customer Changed Mind' },
    }),
    prisma.refundReason.upsert({
      where: { reason: 'Product Defective' },
      update: {},
      create: { reason: 'Product Defective' },
    }),
    prisma.refundReason.upsert({
      where: { reason: 'Doctor Changed Prescription' },
      update: {},
      create: { reason: 'Doctor Changed Prescription' },
    }),
    prisma.refundReason.upsert({
      where: { reason: 'Duplicate Purchase' },
      update: {},
      create: { reason: 'Duplicate Purchase' },
    }),
    prisma.refundReason.upsert({
      where: { reason: 'Product Recall' },
      update: {},
      create: { reason: 'Product Recall' },
    }),
    prisma.refundReason.upsert({
      where: { reason: 'Other' },
      update: {},
      create: { reason: 'Other' },
    }),
  ])

  console.log(`✅ Created ${refundReasons.length} refund reasons`)

  // ------------------------
  // Create Demo Staff
  // ------------------------
  await prisma.staff.upsert({
    where: { id: 1 },
    update: {},
    create: {
      id: 1,
      name: 'Demo Cashier',
      email: 'demo@pharmacy.local',
      branch_id: 1,
      role: 'cashier',
    },
  })

  console.log('✅ Created demo staff account')
  console.log('\n🎉 Database seeded successfully!')
}

main()
  .catch((e) => {
    console.error('❌ Seed error:', e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
