// Role-Based Authentication System
export interface User {
  id: string
  username: string
  name: string
  role: 'staff' | 'pharmacist' | 'manager' | 'super-admin'
  assignedBranches: string[]
  permissions: Permission[]
  active: boolean
}

export interface Permission {
  action: string
  resource: string
  conditions?: any
}

export interface AuthSession {
  user: User
  branchId: string
  branchName: string
  loginTime: Date
  ipAddress: string
  deviceInfo: string
}

export class AuthManager {
  private users: Map<string, User> = new Map()
  private activeSessions: Map<string, AuthSession> = new Map()

  constructor() {
    this.initializeUsers()
  }

  private initializeUsers() {
    // Demo users for different branches and roles
    const users: User[] = [
      {
        id: 'admin001',
        username: 'superadmin',
        name: 'System Administrator',
        role: 'super-admin',
        assignedBranches: ['uch', 'yemetu', 'ring-road'],
        permissions: [
          { action: '*', resource: '*' }, // Full access
        ],
        active: true
      },
      {
        id: 'mgr001',
        username: 'manager_uch',
        name: 'John Adebayo',
        role: 'manager',
        assignedBranches: ['uch'],
        permissions: [
          { action: 'read', resource: 'inventory' },
          { action: 'write', resource: 'sales' },
          { action: 'read', resource: 'reports' }
        ],
        active: true
      },
      {
        id: 'pharm001',
        username: 'pharmacist_uch',
        name: 'Dr. Sarah Ogundimu',
        role: 'pharmacist',
        assignedBranches: ['uch', 'yemetu'],
        permissions: [
          { action: 'dispense', resource: 'prescription-drugs' },
          { action: 'read', resource: 'inventory' },
          { action: 'write', resource: 'sales' }
        ],
        active: true
      },
      {
        id: 'staff001',
        username: 'staff_yemetu',
        name: 'Michael Oluwaseun',
        role: 'staff',
        assignedBranches: ['yemetu'],
        permissions: [
          { action: 'read', resource: 'inventory' },
          { action: 'write', resource: 'sales' },
          { action: 'deny', resource: 'prescription-drugs' }
        ],
        active: true
      }
    ]

    users.forEach(user => this.users.set(user.username, user))
  }

  // Enhanced authentication with location verification
  async authenticate(username: string, password: string, detectedBranch: string, ipAddress: string): Promise<AuthSession | null> {
    const user = this.users.get(username)
    
    if (!user || !user.active) {
      throw new Error('Invalid credentials or inactive user')
    }

    // Verify user is assigned to detected branch
    if (!user.assignedBranches.includes(detectedBranch) && user.role !== 'super-admin') {
      throw new Error(`Access denied: You are not assigned to ${detectedBranch} branch`)
    }

    // Create session
    const session: AuthSession = {
      user,
      branchId: detectedBranch,
      branchName: this.getBranchName(detectedBranch),
      loginTime: new Date(),
      ipAddress,
      deviceInfo: navigator.userAgent
    }

    this.activeSessions.set(`${user.id}_${detectedBranch}`, session)
    return session
  }

  // Check if user has permission for specific action
  hasPermission(session: AuthSession, action: string, resource: string): boolean {
    const { user } = session

    // Super admin has all permissions
    if (user.role === 'super-admin') return true

    // Check specific permissions
    return user.permissions.some(permission => {
      if (permission.action === '*' || permission.action === action) {
        if (permission.resource === '*' || permission.resource === resource) {
          return true
        }
      }
      return false
    })
  }

  // Check if user can access admin features
  canAccessAdmin(session: AuthSession): boolean {
    return session.user.role === 'super-admin'
  }

  // Check if user can dispense prescription drugs
  canDispensePrescription(session: AuthSession): boolean {
    return this.hasPermission(session, 'dispense', 'prescription-drugs')
  }

  private getBranchName(branchId: string): string {
    const branchNames = {
      'uch': 'UCH Branch',
      'yemetu': 'Yemetu Branch', 
      'ring-road': 'Ring Road Branch'
    }
    return branchNames[branchId] || 'Unknown Branch'
  }

  // Get all users for admin management
  getAllUsers(): User[] {
    return Array.from(this.users.values())
  }

  // Add new user (super-admin only)
  addUser(user: User, adminSession: AuthSession): boolean {
    if (!this.canAccessAdmin(adminSession)) {
      throw new Error('Access denied: Super admin required')
    }
    
    this.users.set(user.username, user)
    return true
  }
}

export const authManager = new AuthManager()
