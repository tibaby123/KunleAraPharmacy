// app/lib/email/service.ts
import nodemailer from 'nodemailer'
import { emailConfig } from './config'

interface EmailData {
  to: string | string[]
  subject: string
  html: string
  text?: string
  attachments?: Array<{
    filename: string
    content: Buffer | string
  }>
}

class EmailService {
  private transporter: nodemailer.Transporter

  constructor() {
    this.transporter = nodemailer.createTransporter({
      host: emailConfig.host,
      port: emailConfig.port,
      secure: emailConfig.secure,
      auth: {
        user: emailConfig.auth.user,
        pass: emailConfig.auth.pass
      }
    })
  }

  async sendEmail(emailData: EmailData): Promise<boolean> {
    try {
      const mailOptions = {
        from: `${emailConfig.from.name} <${emailConfig.from.address}>`,
        to: Array.isArray(emailData.to) ? emailData.to.join(', ') : emailData.to,
        subject: emailData.subject,
        html: emailData.html,
        text: emailData.text,
        attachments: emailData.attachments
      }

      const result = await this.transporter.sendMail(mailOptions)
      console.log('📧 Email sent successfully:', result.messageId)
      return true
    } catch (error) {
      console.error('❌ Email sending failed:', error)
      return false
    }
  }

  // Send order confirmation
  async sendOrderConfirmation(orderData: {
    customerEmail: string
    customerName: string
    orderNumber: string
    items: Array<{name: string, quantity: number, price: number}>
    total: number
    branch: string
  }): Promise<boolean> {
    const html = this.generateOrderConfirmationHTML(orderData)
    
    return this.sendEmail({
      to: orderData.customerEmail,
      subject: `Order Confirmation #${orderData.orderNumber} - Kunle Ara Pharmacy`,
      html: html
    })
  }

  // Send prescription ready notification
  async sendPrescriptionReady(data: {
    customerEmail: string
    customerName: string
    prescriptionId: string
    branch: string
    pickupInstructions: string
  }): Promise<boolean> {
    const html = this.generatePrescriptionReadyHTML(data)
    
    return this.sendEmail({
      to: data.customerEmail,
      subject: `Prescription Ready for Pickup - Kunle Ara Pharmacy`,
      html: html
    })
  }

  // Send low stock alert to staff
  async sendLowStockAlert(data: {
    productName: string
    currentStock: number
    minStock: number
    branch: string
  }): Promise<boolean> {
    const html = this.generateLowStockAlertHTML(data)
    
    return this.sendEmail({
      to: process.env.STORE_EMAIL || 'pharmacy@kunlearapharmacy.ng',
      subject: `Low Stock Alert: ${data.productName}`,
      html: html
    })
  }

  // Send daily sales report
  async sendDailySalesReport(data: {
    date: string
    branch: string
    totalSales: number
    totalTransactions: number
    topProducts: Array<{name: string, quantity: number, revenue: number}>
  }): Promise<boolean> {
    const html = this.generateDailySalesReportHTML(data)
    
    return this.sendEmail({
      to: process.env.STORE_EMAIL || 'pharmacy@kunlearapharmacy.ng',
      subject: `Daily Sales Report - ${data.branch} - ${data.date}`,
      html: html
    })
  }

  private generateOrderConfirmationHTML(data: any): string {
    return `
      <!DOCTYPE html>
      <html>
      <head>
        <meta charset="utf-8">
        <style>
          body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
          .header { background: #2563eb; color: white; padding: 20px; text-align: center; }
          .content { padding: 20px; }
          .order-details { background: #f8f9fa; padding: 15px; margin: 20px 0; }
          .item { display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid #eee; }
          .total { font-weight: bold; font-size: 18px; color: #2563eb; }
          .footer { background: #f8f9fa; padding: 15px; text-align: center; color: #666; }
        </style>
      </head>
      <body>
        <div class="header">
          <h1>🏥 Kunle Ara Pharmacy</h1>
          <p>Order Confirmation</p>
        </div>
        
        <div class="content">
          <h2>Hello ${data.customerName},</h2>
          <p>Thank you for your order! Your order has been confirmed and is being prepared.</p>
          
          <div class="order-details">
            <h3>Order Details</h3>
            <p><strong>Order Number:</strong> ${data.orderNumber}</p>
            <p><strong>Branch:</strong> ${data.branch}</p>
            <p><strong>Date:</strong> ${new Date().toLocaleDateString()}</p>
            
            <h4>Items Ordered:</h4>
            ${data.items.map(item => `
              <div class="item">
                <span>${item.name} (x${item.quantity})</span>
                <span>₦${(item.price * item.quantity).toLocaleString()}</span>
              </div>
            `).join('')}
            
            <div class="item total">
              <span>Total Amount:</span>
              <span>₦${data.total.toLocaleString()}</span>
            </div>
          </div>
          
          <p><strong>Next Steps:</strong></p>
          <ul>
            <li>Your order is being prepared</li>
            <li>You will receive a notification when ready for pickup</li>
            <li>Please bring a valid ID for prescription items</li>
          </ul>
        </div>
        
        <div class="footer">
          <p>Kunle Ara Pharmacy - Your Health, Our Priority</p>
          <p>📞 Phone: +234-xxx-xxx-xxxx | 📧 Email: pharmacy@kunlearapharmacy.ng</p>
        </div>
      </body>
      </html>
    `
  }

  private generatePrescriptionReadyHTML(data: any): string {
    return `
      <!DOCTYPE html>
      <html>
      <head>
        <meta charset="utf-8">
        <style>
          body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
          .header { background: #059669; color: white; padding: 20px; text-align: center; }
          .content { padding: 20px; }
          .alert-box { background: #d1fae5; border: 2px solid #059669; padding: 15px; margin: 20px 0; border-radius: 8px; }
          .footer { background: #f8f9fa; padding: 15px; text-align: center; color: #666; }
        </style>
      </head>
      <body>
        <div class="header">
          <h1>🏥 Kunle Ara Pharmacy</h1>
          <p>Prescription Ready for Pickup</p>
        </div>
        
        <div class="content">
          <h2>Hello ${data.customerName},</h2>
          
          <div class="alert-box">
            <h3>✅ Your Prescription is Ready!</h3>
            <p><strong>Prescription ID:</strong> ${data.prescriptionId}</p>
            <p><strong>Branch:</strong> ${data.branch}</p>
          </div>
          
          <p><strong>Pickup Instructions:</strong></p>
          <p>${data.pickupInstructions}</p>
          
          <p><strong>What to Bring:</strong></p>
          <ul>
            <li>Valid government-issued ID</li>
            <li>Original prescription (if first pickup)</li>
            <li>Payment for any balance due</li>
          </ul>
          
          <p>Please collect your prescription within 30 days.</p>
        </div>
        
        <div class="footer">
          <p>Kunle Ara Pharmacy - Your Health, Our Priority</p>
          <p>📞 Phone: +234-xxx-xxx-xxxx | 📧 Email: pharmacy@kunlearapharmacy.ng</p>
        </div>
      </body>
      </html>
    `
  }

  private generateLowStockAlertHTML(data: any): string {
    return `
      <!DOCTYPE html>
      <html>
      <body style="font-family: Arial, sans-serif;">
        <div style="background: #dc2626; color: white; padding: 20px; text-align: center;">
          <h1>⚠️ Low Stock Alert</h1>
        </div>
        
        <div style="padding: 20px;">
          <h2>Inventory Alert</h2>
          <p><strong>Product:</strong> ${data.productName}</p>
          <p><strong>Current Stock:</strong> ${data.currentStock} units</p>
          <p><strong>Minimum Stock Level:</strong> ${data.minStock} units</p>
          <p><strong>Branch:</strong> ${data.branch}</p>
          
          <p style="color: #dc2626; font-weight: bold;">
            Immediate restocking required!
          </p>
        </div>
      </body>
      </html>
    `
  }

  private generateDailySalesReportHTML(data: any): string {
    return `
      <!DOCTYPE html>
      <html>
      <body style="font-family: Arial, sans-serif;">
        <div style="background: #2563eb; color: white; padding: 20px; text-align: center;">
          <h1>📊 Daily Sales Report</h1>
          <p>${data.branch} - ${data.date}</p>
        </div>
        
        <div style="padding: 20px;">
          <h2>Sales Summary</h2>
          <p><strong>Total Sales:</strong> ₦${data.totalSales.toLocaleString()}</p>
          <p><strong>Total Transactions:</strong> ${data.totalTransactions}</p>
          
          <h3>Top Products</h3>
          ${data.topProducts.map(product => `
            <p>${product.name}: ${product.quantity} units - ₦${product.revenue.toLocaleString()}</p>
          `).join('')}
        </div>
      </body>
      </html>
    `
  }
}

export const emailService = new EmailService()
