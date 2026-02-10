// Database types for Kunle Ara Pharmacy
export interface Product {
  id: string
  name: string
  description: string
  price: number
  category: ProductCategory
  subcategory?: string
  brand?: string
  image: string
  inStock: boolean
  stockQuantity: number
  barcode?: string
  prescriptionRequired: boolean
  expiryDate?: Date
  manufacturer?: string
  activeIngredients?: string[]
  dosageForm?: 'tablet' | 'capsule' | 'liquid' | 'cream' | 'injection' | 'powder' | 'other'
  tags: string[]
  source?: string
  createdAt: Date
  updatedAt: Date
  scraped_at?: string
}

export type ProductCategory = 
  | 'prescription-drugs'
  | 'otc-medications'
  | 'supplements'
  | 'beverages'
  | 'snacks'
  | 'personal-care'
  | 'household'
  | 'baby-care'
  | 'herbal-natural'
  | 'fitness-wellness'

export interface CategoryInfo {
  id: ProductCategory
  name: string
  description: string
  icon: string
  color: string
}

export const categories: CategoryInfo[] = [
  {
    id: 'prescription-drugs',
    name: 'Prescription Drugs',
    description: 'Licensed prescription medications',
    icon: '💊',
    color: 'bg-red-50 border-red-200 text-red-800'
  },
  {
    id: 'otc-medications',
    name: 'Over-the-Counter',
    description: 'Self-care medications',
    icon: '🏥',
    color: 'bg-blue-50 border-blue-200 text-blue-800'
  },
  {
    id: 'supplements',
    name: 'Health Supplements',
    description: 'Vitamins and nutritional supplements',
    icon: '💪',
    color: 'bg-green-50 border-green-200 text-green-800'
  },
  {
    id: 'beverages',
    name: 'Beverages & Drinks',
    description: 'Soft drinks, water, health drinks',
    icon: '🥤',
    color: 'bg-cyan-50 border-cyan-200 text-cyan-800'
  },
  {
    id: 'snacks',
    name: 'Snacks & Confectionery',
    description: 'Healthy snacks and treats',
    icon: '🍿',
    color: 'bg-yellow-50 border-yellow-200 text-yellow-800'
  },
  {
    id: 'personal-care',
    name: 'Personal Care',
    description: 'Hygiene and personal care products',
    icon: '🧴',
    color: 'bg-purple-50 border-purple-200 text-purple-800'
  },
  {
    id: 'household',
    name: 'Household Items',
    description: 'Cleaning and household essentials',
    icon: '🏠',
    color: 'bg-orange-50 border-orange-200 text-orange-800'
  },
  {
    id: 'baby-care',
    name: 'Baby Care',
    description: 'Products for infants and children',
    icon: '👶',
    color: 'bg-pink-50 border-pink-200 text-pink-800'
  },
  {
    id: 'herbal-natural',
    name: 'Herbal & Natural',
    description: 'Natural and traditional remedies',
    icon: '🌿',
    color: 'bg-emerald-50 border-emerald-200 text-emerald-800'
  },
  {
    id: 'fitness-wellness',
    name: 'Fitness & Wellness',
    description: 'Sports nutrition and wellness products',
    icon: '🏃',
    color: 'bg-indigo-50 border-indigo-200 text-indigo-800'
  }
]
