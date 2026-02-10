// Enhanced Inventory Management System
export interface LocationInventory {
  branchId: string
  branchName: string
  productId: string
  stockQuantity: number
  reorderLevel: number
  lastRestocked: Date
  location: 'uch' | 'yemetu' | 'ring-road'
}

export interface InventoryAlert {
  productId: string
  productName: string
  requestedLocation: string
  availableLocations: Array<{
    branchId: string
    branchName: string
    stockQuantity: number
  }>
  alertType: 'out-of-stock' | 'low-stock' | 'transfer-available'
}

export class InventoryManager {
  private locationInventory: Map<string, LocationInventory[]> = new Map()

  constructor() {
    this.initializeInventory()
  }

  // Initialize with realistic branch-specific inventory
  private initializeInventory() {
    const branches = [
      { id: 'uch', name: 'UCH Branch', multiplier: 1.2 },
      { id: 'yemetu', name: 'Yemetu Branch', multiplier: 0.8 },
      { id: 'ring-road', name: 'Ring Road Branch', multiplier: 1.0 }
    ]

    // Import your scraped products here
    import { kunleAraProducts } from '../data/kunle_ara_products'

    kunleAraProducts.forEach(product => {
      branches.forEach(branch => {
        const baseStock = product.stockQuantity || 50
        const branchStock = Math.floor(baseStock * branch.multiplier)
        
        const inventory: LocationInventory = {
          branchId: branch.id,
          branchName: branch.name,
          productId: product.id,
          stockQuantity: branchStock,
          reorderLevel: Math.floor(branchStock * 0.2), // 20% of stock
          lastRestocked: new Date(),
          location: branch.id as 'uch' | 'yemetu' | 'ring-road'
        }

        if (!this.locationInventory.has(branch.id)) {
          this.locationInventory.set(branch.id, [])
        }
        this.locationInventory.get(branch.id)!.push(inventory)
      })
    })
  }

  // Get inventory for specific location
  getLocationInventory(branchId: string): LocationInventory[] {
    return this.locationInventory.get(branchId) || []
  }

  // Get all inventory across locations
  getAllInventory(): Map<string, LocationInventory[]> {
    return this.locationInventory
  }

  // Check stock availability and generate alerts
  checkStockAvailability(productId: string, requestedLocation: string, quantity: number = 1): InventoryAlert | null {
    const requestedStock = this.getLocationInventory(requestedLocation)
      .find(inv => inv.productId === productId)

    // If sufficient stock at requested location
    if (requestedStock && requestedStock.stockQuantity >= quantity) {
      return null // No alert needed
    }

    // Find alternative locations with stock
    const availableLocations: Array<{branchId: string, branchName: string, stockQuantity: number}> = []
    
    this.locationInventory.forEach((inventory, branchId) => {
      if (branchId !== requestedLocation) {
        const stock = inventory.find(inv => inv.productId === productId)
        if (stock && stock.stockQuantity >= quantity) {
          availableLocations.push({
            branchId,
            branchName: stock.branchName,
            stockQuantity: stock.stockQuantity
          })
        }
      }
    })

    if (availableLocations.length > 0) {
      return {
        productId,
        productName: this.getProductName(productId),
        requestedLocation,
        availableLocations,
        alertType: requestedStock?.stockQuantity === 0 ? 'out-of-stock' : 'low-stock'
      }
    }

    return null // Product not available anywhere
  }

  // Transfer stock between locations
  transferStock(productId: string, fromBranch: string, toBranch: string, quantity: number): boolean {
    const fromInventory = this.getLocationInventory(fromBranch)
      .find(inv => inv.productId === productId)
    const toInventory = this.getLocationInventory(toBranch)
      .find(inv => inv.productId === productId)

    if (fromInventory && toInventory && fromInventory.stockQuantity >= quantity) {
      fromInventory.stockQuantity -= quantity
      toInventory.stockQuantity += quantity
      return true
    }
    return false
  }

  // Reduce stock after sale
  reduceStock(productId: string, branchId: string, quantity: number): boolean {
    const inventory = this.getLocationInventory(branchId)
      .find(inv => inv.productId === productId)
    
    if (inventory && inventory.stockQuantity >= quantity) {
      inventory.stockQuantity -= quantity
      return true
    }
    return false
  }

  private getProductName(productId: string): string {
    // This would typically come from your product database
    return `Product ${productId}`
  }
}

export const inventoryManager = new InventoryManager()
