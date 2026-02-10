'use client'

import { useState, useMemo } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { kunleAraProducts } from '../data/kunle_ara_products'

// [Keep all your existing sample data: recentActivity, inventoryAlerts - copy from your current file]

export default function AdminPage() {
  const router = useRouter()
  const [selectedTimeframe, setSelectedTimeframe] = useState('today')
  const [selectedBranch, setSelectedBranch] = useState('all')

  // Calculate dashboard metrics (keep your existing code)
  const dashboardMetrics = useMemo(() => {
    const totalProducts = kunleAraProducts.length
    const totalValue = kunleAraProducts.reduce((sum, product) => sum + product.price, 0)
    const lowStockItems = kunleAraProducts.filter(product => product.stockQuantity < 20).length
    const prescriptionItems = kunleAraProducts.filter(product => product.prescriptionRequired).length

    return {
      totalProducts,
      totalValue,
      lowStockItems,
      prescriptionItems,
      todaySales: 125000,
      todayTransactions: 47,
      activeStaff: 12
    }
  }, [])

  // Button handlers
  const handleAddProduct = () => {
    router.push('/admin/products/add')
  }

  const handleViewReports = () => {
    router.push('/admin/reports')
  }

  const handleManageStaff = () => {
    router.push('/admin/staff')
  }

  const handleSettings = () => {
    router.push('/admin/settings')
  }

  const handleGenerateReorderReport = () => {
    // Generate CSV of low stock items
    const lowStockItems = kunleAraProducts.filter(p => p.stockQuantity < 20)
    const csvContent = "Product,Category,Current Stock,Reorder Level\n" +
      lowStockItems.map(p => `${p.name},${p.category},${p.stockQuantity},20`).join("\n")
    
    const blob = new Blob([csvContent], { type: 'text/csv' })
    const url = window.URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = `reorder-report-${new Date().toISOString().split('T')[0]}.csv`
    a.click()
    window.URL.revokeObjectURL(url)
  }

  const handleGenerateFullReport = () => {
    router.push('/admin/reports/full')
  }

  const handleBulkImport = () => {
    router.push('/admin/products/import')
  }

  const handleSystemSettings = () => {
    router.push('/admin/settings/system')
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* [Keep your existing header code] */}

      <div className="container mx-auto px-4 py-8">
        {/* [Keep your existing metrics cards] */}

        {/* Main Dashboard Content */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Left Column - Recent Activity & Quick Actions */}
          <div className="space-y-6">
            {/* [Keep Recent Activity code] */}

            {/* Quick Actions - UPDATED WITH CLICK HANDLERS */}
            <div className="bg-white rounded-lg shadow-lg p-6">
              <h3 className="text-xl font-semibold mb-4">Quick Actions</h3>
              <div className="grid grid-cols-2 gap-4">
                <button 
                  onClick={handleAddProduct}
                  className="flex flex-col items-center p-4 bg-blue-50 hover:bg-blue-100 rounded-lg transition-colors cursor-pointer"
                >
                  <span className="text-2xl mb-2">📦</span>
                  <span className="text-sm font-medium">Add Product</span>
                </button>
                
                <button 
                  onClick={handleViewReports}
                  className="flex flex-col items-center p-4 bg-green-50 hover:bg-green-100 rounded-lg transition-colors cursor-pointer"
                >
                  <span className="text-2xl mb-2">📊</span>
                  <span className="text-sm font-medium">View Reports</span>
                </button>
                
                <button 
                  onClick={handleManageStaff}
                  className="flex flex-col items-center p-4 bg-yellow-50 hover:bg-yellow-100 rounded-lg transition-colors cursor-pointer"
                >
                  <span className="text-2xl mb-2">👥</span>
                  <span className="text-sm font-medium">Manage Staff</span>
                </button>
                
                <button 
                  onClick={handleSettings}
                  className="flex flex-col items-center p-4 bg-purple-50 hover:bg-purple-100 rounded-lg transition-colors cursor-pointer"
                >
                  <span className="text-2xl mb-2">⚙️</span>
                  <span className="text-sm font-medium">Settings</span>
                </button>
              </div>
            </div>
          </div>

          {/* Middle Column - Inventory Alerts */}
          <div className="space-y-6">
            {/* [Keep your inventory alerts code] */}

            <div className="mt-4">
              <button 
                onClick={handleGenerateReorderReport}
                className="w-full bg-red-600 text-white py-2 px-4 rounded-lg hover:bg-red-700 transition-colors cursor-pointer"
              >
                Generate Reorder Report
              </button>
            </div>

            {/* [Keep Branch Performance code] */}
          </div>

          {/* [Keep Right Column code] */}
        </div>

        {/* Footer Actions - UPDATED WITH CLICK HANDLERS */}
        <div className="mt-8 bg-white rounded-lg shadow-lg p-6">
          <div className="flex flex-wrap gap-4 justify-center">
            <button 
              onClick={handleGenerateFullReport}
              className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors cursor-pointer"
            >
              📊 Generate Full Report
            </button>
            <button 
              onClick={handleBulkImport}
              className="bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 transition-colors cursor-pointer"
            >
              📦 Bulk Import Products
            </button>
            <button 
              onClick={handleManageStaff}
              className="bg-purple-600 text-white px-6 py-3 rounded-lg hover:bg-purple-700 transition-colors cursor-pointer"
            >
              👥 Staff Management
            </button>
            <button 
              onClick={handleSystemSettings}
              className="bg-orange-600 text-white px-6 py-3 rounded-lg hover:bg-orange-700 transition-colors cursor-pointer"
            >
              🔧 System Settings
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
