'use client'

import { useState, useMemo } from 'react'
import { kunleAraProducts } from '../data/kunle_ara_products'

// Sample data for dashboard
const recentActivity = [
  {
    user: "John Doe",
    action: "sold",
    item: "Paracetamol 500mg",
    branch: "UCH Branch",
    timestamp: "2 minutes ago",
    amount: 600,
    icon: "💊",
    iconBg: "bg-blue-100"
  },
  {
    user: "Sarah Ahmed",
    action: "restocked",
    item: "Vitamin C Tablets",
    branch: "Yemetu Branch", 
    timestamp: "15 minutes ago",
    amount: null,
    icon: "📦",
    iconBg: "bg-green-100"
  },
  {
    user: "Mike Johnson",
    action: "sold",
    item: "Baby Formula",
    branch: "Ring Road Branch",
    timestamp: "32 minutes ago", 
    amount: 5500,
    icon: "👶",
    iconBg: "bg-pink-100"
  },
  {
    user: "Admin",
    action: "added new product",
    item: "Hand Sanitizer",
    branch: "All Branches",
    timestamp: "1 hour ago",
    amount: null,
    icon: "➕",
    iconBg: "bg-yellow-100"
  },
  {
    user: "Grace Ojo",
    action: "dispensed",
    item: "Amoxicillin 500mg",
    branch: "UCH Branch",
    timestamp: "2 hours ago",
    amount: 2500,
    icon: "💉",
    iconBg: "bg-red-100"
  }
]

const inventoryAlerts = [
  {
    product: "Paracetamol 500mg",
    message: "Low stock - needs immediate reorder",
    category: "OTC",
    branch: "UCH Branch",
    currentStock: 5,
    borderColor: "border-red-500",
    bgColor: "bg-red-50",
    textColor: "text-red-600"
  },
  {
    product: "Baby Diapers Size 3",
    message: "Stock running low",
    category: "Baby Care", 
    branch: "Yemetu Branch",
    currentStock: 12,
    borderColor: "border-yellow-500",
    bgColor: "bg-yellow-50",
    textColor: "text-yellow-600"
  },
  {
    product: "Vitamin C 1000mg",
    message: "Critical stock level",
    category: "Supplements",
    branch: "Ring Road Branch", 
    currentStock: 3,
    borderColor: "border-red-500",
    bgColor: "bg-red-50",
    textColor: "text-red-600"
  },
  {
    product: "Hand Sanitizer",
    message: "Below minimum threshold",
    category: "Personal Care",
    branch: "All Branches",
    currentStock: 8,
    borderColor: "border-orange-500", 
    bgColor: "bg-orange-50",
    textColor: "text-orange-600"
  }
]

export default function AdminPage() {
  const [selectedTimeframe, setSelectedTimeframe] = useState('today')
  const [selectedBranch, setSelectedBranch] = useState('all')

  // Calculate dashboard metrics
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
      // Simulated daily metrics
      todaySales: 125000,
      todayTransactions: 47,
      activeStaff: 12
    }
  }, [])

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white shadow-sm border-b">
        <div className="container mx-auto px-4 py-6">
          <div className="flex justify-between items-center">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">Admin Dashboard</h1>
              <p className="text-gray-600 mt-1">Kunle Ara Pharmacy Management</p>
            </div>
            <div className="flex space-x-4">
              <select 
                value={selectedTimeframe}
                onChange={(e) => setSelectedTimeframe(e.target.value)}
                className="border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-purple-500"
              >
                <option value="today">Today</option>
                <option value="week">This Week</option>
                <option value="month">This Month</option>
                <option value="year">This Year</option>
              </select>
              <select
                value={selectedBranch}
                onChange={(e) => setSelectedBranch(e.target.value)}
                className="border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-purple-500"
              >
                <option value="all">All Branches</option>
                <option value="uch">UCH Branch</option>
                <option value="yemetu">Yemetu Branch</option>
                <option value="ring-road">Ring Road Branch</option>
              </select>
            </div>
          </div>
        </div>
      </div>

      <div className="container mx-auto px-4 py-8">
        {/* Key Metrics */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          <div className="bg-white rounded-lg shadow-lg p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-gray-600">Total Products</p>
                <p className="text-3xl font-bold text-gray-900">{dashboardMetrics.totalProducts}</p>
              </div>
              <div className="bg-blue-100 p-3 rounded-full">
                <span className="text-2xl">📦</span>
              </div>
            </div>
            <div className="mt-4 flex items-center text-sm">
              <span className="text-green-600">↗ 8.2%</span>
              <span className="text-gray-500 ml-2">from last month</span>
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-lg p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-gray-600">Inventory Value</p>
                <p className="text-3xl font-bold text-gray-900">₦{dashboardMetrics.totalValue.toLocaleString()}</p>
              </div>
              <div className="bg-green-100 p-3 rounded-full">
                <span className="text-2xl">💰</span>
              </div>
            </div>
            <div className="mt-4 flex items-center text-sm">
              <span className="text-green-600">↗ 12.5%</span>
              <span className="text-gray-500 ml-2">from last month</span>
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-lg p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-gray-600">Today's Sales</p>
                <p className="text-3xl font-bold text-gray-900">₦{dashboardMetrics.todaySales.toLocaleString()}</p>
              </div>
              <div className="bg-purple-100 p-3 rounded-full">
                <span className="text-2xl">📈</span>
              </div>
            </div>
            <div className="mt-4 flex items-center text-sm">
              <span className="text-green-600">{dashboardMetrics.todayTransactions} transactions</span>
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-lg p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-gray-600">Low Stock Items</p>
                <p className="text-3xl font-bold text-red-600">{dashboardMetrics.lowStockItems}</p>
              </div>
              <div className="bg-red-100 p-3 rounded-full">
                <span className="text-2xl">⚠️</span>
              </div>
            </div>
            <div className="mt-4 flex items-center text-sm">
              <span className="text-red-600">Needs attention</span>
            </div>
          </div>
        </div>

        {/* Main Dashboard Content */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Left Column - Recent Activity & Quick Actions */}
          <div className="space-y-6">
            {/* Recent Activity */}
            <div className="bg-white rounded-lg shadow-lg p-6">
              <h3 className="text-xl font-semibold mb-4">Recent Activity</h3>
              <div className="space-y-3 max-h-96 overflow-y-auto">
                {recentActivity.map((activity, index) => (
                  <div key={index} className="flex items-center space-x-3 p-3 hover:bg-gray-50 rounded-lg">
                    <div className={`w-10 h-10 rounded-full flex items-center justify-center ${activity.iconBg}`}>
                      <span className="text-lg">{activity.icon}</span>
                    </div>
                    <div className="flex-1">
                      <p className="text-sm">
                        <span className="font-medium">{activity.user}</span> {activity.action}
                        <span className="font-medium"> {activity.item}</span>
                      </p>
                      <div className="flex items-center space-x-2 text-xs text-gray-500">
                        <span>{activity.branch}</span>
                        <span>•</span>
                        <span>{activity.timestamp}</span>
                      </div>
                    </div>
                    {activity.amount && (
                      <div className="text-right">
                        <span className="font-semibold text-green-600">₦{activity.amount.toLocaleString()}</span>
                      </div>
                    )}
                  </div>
                ))}
              </div>
            </div>

            {/* Quick Actions */}
            <div className="bg-white rounded-lg shadow-lg p-6">
              <h3 className="text-xl font-semibold mb-4">Quick Actions</h3>
              <div className="grid grid-cols-2 gap-4">
                <button className="flex flex-col items-center p-4 bg-blue-50 hover:bg-blue-100 rounded-lg transition-colors">
                  <span className="text-2xl mb-2">📦</span>
                  <span className="text-sm font-medium">Add Product</span>
                </button>
                
                <button className="flex flex-col items-center p-4 bg-green-50 hover:bg-green-100 rounded-lg transition-colors">
                  <span className="text-2xl mb-2">📊</span>
                  <span className="text-sm font-medium">View Reports</span>
                </button>
                
                <button className="flex flex-col items-center p-4 bg-yellow-50 hover:bg-yellow-100 rounded-lg transition-colors">
                  <span className="text-2xl mb-2">👥</span>
                  <span className="text-sm font-medium">Manage Staff</span>
                </button>
                
                <button className="flex flex-col items-center p-4 bg-purple-50 hover:bg-purple-100 rounded-lg transition-colors">
                  <span className="text-2xl mb-2">⚙️</span>
                  <span className="text-sm font-medium">Settings</span>
                </button>
              </div>
            </div>
          </div>

          {/* Middle Column - Inventory Alerts */}
          <div className="space-y-6">
            {/* Inventory Alerts */}
            <div className="bg-white rounded-lg shadow-lg p-6">
              <h3 className="text-xl font-semibold mb-4 flex items-center">
                <span className="mr-2">⚠️</span>
                Inventory Alerts
              </h3>
              <div className="space-y-3">
                {inventoryAlerts.map((alert, index) => (
                  <div key={index} className={`p-4 rounded-lg border-l-4 ${alert.borderColor} ${alert.bgColor}`}>
                    <div className="flex items-center justify-between">
                      <div>
                        <h4 className="font-medium">{alert.product}</h4>
                        <p className="text-sm text-gray-600">{alert.message}</p>
                        <div className="flex items-center space-x-2 mt-2 text-xs">
                          <span className="bg-gray-200 px-2 py-1 rounded">{alert.category}</span>
                          <span className="text-gray-500">{alert.branch}</span>
                        </div>
                      </div>
                      <div className="text-right">
                        <div className={`text-lg font-bold ${alert.textColor}`}>
                          {alert.currentStock}
                        </div>
                        <div className="text-sm text-gray-500">in stock</div>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
              <div className="mt-4">
                <button className="w-full bg-red-600 text-white py-2 px-4 rounded-lg hover:bg-red-700 transition-colors">
                  Generate Reorder Report
                </button>
              </div>
            </div>

            {/* Branch Performance */}
            <div className="bg-white rounded-lg shadow-lg p-6">
              <h3 className="text-xl font-semibold mb-4">Branch Performance</h3>
              <div className="space-y-4">
                <div className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                  <div>
                    <span className="font-medium">🏥 UCH Branch</span>
                    <div className="text-sm text-gray-600">47 sales today</div>
                  </div>
                  <div className="text-right">
                    <div className="font-bold text-green-600">₦89,500</div>
                    <div className="text-sm text-gray-500">+15.3%</div>
                  </div>
                </div>
                <div className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                  <div>
                    <span className="font-medium">🏪 Yemetu Branch</span>
                    <div className="text-sm text-gray-600">32 sales today</div>
                  </div>
                  <div className="text-right">
                    <div className="font-bold text-green-600">₦56,200</div>
                    <div className="text-sm text-gray-500">+8.7%</div>
                  </div>
                </div>
                <div className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                  <div>
                    <span className="font-medium">🏢 Ring Road Branch</span>
                    <div className="text-sm text-gray-600">38 sales today</div>
                  </div>
                  <div className="text-right">
                    <div className="font-bold text-green-600">₦67,800</div>
                    <div className="text-sm text-gray-500">+12.1%</div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Right Column - Charts and Analytics */}
          <div className="space-y-6">
            {/* Sales Chart Placeholder */}
            <div className="bg-white rounded-lg shadow-lg p-6">
              <h3 className="text-xl font-semibold mb-4">Sales Overview</h3>
              <div className="h-64 bg-gray-100 rounded-lg flex items-center justify-center">
                <div className="text-center">
                  <span className="text-4xl mb-2 block">📈</span>
                  <p className="text-gray-600">Sales Chart</p>
                  <p className="text-sm text-gray-500">(Chart component needed)</p>
                </div>
              </div>
              <div className="mt-4 grid grid-cols-3 gap-4 text-center">
                <div>
                  <div className="font-bold text-blue-600">₦{dashboardMetrics.todaySales.toLocaleString()}</div>
                  <div className="text-sm text-gray-500">Today</div>
                </div>
                <div>
                  <div className="font-bold text-green-600">₦{(dashboardMetrics.todaySales * 7.2).toLocaleString()}</div>
                  <div className="text-sm text-gray-500">This Week</div>
                </div>
                <div>
                  <div className="font-bold text-purple-600">₦{(dashboardMetrics.todaySales * 28.5).toLocaleString()}</div>
                  <div className="text-sm text-gray-500">This Month</div>
                </div>
              </div>
            </div>

            {/* Top Products */}
            <div className="bg-white rounded-lg shadow-lg p-6">
              <h3 className="text-xl font-semibold mb-4">Top Selling Products</h3>
              <div className="space-y-3">
                {kunleAraProducts.slice(0, 5).map((product, index) => (
                  <div key={product.id} className="flex items-center justify-between p-3 hover:bg-gray-50 rounded-lg">
                    <div className="flex items-center space-x-3">
                      <span className="w-6 h-6 bg-blue-100 rounded-full flex items-center justify-center text-sm font-bold">
                        {index + 1}
                      </span>
                      <div>
                        <div className="font-medium text-sm">{product.name}</div>
                        <div className="text-xs text-gray-500">{product.category}</div>
                      </div>
                    </div>
                    <div className="text-right">
                      <div className="font-bold text-sm">₦{product.price.toLocaleString()}</div>
<<<<<<< HEAD
                      <div className="text-xs text-gray-500">{Math.floor(Math.random() * 20) + 5} sold</div>
=======
                      <div className="text-xs text-gray-500">{5} sold</div>
>>>>>>> f96f68f (Fix: Working version with all dependencies installed)
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* System Status */}
            <div className="bg-white rounded-lg shadow-lg p-6">
              <h3 className="text-xl font-semibold mb-4">System Status</h3>
              <div className="space-y-3">
                <div className="flex items-center justify-between">
                  <span>POS System</span>
                  <span className="bg-green-100 text-green-800 px-2 py-1 rounded-full text-xs">Online</span>
                </div>
                <div className="flex items-center justify-between">
                  <span>Inventory Sync</span>
                  <span className="bg-green-100 text-green-800 px-2 py-1 rounded-full text-xs">Active</span>
                </div>
                <div className="flex items-center justify-between">
                  <span>Backup Status</span>
                  <span className="bg-yellow-100 text-yellow-800 px-2 py-1 rounded-full text-xs">Pending</span>
                </div>
                <div className="flex items-center justify-between">
                  <span>Staff Online</span>
                  <span className="font-medium">{dashboardMetrics.activeStaff} / 15</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Footer Actions */}
        <div className="mt-8 bg-white rounded-lg shadow-lg p-6">
          <div className="flex flex-wrap gap-4 justify-center">
            <button className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors">
              📊 Generate Full Report
            </button>
            <button className="bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 transition-colors">
              📦 Bulk Import Products
            </button>
            <button className="bg-purple-600 text-white px-6 py-3 rounded-lg hover:bg-purple-700 transition-colors">
              👥 Staff Management
            </button>
            <button className="bg-orange-600 text-white px-6 py-3 rounded-lg hover:bg-orange-700 transition-colors">
              🔧 System Settings
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
