'use client'

import { useState, useEffect } from 'react'
import { format } from 'date-fns'

export interface CashierSession {
  sessionId: string
  staffId: string
  staffName: string
  branchId: string
  branchName: string
  loginTime: Date
  logoutTime?: Date
  breakTimes: BreakPeriod[]
  transactions: TransactionRecord[]
  totalSales: number
  averageTransactionTime: number // in seconds
  productivityScore: number
  status: 'active' | 'on-break' | 'logged-out'
}

export interface BreakPeriod {
  id: string
  startTime: Date
  endTime?: Date
  type: 'lunch' | 'short' | 'emergency'
  duration?: number // in minutes
}

export interface TransactionRecord {
  id: string
  startTime: Date // When scan/item selection started
  completionTime: Date // When payment completed
  duration: number // in seconds
  itemCount: number
  totalAmount: number
  paymentMethod: 'cash' | 'card' | 'transfer'
  customerType: 'walk-in' | 'regular' | 'prescription'
}

class CashierTracker {
  private currentSession: CashierSession | null = null
  private transactionStartTime: Date | null = null
  private currentBreak: BreakPeriod | null = null

  // Start cashier session
  startSession(staffId: string, staffName: string, branchId: string, branchName: string): CashierSession {
    this.currentSession = {
      sessionId: `SESSION_${Date.now()}_${staffId}`,
      staffId,
      staffName,
      branchId,
      branchName,
      loginTime: new Date(),
      breakTimes: [],
      transactions: [],
      totalSales: 0,
      averageTransactionTime: 0,
      productivityScore: 0,
      status: 'active'
    }

    // Save to localStorage for persistence
    this.saveSession()
    
    console.log(`👨‍💼 ${staffName} logged in at ${branchName} - ${format(new Date(), 'HH:mm:ss')}`)
    return this.currentSession
  }

  // Start transaction timing
  startTransaction(): void {
    if (!this.currentSession || this.currentSession.status !== 'active') {
      throw new Error('No active session or cashier on break')
    }

    this.transactionStartTime = new Date()
    console.log(`🛒 Transaction started at ${format(this.transactionStartTime, 'HH:mm:ss')}`)
  }

  // Complete transaction and record metrics
  completeTransaction(itemCount: number, totalAmount: number, paymentMethod: 'cash' | 'card' | 'transfer', customerType: 'walk-in' | 'regular' | 'prescription'): TransactionRecord {
    if (!this.currentSession || !this.transactionStartTime) {
      throw new Error('No active session or transaction not started')
    }

    const completionTime = new Date()
    const duration = Math.round((completionTime.getTime() - this.transactionStartTime.getTime()) / 1000)

    const transaction: TransactionRecord = {
      id: `TXN_${Date.now()}_${this.currentSession.staffId}`,
      startTime: this.transactionStartTime,
      completionTime,
      duration,
      itemCount,
      totalAmount,
      paymentMethod,
      customerType
    }

    // Add to session
    this.currentSession.transactions.push(transaction)
    this.currentSession.totalSales += totalAmount

    // Recalculate average transaction time
    const totalDuration = this.currentSession.transactions.reduce((sum, txn) => sum + txn.duration, 0)
    this.currentSession.averageTransactionTime = Math.round(totalDuration / this.currentSession.transactions.length)

    // Calculate productivity score
    this.calculateProductivityScore()

    // Reset transaction timer
    this.transactionStartTime = null

    // Save updated session
    this.saveSession()

    console.log(`✅ Transaction completed: ${duration}s, ₦${totalAmount.toLocaleString()}`)
    return transaction
  }

  // Start break
  startBreak(type: 'lunch' | 'short' | 'emergency'): BreakPeriod {
    if (!this.currentSession) {
      throw new Error('No active session')
    }

    if (this.currentBreak) {
      throw new Error('Break already in progress')
    }

    this.currentBreak = {
      id: `BREAK_${Date.now()}_${this.currentSession.staffId}`,
      startTime: new Date(),
      type
    }

    this.currentSession.status = 'on-break'
    this.saveSession()

    console.log(`☕ ${type} break started at ${format(this.currentBreak.startTime, 'HH:mm:ss')}`)
    return this.currentBreak
  }

  // End break
  endBreak(): BreakPeriod {
    if (!this.currentSession || !this.currentBreak) {
      throw new Error('No active break to end')
    }

    const endTime = new Date()
    const duration = Math.round((endTime.getTime() - this.currentBreak.startTime.getTime()) / (1000 * 60)) // minutes

    this.currentBreak.endTime = endTime
    this.currentBreak.duration = duration

    // Add to session break history
    this.currentSession.breakTimes.push({ ...this.currentBreak })
    this.currentSession.status = 'active'

    console.log(`⏰ Break ended. Duration: ${duration} minutes`)

    // Reset current break
    this.currentBreak = null

    this.saveSession()
    return this.currentSession.breakTimes[this.currentSession.breakTimes.length - 1]
  }

  // End session (logout)
  endSession(): CashierSession {
    if (!this.currentSession) {
      throw new Error('No active session to end')
    }

    // End any active break
    if (this.currentBreak) {
      this.endBreak()
    }

    this.currentSession.logoutTime = new Date()
    this.currentSession.status = 'logged-out'

    // Final productivity calculation
    this.calculateProductivityScore()

    // Save final session
    this.saveSessionToDatabase()

    const sessionDuration = this.getSessionDuration()
    console.log(`👋 Session ended. Duration: ${sessionDuration.hours}h ${sessionDuration.minutes}m`)

    const finalSession = { ...this.currentSession }
    this.currentSession = null
    this.transactionStartTime = null
    this.currentBreak = null

    return finalSession
  }

  // Calculate productivity score (0-100)
  private calculateProductivityScore(): void {
    if (!this.currentSession || this.currentSession.transactions.length === 0) {
      return
    }

    const session = this.currentSession
    const sessionDuration = this.getSessionDurationInMinutes()
    const totalBreakTime = session.breakTimes.reduce((sum, brk) => sum + (brk.duration || 0), 0)
    const activeTime = sessionDuration - totalBreakTime

    // Factors for productivity score
    const transactionsPerHour = (session.transactions.length / activeTime) * 60
    const avgTransactionTime = session.averageTransactionTime
    const salesPerHour = (session.totalSales / activeTime) * 60

    // Scoring algorithm (can be adjusted)
    let score = 50 // Base score

    // Transactions per hour (target: 20-30)
    if (transactionsPerHour >= 25) score += 20
    else if (transactionsPerHour >= 15) score += 10
    else if (transactionsPerHour < 10) score -= 10

    // Average transaction time (target: 60-120 seconds)
    if (avgTransactionTime <= 90) score += 15
    else if (avgTransactionTime <= 120) score += 10
    else if (avgTransactionTime > 180) score -= 15

    // Sales performance (relative to branch average)
    if (salesPerHour >= 50000) score += 15 // ₦50k+ per hour
    else if (salesPerHour >= 30000) score += 10
    else if (salesPerHour < 15000) score -= 10

    // Ensure score is between 0-100
    this.currentSession.productivityScore = Math.max(0, Math.min(100, score))
  }

  // Helper methods
  private getSessionDurationInMinutes(): number {
    if (!this.currentSession) return 0
    
    const endTime = this.currentSession.logoutTime || new Date()
    return Math.round((endTime.getTime() - this.currentSession.loginTime.getTime()) / (1000 * 60))
  }

  private getSessionDuration(): { hours: number, minutes: number } {
    const totalMinutes = this.getSessionDurationInMinutes()
    return {
      hours: Math.floor(totalMinutes / 60),
      minutes: totalMinutes % 60
    }
  }

  private saveSession(): void {
    if (this.currentSession) {
      localStorage.setItem('currentCashierSession', JSON.stringify({
        ...this.currentSession,
        currentBreak: this.currentBreak
      }))
    }
  }

  private saveSessionToDatabase(): void {
    if (!this.currentSession) return

    // Save to your database/API
    const sessionData = {
      ...this.currentSession,
      savedAt: new Date().toISOString()
    }

    // For now, save to localStorage (in production, send to your API)
    const existingSessions = JSON.parse(localStorage.getItem('cashierSessions') || '[]')
    existingSessions.push(sessionData)
    localStorage.setItem('cashierSessions', JSON.stringify(existingSessions))

    console.log('💾 Session saved to database')
  }

  // Get current session info
  getCurrentSession(): CashierSession | null {
    return this.currentSession
  }

  // Load session from localStorage (for page refresh recovery)
  loadSession(): CashierSession | null {
    try {
      const saved = localStorage.getItem('currentCashierSession')
      if (saved) {
        const data = JSON.parse(saved)
        this.currentSession = data
        this.currentBreak = data.currentBreak
        return this.currentSession
      }
    } catch (error) {
      console.error('Failed to load session:', error)
    }
    return null
  }
}

// Create singleton instance
export const cashierTracker = new CashierTracker()

// React Hook for using cashier tracker
export function useCashierTracker() {
  const [session, setSession] = useState<CashierSession | null>(null)
  const [isOnBreak, setIsOnBreak] = useState(false)
  const [currentTransaction, setCurrentTransaction] = useState(false)

  useEffect(() => {
    // Load existing session on mount
    const existingSession = cashierTracker.loadSession()
    if (existingSession) {
      setSession(existingSession)
      setIsOnBreak(existingSession.status === 'on-break')
    }
  }, [])

  const startSession = (staffId: string, staffName: string, branchId: string, branchName: string) => {
    const newSession = cashierTracker.startSession(staffId, staffName, branchId, branchName)
    setSession(newSession)
    setIsOnBreak(false)
    return newSession
  }

  const startTransaction = () => {
    cashierTracker.startTransaction()
    setCurrentTransaction(true)
  }

  const completeTransaction = (itemCount: number, totalAmount: number, paymentMethod: 'cash' | 'card' | 'transfer', customerType: 'walk-in' | 'regular' | 'prescription') => {
    const transaction = cashierTracker.completeTransaction(itemCount, totalAmount, paymentMethod, customerType)
    setSession({ ...cashierTracker.getCurrentSession()! })
    setCurrentTransaction(false)
    return transaction
  }

  const startBreak = (type: 'lunch' | 'short' | 'emergency') => {
    const breakPeriod = cashierTracker.startBreak(type)
    setSession({ ...cashierTracker.getCurrentSession()! })
    setIsOnBreak(true)
    return breakPeriod
  }

  const endBreak = () => {
    const breakPeriod = cashierTracker.endBreak()
    setSession({ ...cashierTracker.getCurrentSession()! })
    setIsOnBreak(false)
    return breakPeriod
  }

  const endSession = () => {
    const finalSession = cashierTracker.endSession()
    setSession(null)
    setIsOnBreak(false)
    setCurrentTransaction(false)
    return finalSession
  }

  return {
    session,
    isOnBreak,
    currentTransaction,
    startSession,
    startTransaction,
    completeTransaction,
    startBreak,
    endBreak,
    endSession
  }
}
