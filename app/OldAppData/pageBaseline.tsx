'use client'

import { useEffect, useMemo, useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import {
  ArrowRight,
  BadgeCheck,
  Clock,
  Package,
  Search,
  ShieldCheck,
  Sparkles,
  Store,
  Truck,
  Users,
} from 'lucide-react'

export default function HomePage() {
  // Update these to your real images in /public/images/...
  const pharmacyImages = useMemo(
    () => [
      '/images/Customs1.jpg',
      '/images/Customs2.jpg',
      '/images/Customs3.jpg',
      '/images/customs4.jpg',
    ],
    []
  )

  const [idx, setIdx] = useState(0)

  useEffect(() => {
    if (!pharmacyImages.length) return
    const t = setInterval(() => {
      setIdx((p) => (p + 1) % pharmacyImages.length)
    }, 4500)
    return () => clearInterval(t)
  }, [pharmacyImages.length])

  return (
    <div className="min-h-screen bg-white">
      {/* Top Bar */}
      <header className="sticky top-0 z-50 border-b bg-white/85 backdrop-blur">
        <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-3">
          <Link href="/" className="flex items-center gap-3">
            {/* Put your logo in /public/images/kunlearalogo.png (or change path) */}
            <div className="relative h-10 w-32">
              <Image
                src="/images/kunlearalogo.png"
                alt="Kunle Ara Pharmacy"
                fill
                className="object-contain"
                priority
              />
            </div>
          </Link>

          <nav className="hidden items-center gap-8 md:flex">
            <Link href="/shop" className="text-sm font-medium text-slate-700 hover:text-slate-900">
              Shop
            </Link>
            <Link href="/products" className="text-sm font-medium text-slate-700 hover:text-slate-900">
              Products
            </Link>
            <Link href="/wholesale" className="text-sm font-medium text-slate-700 hover:text-slate-900">
              Wholesale
            </Link>
            <Link href="/contact" className="text-sm font-medium text-slate-700 hover:text-slate-900">
              Contact
            </Link>
          </nav>

          <div className="flex items-center gap-2">
            <Link
              href="/products"
              className="hidden rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800 md:inline-flex"
            >
              View Products
            </Link>
            <Link
              href="/login"
              className="inline-flex rounded-xl border px-4 py-2 text-sm font-semibold text-slate-800 hover:bg-slate-50"
            >
              Login
            </Link>
          </div>
        </div>
      </header>

      {/* Hero */}
      <section className="relative overflow-hidden">
        <div className="absolute inset-0">
          <div className="relative h-full w-full">
            <Image
              src={pharmacyImages[idx] || '/images/Customs1.jpg'}
              alt="Pharmacy background"
              fill
              className="object-cover"
              priority
            />
            <div className="absolute inset-0 bg-gradient-to-r from-white via-white/80 to-white/10" />
            <div className="absolute inset-0 bg-gradient-to-b from-white/20 via-transparent to-white" />
          </div>
        </div>

        <div className="relative mx-auto max-w-7xl px-4 py-16 md:py-24">
          <div className="grid items-center gap-10 md:grid-cols-2">
            <div>
              <div className="inline-flex items-center gap-2 rounded-full border bg-white/80 px-4 py-2 text-sm font-semibold text-slate-700">
                <Sparkles className="h-4 w-4" />
                Trusted pharmacy experience — modern, fast, reliable
              </div>

              <h1 className="mt-5 text-4xl font-extrabold tracking-tight text-slate-900 md:text-5xl">
                Kunle Ara Pharmacy
                <span className="block text-slate-700">Your family pharmacist — we’re here to help.</span>
              </h1>

              <p className="mt-5 max-w-xl text-base leading-relaxed text-slate-700 md:text-lg">
                Browse everyday essentials, health & wellness, and trusted products — with a clean, professional
                shopping experience.
              </p>

              <div className="mt-7 flex flex-col gap-3 sm:flex-row">
                <Link
                  href="/products"
                  className="inline-flex items-center justify-center gap-2 rounded-2xl bg-slate-900 px-6 py-3 text-sm font-semibold text-white hover:bg-slate-800"
                >
                  <Package className="h-5 w-5" />
                  Browse Products
                  <ArrowRight className="h-4 w-4" />
                </Link>

                <Link
                  href="/shop"
                  className="inline-flex items-center justify-center gap-2 rounded-2xl border bg-white/90 px-6 py-3 text-sm font-semibold text-slate-900 hover:bg-white"
                >
                  <Search className="h-5 w-5" />
                  Shop Now
                </Link>
              </div>

              <div className="mt-8 grid grid-cols-2 gap-3 sm:grid-cols-4">
                <StatCard icon={<Store className="h-5 w-5" />} label="Retail ready" value="Modern UI" />
                <StatCard icon={<Users className="h-5 w-5" />} label="Customers" value="Growing" />
                <StatCard icon={<Clock className="h-5 w-5" />} label="Support" value="Fast" />
                <StatCard icon={<BadgeCheck className="h-5 w-5" />} label="Trusted" value="Quality" />
              </div>
            </div>

            {/* Right side feature card */}
            <div className="rounded-3xl border bg-white/85 p-6 shadow-xl backdrop-blur">
              <div className="flex items-start justify-between gap-4">
                <div>
                  <p className="text-sm font-semibold text-slate-700">Why Kunle Ara?</p>
                  <h2 className="mt-1 text-2xl font-bold text-slate-900">Premium pharmacy feel</h2>
                  <p className="mt-2 text-sm leading-relaxed text-slate-700">
                    Clean shelves. Clear categories. Confident buying experience. This homepage is designed to plug
                    into your existing routes without touching your product logic.
                  </p>
                </div>
                <div className="rounded-2xl bg-slate-900 p-3 text-white">
                  <ShieldCheck className="h-6 w-6" />
                </div>
              </div>

              <div className="mt-6 grid gap-3">
                <FeatureRow
                  icon={<Truck className="h-5 w-5" />}
                  title="Smooth shopping"
                  desc="Clear calls-to-action to your existing /products and /shop routes."
                />
                <FeatureRow
                  icon={<ShieldCheck className="h-5 w-5" />}
                  title="Professional look"
                  desc="A clean brand-first layout that feels like a real pharmacy site."
                />
                <FeatureRow
                  icon={<BadgeCheck className="h-5 w-5" />}
                  title="Stable"
                  desc="No product fetching here — so the homepage won’t fail if the API is down."
                />
              </div>

              <div className="mt-6 flex flex-wrap gap-2">
                {pharmacyImages.map((_, i) => (
                  <button
                    key={i}
                    onClick={() => setIdx(i)}
                    aria-label={`Show image ${i + 1}`}
                    className={
                      'h-2.5 w-10 rounded-full transition ' +
                      (i === idx ? 'bg-slate-900' : 'bg-slate-300 hover:bg-slate-400')
                    }
                  />
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Category tiles */}
      <section className="mx-auto max-w-7xl px-4 py-14">
        <div className="flex items-end justify-between gap-4">
          <div>
            <h3 className="text-2xl font-bold text-slate-900">Shop by category</h3>
            <p className="mt-1 text-sm text-slate-600">Quick navigation — you can wire these to real category filters later.</p>
          </div>
          <Link href="/products" className="text-sm font-semibold text-slate-900 hover:underline">
            View all <span aria-hidden>→</span>
          </Link>
        </div>

        <div className="mt-6 grid gap-4 md:grid-cols-4">
          <CategoryTile title="Health & Wellness" subtitle="Everyday essentials" href="/products" />
          <CategoryTile title="Family Care" subtitle="For adults & kids" href="/products" />
          <CategoryTile title="Beauty" subtitle="Skincare & more" href="/products" />
          <CategoryTile title="Vitamins" subtitle="Supplements" href="/products" />
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t bg-slate-50">
        <div className="mx-auto grid max-w-7xl gap-8 px-4 py-10 md:grid-cols-3">
          <div>
            <p className="text-sm font-bold text-slate-900">Kunle Ara Pharmacy</p>
            <p className="mt-2 text-sm text-slate-600">A modern pharmacy storefront experience.</p>
          </div>

          <div className="grid grid-cols-2 gap-3 text-sm">
            <Link href="/products" className="text-slate-700 hover:text-slate-900">Products</Link>
            <Link href="/shop" className="text-slate-700 hover:text-slate-900">Shop</Link>
            <Link href="/wholesale" className="text-slate-700 hover:text-slate-900">Wholesale</Link>
            <Link href="/contact" className="text-slate-700 hover:text-slate-900">Contact</Link>
          </div>

          <div className="text-sm text-slate-600">
            <p className="font-semibold text-slate-900">Need help?</p>
            <p className="mt-2">Use the Contact page for enquiries.</p>
          </div>
        </div>
      </footer>
    </div>
  )
}

function StatCard(props: { icon: React.ReactNode; label: string; value: string }) {
  return (
    <div className="rounded-2xl border bg-white/85 px-4 py-3 shadow-sm">
      <div className="flex items-center gap-2 text-slate-900">
        <span className="inline-flex rounded-xl bg-slate-900 p-2 text-white">{props.icon}</span>
      </div>
      <div className="mt-2 text-sm font-semibold text-slate-900">{props.value}</div>
      <div className="text-xs text-slate-600">{props.label}</div>
    </div>
  )
}

function FeatureRow(props: { icon: React.ReactNode; title: string; desc: string }) {
  return (
    <div className="flex gap-3 rounded-2xl border bg-white px-4 py-3">
      <div className="mt-0.5 text-slate-900">{props.icon}</div>
      <div>
        <div className="text-sm font-bold text-slate-900">{props.title}</div>
        <div className="text-sm text-slate-600">{props.desc}</div>
      </div>
    </div>
  )
}

function CategoryTile(props: { title: string; subtitle: string; href: string }) {
  return (
    <Link
      href={props.href}
      className="group rounded-3xl border bg-white p-6 shadow-sm transition hover:-translate-y-0.5 hover:shadow-lg"
    >
      <div className="text-lg font-bold text-slate-900">{props.title}</div>
      <div className="mt-1 text-sm text-slate-600">{props.subtitle}</div>
      <div className="mt-6 inline-flex items-center gap-2 text-sm font-semibold text-slate-900">
        Explore <span className="transition group-hover:translate-x-0.5" aria-hidden>→</span>
      </div>
    </Link>
  )
}
