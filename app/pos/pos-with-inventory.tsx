'use client'

import { useState, useEffect } from 'react'
import { kunleAraProducts } from '../data/kunle_ara_products'
import { inventoryManager, useInventory } from '../lib/inventory'

export default function POSWithInventory() {
  const [cart, setCart] = useState([])
  const [currentBranch, setCurrentBranch] = useState('uch')
  const [staffId, setStaffId] = useState('staff001')
  const inventory = useInventory()

  // Initialize inventory on first load
  useEffect(() => {
    inventoryManager.initializeFromScrapedProducts(kunleAraProducts)
  }, [])

  const addToCart = (product: any) => {
    const availableStock = inventory.getStock(product.id, currentBranch)
    
    if (availableStock <= 0) {
      alert(`${product.name} is out of stock at ${currentBranch}!`)
      return
    }

    const existingItem = cart.find(item => item.product.id === product.id)
    const currentQuantity = existingItem ? existingItem.quantity : 0
    
    if (currentQuantity >= availableStock) {
      alert(`Only ${availableStock} units available for ${product.name}`)
      return
    }

    // Add to cart logic...
    if (existingItem) {
      setCart(cart.map(item => 
        item.product.id === product.id 
          ? { ...item, quantity: item.quantity + 1 }
          : item
      ))
    } else {
      setCart([...cart, { product, quantity: 1 }])
    }
  }

  const processSale = () => {
    let allSuccessful = true

    // Process each item in cart
    cart.forEach(item => {
      const success = inventory.reduceStock(
        item.product.id, 
        item.quantity, 
        currentBranch, 
        staffId
      )
      
      if (!success) {
        allSuccessful = false
        alert(`Failed to process sale for ${item.product.name}`)
      }
    })

    if (allSuccessful) {
      alert('Sale processed successfully!')
      setCart([]) // Clear cart
      // Trigger re-render to show updated stock levels
      forceUpdate()
    }
  }

  return (
    <div className="pos-system">
      {/* Stock Management Panel */}
      <div className="stock-panel">
        <h3>Current Stock Levels - {currentBranch}</h3>
        {kunleAraProducts.map(product => (
          <div key={product.id} className="stock-item">
            <span>{product.name}</span>
            <span>Stock: {inventory.getStock(product.id, currentBranch)}</span>
            {inventory.getStock(product.id, currentBranch) <= 10 && (
              <span className="low-stock-warning">⚠️ Low Stock</span>
            )}
          </div>
        ))}
      </div>

      {/* Regular POS interface with real-time stock updates */}
      {/* ... rest of POS code ... */}
    </div>
  )
}
