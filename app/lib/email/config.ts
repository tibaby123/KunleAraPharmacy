// app/lib/email/config.ts
export interface EmailConfig {
  provider: 'gmail' | 'outlook' | 'custom'
  host: string
  port: number
  secure: boolean
  auth: {
    user: string
    pass: string
  }
  from: {
    name: string
    address: string
  }
}

export const emailConfig: EmailConfig = {
  provider: 'gmail',
  host: process.env.EMAIL_HOST || 'smtp.gmail.com',
  port: parseInt(process.env.EMAIL_PORT || '587'),
  secure: process.env.EMAIL_SECURE === 'true',
  auth: {
    user: process.env.EMAIL_USER || 'pharmacy@kunlearapharmacy.ng',
    pass: process.env.EMAIL_PASSWORD || 'your-app-password'
  },
  from: {
    name: 'Kunle Ara Pharmacy',
    address: process.env.EMAIL_FROM || 'pharmacy@kunlearapharmacy.ng'
  }
}

// Email templates for different purposes
export const emailTemplates = {
  orderConfirmation: {
    subject: 'Order Confirmation - Kunle Ara Pharmacy',
    template: 'order-confirmation'
  },
  prescriptionReady: {
    subject: 'Your Prescription is Ready - Kunle Ara Pharmacy', 
    template: 'prescription-ready'
  },
  lowStock: {
    subject: 'Low Stock Alert - Kunle Ara Pharmacy',
    template: 'low-stock-alert'
  },
  dailySalesReport: {
    subject: 'Daily Sales Report - Kunle Ara Pharmacy',
    template: 'daily-sales-report'
  }
}
