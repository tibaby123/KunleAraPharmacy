'use client'

import { useState, useEffect } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { Package, ShoppingCart, BarChart3, RotateCcw, Shield, Clock, Users, TrendingUp } from 'lucide-react'

export default function HomePage() {
  const [currentImageIndex, setCurrentImageIndex] = useState(0)
  
  // Your pharmacy images
  const pharmacyImages = [
    '/images/pharmacy1.jpg', // Replace with your actual image paths
    '/images/pharmacy2.jpg',
    '/images/pharmacy3.jpg',
  ]

  // Auto-rotate images every 5 seconds
  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentImageIndex((prev) => (prev + 1) % pharmacyImages.length)
    }, 5000)
    return () => clearInterval(interval)
  }, [pharmacyImages.length])

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 via-white to-orange-50">
      {/* Header */}
      <header className="bg-white/90 backdrop-blur-md shadow-md sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-20">
            {/* F */}
            <div className="flex items-center space-x-3">
              <div className="relative w-48 h-16">
                <Image
                  src="/images/kunle-ara-logo.jpg"
                  alt="Kunle Ara Pharmacy"
                  fill
                  className="object-contain"
                  priority
                />
              </div>
            </div>

            {/* Branch Links */}
            <nav className="hidden md:flex items-center space-x-8">
              <Link href="#" className="text-gray-700 hover:text-orange-600 font-medium transition">
                UCH Branch
              </Link>
              <Link href="#" className="text-gray-700 hover:text-orange-600 font-medium transition">
                Yemetu Branch
              </Link>
              <Link href="#" className="text-gray-700 hover:text-orange-600 font-medium transition">
                Ring Road Branch
              </Link>
            </nav>

            {/* Admin Login */}
            <Link
              href="/admin/login"
              className="flex items-center space-x-2 bg-orange-600 text-white px-6 py-2 rounded-lg hover:bg-orange-700 transition shadow-lg"
            >
              <Shield className="h-5 w-5" />
              <span className="font-semibold">Admin Login</span>
            </Link>
          </div>
        </div>
      </header>

      {/* Hero Section with Rotating Images */}
      <section className="relative py-20 overflow-hidden">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            {/* Text Content */}
            <div className="space-y-8">
              <div className="inline-block">
                <span className="bg-orange-100 text-orange-700 px-4 py-2 rounded-full text-sm font-semibold">
                  📋 RC. 285016 - Licensed & Trusted
                </span>
              </div>

              <h1 className="text-5xl lg:text-6xl font-bold text-gray-900 leading-tight">
                Kunle Ara Pharmacy
                <span className="block text-orange-600 mt-2">Management System</span>
              </h1>

              <p className="text-xl text-gray-600 leading-relaxed">
                Complete pharmacy management solution for Point of Sale, Inventory Management, 
                Refunds Processing, and Business Analytics across all branches.
              </p>

              {/* Stats */}
              <div className="grid grid-cols-3 gap-4 pt-4">
                <div className="text-center">
                  <div className="text-3xl font-bold text-orange-600">3</div>
                  <div className="text-sm text-gray-600">Branches</div>
                </div>
                <div className="text-center">
                  <div className="text-3xl font-bold text-blue-600">500+</div>
                  <div className="text-sm text-gray-600">Products</div>
                </div>
                <div className="text-center">
                  <div className="text-3xl font-bold text-green-600">24/7</div>
                  <div className="text-sm text-gray-600">Service</div>
                </div>
              </div>

              {/* CTA Buttons */}
              <div className="flex flex-wrap gap-4">
                <Link
                  href="/pos"
                  className="flex items-center space-x-2 bg-gradient-to-r from-green-600 to-green-500 text-white px-8 py-4 rounded-xl font-semibold text-lg hover:from-green-700 hover:to-green-600 transition transform hover:scale-105 shadow-xl"
                >
                  <ShoppingCart className="h-6 w-6" />
                  <span>Start Selling</span>
                </Link>
                <Link
                  href="/products"
                  className="flex items-center space-x-2 bg-white text-blue-600 px-8 py-4 rounded-xl font-semibold text-lg hover:bg-blue-50 transition border-2 border-blue-600 shadow-lg"
                >
                  <Package className="h-6 w-6" />
                  <span>View Products</span>
                </Link>
              </div>
            </div>

            {/* Rotating Images */}
            <div className="relative">
              <div className="relative h-[500px] rounded-3xl overflow-hidden shadow-2xl">
                {pharmacyImages.map((img, index) => (
                  <div
                    key={index}
                    className={`absolute inset-0 transition-opacity duration-1000 ${
                      index === currentImageIndex ? 'opacity-100' : 'opacity-0'
                    }`}
                  >
                    <Image
                      src={img}
                      alt={`Kunle Ara Pharmacy ${index + 1}`}
                      fill
                      className="object-cover"
                      priority={index === 0}
                    />
                  </div>
                ))}
                
                {/* Overlay with logo */}
                <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent">
                  <div className="absolute bottom-8 left-8 right-8">
                    <div className="bg-white/90 backdrop-blur-md rounded-2xl p-4">
                      <div className="relative h-12 w-40">
                        <Image
                          src="/images/kunle-ara-logo.jpg"
                          alt="Kunle Ara"
                          fill
                          className="object-contain"
                        />
                      </div>
                    </div>
                  </div>
                </div>

                {/* Navigation Dots */}
                <div className="absolute bottom-4 left-1/2 transform -translate-x-1/2 flex space-x-2">
                  {pharmacyImages.map((_, index) => (
                    <button
                      key={index}
                      onClick={() => setCurrentImageIndex(index)}
                      className={`w-2 h-2 rounded-full transition-all ${
                        index === currentImageIndex ? 'bg-white w-8' : 'bg-white/50'
                      }`}
                    />
                  ))}
                </div>
              </div>

              {/* Floating Stats Cards */}
              <div className="absolute -bottom-6 -left-6 bg-white rounded-2xl shadow-xl p-4 w-48">
                <div className="flex items-center space-x-3">
                  <div className="p-3 bg-green-100 rounded-xl">
                    <TrendingUp className="h-6 w-6 text-green-600" />
                  </div>
                  <div>
                    <div className="text-2xl font-bold text-gray-900">98%</div>
                    <div className="text-xs text-gray-600">Customer Satisfaction</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Main Features Grid */}
      <section className="py-20 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">
              Pharmacy Management Dashboard
            </h2>
            <p className="text-xl text-gray-600">
              Everything you need to run your pharmacy efficiently
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
            {/* POS System */}
            <Link
              href="/pos"
              className="group relative bg-gradient-to-br from-green-500 to-green-600 rounded-3xl p-8 text-white hover:shadow-2xl transition transform hover:scale-105"
            >
              <div className="absolute top-4 right-4 opacity-20 group-hover:opacity-30 transition">
                <ShoppingCart className="h-24 w-24" />
              </div>
              <div className="relative z-10">
                <div className="p-4 bg-white/20 backdrop-blur-sm rounded-2xl w-16 h-16 flex items-center justify-center mb-6">
                  <ShoppingCart className="h-8 w-8" />
                </div>
                <h3 className="text-2xl font-bold mb-3">POS System</h3>
                <p className="text-green-100 mb-4">
                  Fast and efficient point of sale transactions
                </p>
                <div className="flex items-center space-x-2 text-sm font-semibold">
                  <span>Start Selling</span>
                  <span className="group-hover:translate-x-1 transition">→</span>
                </div>
              </div>
            </Link>

            {/* Products Management */}
            <Link
              href="/products"
              className="group relative bg-gradient-to-br from-blue-500 to-blue-600 rounded-3xl p-8 text-white hover:shadow-2xl transition transform hover:scale-105"
            >
              <div className="absolute top-4 right-4 opacity-20 group-hover:opacity-30 transition">
                <Package className="h-24 w-24" />
              </div>
              <div className="relative z-10">
                <div className="p-4 bg-white/20 backdrop-blur-sm rounded-2xl w-16 h-16 flex items-center justify-center mb-6">
                  <Package className="h-8 w-8" />
                </div>
                <h3 className="text-2xl font-bold mb-3">Products</h3>
                <p className="text-blue-100 mb-4">
                  Manage inventory across all branches
                </p>
                <div className="flex items-center space-x-2 text-sm font-semibold">
                  <span>View Inventory</span>
                  <span className="group-hover:translate-x-1 transition">→</span>
                </div>
              </div>
            </Link>

            {/* Refunds */}
            <Link
              href="/refunds"
              className="group relative bg-gradient-to-br from-red-500 to-red-600 rounded-3xl p-8 text-white hover:shadow-2xl transition transform hover:scale-105"
            >
              <div className="absolute top-4 right-4 opacity-20 group-hover:opacity-30 transition">
                <RotateCcw className="h-24 w-24" />
              </div>
              <div className="relative z-10">
                <div className="p-4 bg-white/20 backdrop-blur-sm rounded-2xl w-16 h-16 flex items-center justify-center mb-6">
                  <RotateCcw className="h-8 w-8" />
                </div>
                <h3 className="text-2xl font-bold mb-3">Refunds</h3>
                <p className="text-red-100 mb-4">
                  Process returns and refunds quickly
                </p>
                <div className="flex items-center space-x-2 text-sm font-semibold">
                  <span>Process Refunds</span>
                  <span className="group-hover:translate-x-1 transition">→</span>
                </div>
              </div>
            </Link>

            {/* Reports */}
            <Link
              href="/reports"
              className="group relative bg-gradient-to-br from-purple-500 to-purple-600 rounded-3xl p-8 text-white hover:shadow-2xl transition transform hover:scale-105"
            >
              <div className="absolute top-4 right-4 opacity-20 group-hover:opacity-30 transition">
                <BarChart3 className="h-24 w-24" />
              </div>
              <div className="relative z-10">
                <div className="p-4 bg-white/20 backdrop-blur-sm rounded-2xl w-16 h-16 flex items-center justify-center mb-6">
                  <BarChart3 className="h-8 w-8" />
                </div>
                <h3 className="text-2xl font-bold mb-3">Reports</h3>
                <p className="text-purple-100 mb-4">
                  View analytics and business insights
                </p>
                <div className="flex items-center space-x-2 text-sm font-semibold">
                  <span>View Analytics</span>
                  <span className="group-hover:translate-x-1 transition">→</span>
                </div>
              </div>
            </Link>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-20 bg-gradient-to-br from-orange-50 to-blue-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid md:grid-cols-3 gap-8">
            <div className="bg-white rounded-2xl p-8 shadow-lg hover:shadow-xl transition">
              <div className="p-4 bg-blue-100 rounded-xl w-16 h-16 flex items-center justify-center mb-6">
                <Clock className="h-8 w-8 text-blue-600" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-3">Real-Time Updates</h3>
              <p className="text-gray-600">
                Instant synchronization across all branches with real-time inventory tracking
              </p>
            </div>

            <div className="bg-white rounded-2xl p-8 shadow-lg hover:shadow-xl transition">
              <div className="p-4 bg-orange-100 rounded-xl w-16 h-16 flex items-center justify-center mb-6">
                <Shield className="h-8 w-8 text-orange-600" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-3">Secure & Compliant</h3>
              <p className="text-gray-600">
                NAFDAC compliant with secure prescription handling and audit trails
              </p>
            </div>

            <div className="bg-white rounded-2xl p-8 shadow-lg hover:shadow-xl transition">
              <div className="p-4 bg-green-100 rounded-xl w-16 h-16 flex items-center justify-center mb-6">
                <Users className="h-8 w-8 text-green-600" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-3">Multi-Branch</h3>
              <p className="text-gray-600">
                Manage UCH, Yemetu, and Ring Road branches from one central system
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-900 text-white py-12">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid md:grid-cols-4 gap-8">
            <div>
              <div className="relative h-12 w-40 mb-4">
                <Image
                  src="/images/kunle-ara-logo.jpg"
                  alt="Kunle Ara Pharmacy"
                  fill
                  className="object-contain brightness-0 invert"
                />
              </div>
              <p className="text-gray-400 text-sm">
                Licensed Pharmacy<br />
                RC. 285016
              </p>
            </div>

            <div>
              <h4 className="font-bold mb-4">Branches</h4>
              <ul className="space-y-2 text-gray-400 text-sm">
                <li>UCH Branch</li>
                <li>Yemetu Branch</li>
                <li>Ring Road Branch</li>
              </ul>
            </div>

            <div>
              <h4 className="font-bold mb-4">Quick Links</h4>
              <ul className="space-y-2 text-gray-400 text-sm">
                <li><Link href="/pos" className="hover:text-white">POS System</Link></li>
                <li><Link href="/products" className="hover:text-white">Products</Link></li>
                <li><Link href="/reports" className="hover:text-white">Reports</Link></li>
              </ul>
            </div>

            <div>
              <h4 className="font-bold mb-4">Contact</h4>
              <p className="text-gray-400 text-sm">
                Ibadan, Oyo State<br />
                Nigeria<br />
                Phone: +234 XXX XXX XXXX
              </p>
            </div>
          </div>

          <div className="border-t border-gray-800 mt-8 pt-8 text-center text-gray-400 text-sm">
            <p>© 2026 Kunle Ara Pharmacy. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  )
}
