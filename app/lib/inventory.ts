// app/lib/inventory.ts
interface InventoryItem {
  productId: string
  currentStock: number
  minimumStock: number
  maxStock: number
  lastUpdated: Date
  branchStock: {
    [branchId: string]: {
      quantity: number
      reserved: number // Items in pending transactions
    }
  }
}

interface StockTransaction {
  id: string
  productId: string
  branchId: string
  type: 'sale' | 'restock' | 'transfer' | 'adjustment'
  quantity: number
  previousStock: number
  newStock: number
  staffId: string
  timestamp: Date
  notes?: string
}

class InventoryManager {
  private inventory: Map<string, InventoryItem> = new Map()
  private transactions: StockTransaction[] = []

  constructor() {
    this.loadInventory()
  }

  // Initialize inventory from scraped products
  initializeFromScrapedProducts(products: any[]) {
    products.forEach(product => {
      const inventoryItem: InventoryItem = {
        productId: product.id,
        currentStock: product.stockQuantity,
        minimumStock: 10, // Set minimum stock level
        maxStock: 200,    // Set maximum stock level
        lastUpdated: new Date(),
        branchStock: {
          'uch': { quantity: Math.floor(product.stockQuantity * 0.4), reserved: 0 },
          'yemetu': { quantity: Math.floor(product.stockQuantity * 0.3), reserved: 0 },
          'ring-road': { quantity: Math.floor(product.stockQuantity * 0.3), reserved: 0 }
        }
      }
      this.inventory.set(product.id, inventoryItem)
    })
    this.saveInventory()
  }

  // Reduce stock when product is sold
  reduceStock(productId: string, quantity: number, branchId: string, staffId: string): boolean {
    const item = this.inventory.get(productId)
    if (!item) return false

    const branchStock = item.branchStock[branchId]
    if (!branchStock || branchStock.quantity < quantity) {
      console.warn(`Insufficient stock for ${productId} at ${branchId}`)
      return false
    }

    // Update stock
    const previousStock = branchStock.quantity
    branchStock.quantity -= quantity
    item.currentStock = Object.values(item.branchStock)
      .reduce((total, branch) => total + branch.quantity, 0)
    item.lastUpdated = new Date()

    // Record transaction
    this.recordTransaction({
      id: `txn_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
      productId,
      branchId,
      type: 'sale',
      quantity: -quantity, // Negative for sales
      previousStock,
      newStock: branchStock.quantity,
      staffId,
      timestamp: new Date()
    })

    this.saveInventory()
    return true
  }

  // Add stock when restocking
  addStock(productId: string, quantity: number, branchId: string, staffId: string, notes?: string): boolean {
    const item = this.inventory.get(productId)
    if (!item) return false

    const branchStock = item.branchStock[branchId]
    if (!branchStock) return false

    // Update stock
    const previousStock = branchStock.quantity
    branchStock.quantity += quantity
    item.currentStock = Object.values(item.branchStock)
      .reduce((total, branch) => total + branch.quantity, 0)
    item.lastUpdated = new Date()

    // Record transaction
    this.recordTransaction({
      id: `txn_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
      productId,
      branchId,
      type: 'restock',
      quantity: quantity, // Positive for restocking
      previousStock,
      newStock: branchStock.quantity,
      staffId,
      timestamp: new Date(),
      notes
    })

    this.saveInventory()
    return true
  }

  // Transfer stock between branches
  transferStock(productId: string, quantity: number, fromBranch: string, toBranch: string, staffId: string): boolean {
    const item = this.inventory.get(productId)
    if (!item) return false

    const fromStock = item.branchStock[fromBranch]
    const toStock = item.branchStock[toBranch]

    if (!fromStock || !toStock || fromStock.quantity < quantity) return false

    // Transfer stock
    fromStock.quantity -= quantity
    toStock.quantity += quantity
    item.lastUpdated = new Date()

    // Record transactions for both branches
    this.recordTransaction({
      id: `transfer_out_${Date.now()}`,
      productId,
      branchId: fromBranch,
      type: 'transfer',
      quantity: -quantity,
      previousStock: fromStock.quantity + quantity,
      newStock: fromStock.quantity,
      staffId,
      timestamp: new Date(),
      notes: `Transferred to ${toBranch}`
    })

    this.recordTransaction({
      id: `transfer_in_${Date.now()}`,
      productId,
      branchId: toBranch,
      type: 'transfer',
      quantity: quantity,
      previousStock: toStock.quantity - quantity,
      newStock: toStock.quantity,
      staffId,
      timestamp: new Date(),
      notes: `Received from ${fromBranch}`
    })

    this.saveInventory()
    return true
  }

  // Get current stock for a product at a specific branch
  getStock(productId: string, branchId?: string): number {
    const item = this.inventory.get(productId)
    if (!item) return 0

    if (branchId) {
      return item.branchStock[branchId]?.quantity || 0
    }

    return item.currentStock
  }

  // Get products with low stock
  getLowStockProducts(branchId?: string): string[] {
    const lowStock: string[] = []

    this.inventory.forEach((item, productId) => {
      if (branchId) {
        const branchStock = item.branchStock[branchId]
        if (branchStock && branchStock.quantity <= item.minimumStock) {
          lowStock.push(productId)
        }
      } else {
        if (item.currentStock <= item.minimumStock) {
          lowStock.push(productId)
        }
      }
    })

    return lowStock
  }

  // Get inventory report
  getInventoryReport(branchId?: string) {
    const report = {
      totalProducts: 0,
      totalStock: 0,
      lowStockProducts: 0,
      outOfStockProducts: 0,
      branchBreakdown: {} as any
    }

    this.inventory.forEach((item, productId) => {
      report.totalProducts++

      if (branchId) {
        const branchStock = item.branchStock[branchId]?.quantity || 0
        report.totalStock += branchStock
        if (branchStock <= item.minimumStock) report.lowStockProducts++
        if (branchStock === 0) report.outOfStockProducts++
      } else {
        report.totalStock += item.currentStock
        if (item.currentStock <= item.minimumStock) report.lowStockProducts++
        if (item.currentStock === 0) report.outOfStockProducts++

        // Branch breakdown
        Object.entries(item.branchStock).forEach(([branch, stock]) => {
          if (!report.branchBreakdown[branch]) {
            report.branchBreakdown[branch] = { totalStock: 0, products: 0 }
          }
          report.branchBreakdown[branch].totalStock += stock.quantity
          report.branchBreakdown[branch].products++
        })
      }
    })

    return report
  }

  // Get transaction history
  getTransactionHistory(productId?: string, branchId?: string, limit?: number): StockTransaction[] {
    let filtered = this.transactions

    if (productId) {
      filtered = filtered.filter(t => t.productId === productId)
    }

    if (branchId) {
      filtered = filtered.filter(t => t.branchId === branchId)
    }

    // Sort by timestamp (newest first)
    filtered.sort((a, b) => b.timestamp.getTime() - a.timestamp.getTime())

    if (limit) {
      filtered = filtered.slice(0, limit)
    }

    return filtered
  }

  private recordTransaction(transaction: StockTransaction) {
    this.transactions.push(transaction)
    
    // Keep only last 1000 transactions to prevent memory issues
    if (this.transactions.length > 1000) {
      this.transactions = this.transactions.slice(-1000)
    }

    // In a real app, you'd save to database here
    localStorage.setItem('inventory_transactions', JSON.stringify(this.transactions))
  }

  private loadInventory() {
    // In a real app, load from database
    const saved = localStorage.getItem('pharmacy_inventory')
    if (saved) {
      try {
        const data = JSON.parse(saved)
        this.inventory = new Map(data)
      } catch (e) {
        console.warn('Failed to load inventory from storage')
      }
    }

    // Load transactions
    const savedTransactions = localStorage.getItem('inventory_transactions')
    if (savedTransactions) {
      try {
        this.transactions = JSON.parse(savedTransactions)
      } catch (e) {
        console.warn('Failed to load transactions from storage')
      }
    }
  }

  private saveInventory() {
    // In a real app, save to database
    const data = Array.from(this.inventory.entries())
    localStorage.setItem('pharmacy_inventory', JSON.stringify(data))
  }
}

// Global inventory manager instance
export const inventoryManager = new InventoryManager()

// Helper functions for components
export const useInventory = () => {
  return {
    getStock: (productId: string, branchId?: string) => 
      inventoryManager.getStock(productId, branchId),
    
    reduceStock: (productId: string, quantity: number, branchId: string, staffId: string) =>
      inventoryManager.reduceStock(productId, quantity, branchId, staffId),
    
    addStock: (productId: string, quantity: number, branchId: string, staffId: string, notes?: string) =>
      inventoryManager.addStock(productId, quantity, branchId, staffId, notes),
    
    getLowStock: (branchId?: string) => 
      inventoryManager.getLowStockProducts(branchId),
    
    getReport: (branchId?: string) => 
      inventoryManager.getInventoryReport(branchId),
    
    getHistory: (productId?: string, branchId?: string, limit?: number) =>
      inventoryManager.getTransactionHistory(productId, branchId, limit)
  }
}
