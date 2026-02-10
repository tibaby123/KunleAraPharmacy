// ecommerce/lib/supabase.js
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

// Helper functions for the pharmacy system
export const pharmacyAPI = {
  // Products
  async getProducts(branchId = null) {
    let query = supabase.from('products').select('*')
    if (branchId) query = query.eq('branch_id', branchId)
    return query
  },

  // Orders with timing
  async createOrder(orderData) {
    const { data, error } = await supabase
      .from('orders')
      .insert([{
        ...orderData,
        created_at: new Date().toISOString()
      }])
    return { data, error }
  },

  // Staff performance tracking
  async trackPerformance(performanceData) {
    return supabase
      .from('staff_performance')
      .insert([performanceData])
  },

  // Real-time order updates
  subscribeToOrders(callback) {
    return supabase
      .channel('orders')
      .on('postgres_changes', 
        { event: '*', schema: 'public', table: 'orders' },
        callback
      )
      .subscribe()
  }
}
