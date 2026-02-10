// Master product database for Kunle Ara Pharmacy POS
// Generated: 2026-01-12 11:03:53
// Sources: Kunle Ara Scraped: 76 products
// Total products: 76

export interface Product {
  id: string
  name: string
  description: string
  price: number
  category: string
  subcategory?: string
  brand?: string
  image: string
  inStock: boolean
  stockQuantity: number
  barcode?: string
  prescriptionRequired: boolean
  manufacturer?: string
  activeIngredients?: string[]
  dosageForm?: string
  tags: string[]
  source?: string
  createdAt?: string
  updatedAt?: string
  scraped_at?: string
}

// All products from Kunle Ara Pharmacy
export const allProducts: Product[] = [
  {
    "id": "enhanced_prescription-drugs_001",
    "name": "Amoxicillin 500mg Capsules",
    "description": "Antibiotic for bacterial infections",
    "price": 2500,
    "category": "prescription-drugs",
    "subcategory": "Antibiotics",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/prescription_drugs/amoxicillin_500mg_capsules.jpg",
    "inStock": true,
    "stockQuantity": 17,
    "barcode": "602378423142",
    "prescriptionRequired": true,
    "manufacturer": "Various",
    "activeIngredients": [
      "Amoxicillin"
    ],
    "dosageForm": "capsule",
    "tags": [
      "prescription drugs"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.817807"
  },
  {
    "id": "enhanced_prescription-drugs_002",
    "name": "Augmentin 625mg Tablets",
    "description": "Broad-spectrum antibiotic",
    "price": 4500,
    "category": "prescription-drugs",
    "subcategory": "Antibiotics",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/prescription_drugs/augmentin_625mg_tablets.jpg",
    "inStock": true,
    "stockQuantity": 54,
    "barcode": "423124486916",
    "prescriptionRequired": true,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "tablet",
    "tags": [
      "prescription drugs"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.817945"
  },
  {
    "id": "enhanced_prescription-drugs_003",
    "name": "Ciprofloxacin 500mg Tablets",
    "description": "Fluoroquinolone antibiotic",
    "price": 3200,
    "category": "prescription-drugs",
    "subcategory": "General Prescription",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/prescription_drugs/ciprofloxacin_500mg_tablets.jpg",
    "inStock": true,
    "stockQuantity": 40,
    "barcode": "331455090010",
    "prescriptionRequired": true,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "tablet",
    "tags": [
      "prescription drugs"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.818038"
  },
  {
    "id": "enhanced_prescription-drugs_004",
    "name": "Metronidazole 400mg Tablets",
    "description": "Antiprotozoal and antibacterial",
    "price": 1800,
    "category": "prescription-drugs",
    "subcategory": "General Prescription",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/prescription_drugs/metronidazole_400mg_tablets.jpg",
    "inStock": true,
    "stockQuantity": 49,
    "barcode": "477757383537",
    "prescriptionRequired": true,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "tablet",
    "tags": [
      "prescription drugs"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.818116"
  },
  {
    "id": "enhanced_prescription-drugs_005",
    "name": "Artemether Lumefantrine Tablets",
    "description": "Antimalarial medication",
    "price": 3500,
    "category": "prescription-drugs",
    "subcategory": "Antimalarials",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/prescription_drugs/artemether_lumefantrine_tablets.jpg",
    "inStock": true,
    "stockQuantity": 57,
    "barcode": "246601116652",
    "prescriptionRequired": true,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "tablet",
    "tags": [
      "prescription drugs"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.818193"
  },
  {
    "id": "enhanced_prescription-drugs_006",
    "name": "Omeprazole 20mg Capsules",
    "description": "Proton pump inhibitor",
    "price": 2800,
    "category": "prescription-drugs",
    "subcategory": "Gastric Care",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/prescription_drugs/omeprazole_20mg_capsules.jpg",
    "inStock": true,
    "stockQuantity": 41,
    "barcode": "335057930130",
    "prescriptionRequired": true,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "capsule",
    "tags": [
      "prescription drugs"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.818262"
  },
  {
    "id": "enhanced_prescription-drugs_007",
    "name": "Atenolol 50mg Tablets",
    "description": "Beta-blocker for hypertension",
    "price": 2200,
    "category": "prescription-drugs",
    "subcategory": "Cardiovascular",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/prescription_drugs/atenolol_50mg_tablets.jpg",
    "inStock": true,
    "stockQuantity": 34,
    "barcode": "785061463531",
    "prescriptionRequired": true,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "tablet",
    "tags": [
      "prescription drugs"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.818500"
  },
  {
    "id": "enhanced_prescription-drugs_008",
    "name": "Metformin 500mg Tablets",
    "description": "Diabetes medication",
    "price": 1900,
    "category": "prescription-drugs",
    "subcategory": "General Prescription",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/prescription_drugs/metformin_500mg_tablets.jpg",
    "inStock": true,
    "stockQuantity": 51,
    "barcode": "549144964546",
    "prescriptionRequired": true,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "tablet",
    "tags": [
      "prescription drugs"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.818588"
  },
  {
    "id": "enhanced_otc-medications_009",
    "name": "Paracetamol 500mg Tablets",
    "description": "Pain relief and fever reducer",
    "price": 600,
    "category": "otc-medications",
    "subcategory": "Pain Relief",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/otc_medications/paracetamol_500mg_tablets.jpg",
    "inStock": true,
    "stockQuantity": 22,
    "barcode": "180879305286",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [
      "Paracetamol"
    ],
    "dosageForm": "tablet",
    "tags": [
      "otc medications"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.818656"
  },
  {
    "id": "enhanced_otc-medications_010",
    "name": "Panadol Extra Tablets",
    "description": "Enhanced pain relief formula",
    "price": 900,
    "category": "otc-medications",
    "subcategory": "General OTC",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/otc_medications/panadol_extra_tablets.jpg",
    "inStock": true,
    "stockQuantity": 80,
    "barcode": "803083267862",
    "prescriptionRequired": false,
    "manufacturer": "GlaxoSmithKline",
    "activeIngredients": [],
    "dosageForm": "tablet",
    "tags": [
      "otc medications"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.818718"
  },
  {
    "id": "enhanced_otc-medications_011",
    "name": "Ibuprofen 400mg Tablets",
    "description": "Anti-inflammatory pain reliever",
    "price": 800,
    "category": "otc-medications",
    "subcategory": "Pain Relief",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/otc_medications/ibuprofen_400mg_tablets.jpg",
    "inStock": true,
    "stockQuantity": 21,
    "barcode": "441886610654",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [
      "Ibuprofen"
    ],
    "dosageForm": "tablet",
    "tags": [
      "otc medications"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.818780"
  },
  {
    "id": "enhanced_otc-medications_012",
    "name": "Boska Pain Relief Tablets",
    "description": "Nigerian pain relief brand",
    "price": 500,
    "category": "otc-medications",
    "subcategory": "Pain Relief",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/otc_medications/boska_pain_relief_tablets.jpg",
    "inStock": true,
    "stockQuantity": 35,
    "barcode": "588201931450",
    "prescriptionRequired": false,
    "manufacturer": "Boska Pharmaceuticals",
    "activeIngredients": [],
    "dosageForm": "tablet",
    "tags": [
      "otc medications",
      "pain relief"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.818846"
  },
  {
    "id": "enhanced_otc-medications_013",
    "name": "Alabukun Powder",
    "description": "Traditional Nigerian analgesic",
    "price": 300,
    "category": "otc-medications",
    "subcategory": "General OTC",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/otc_medications/alabukun_powder.jpg",
    "inStock": true,
    "stockQuantity": 26,
    "barcode": "432348198094",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "powder",
    "tags": [
      "otc medications"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.818908"
  },
  {
    "id": "enhanced_otc-medications_014",
    "name": "Benylin Cough Syrup 100ml",
    "description": "Cough and cold relief",
    "price": 1200,
    "category": "otc-medications",
    "subcategory": "Cold & Flu",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/otc_medications/benylin_cough_syrup_100ml.jpg",
    "inStock": true,
    "stockQuantity": 69,
    "barcode": "523864321222",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "liquid",
    "tags": [
      "otc medications"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.818966"
  },
  {
    "id": "enhanced_otc-medications_015",
    "name": "ORS Oral Rehydration Salt",
    "description": "Electrolyte replacement",
    "price": 200,
    "category": "otc-medications",
    "subcategory": "General OTC",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/otc_medications/ors_oral_rehydration_salt.jpg",
    "inStock": true,
    "stockQuantity": 31,
    "barcode": "994692096926",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "otc medications"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819028"
  },
  {
    "id": "enhanced_otc-medications_016",
    "name": "Antacid Tablets",
    "description": "Stomach acid neutralizer",
    "price": 450,
    "category": "otc-medications",
    "subcategory": "Digestive Health",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/otc_medications/antacid_tablets.jpg",
    "inStock": true,
    "stockQuantity": 35,
    "barcode": "386074228288",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "tablet",
    "tags": [
      "otc medications"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819084"
  },
  {
    "id": "enhanced_supplements_017",
    "name": "Vitamin C 1000mg Tablets",
    "description": "Immune system support",
    "price": 2500,
    "category": "supplements",
    "subcategory": "Vitamins",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/supplements/vitamin_c_1000mg_tablets.jpg",
    "inStock": true,
    "stockQuantity": 76,
    "barcode": "884886006883",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [
      "Ascorbic Acid"
    ],
    "dosageForm": "tablet",
    "tags": [
      "supplements",
      "supplement"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819140"
  },
  {
    "id": "enhanced_supplements_018",
    "name": "Centrum Multivitamin",
    "description": "Complete daily nutrition",
    "price": 4000,
    "category": "supplements",
    "subcategory": "Vitamins",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/supplements/centrum_multivitamin.jpg",
    "inStock": true,
    "stockQuantity": 26,
    "barcode": "263047376414",
    "prescriptionRequired": false,
    "manufacturer": "Pfizer Consumer Healthcare",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "supplements",
      "supplement"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819198"
  },
  {
    "id": "enhanced_supplements_019",
    "name": "Calcium Vitamin D3 Tablets",
    "description": "Bone health support",
    "price": 3200,
    "category": "supplements",
    "subcategory": "Vitamins",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/supplements/calcium_vitamin_d3_tablets.jpg",
    "inStock": true,
    "stockQuantity": 64,
    "barcode": "984167062128",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [
      "Calcium Carbonate"
    ],
    "dosageForm": "tablet",
    "tags": [
      "supplements",
      "supplement"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819255"
  },
  {
    "id": "enhanced_supplements_020",
    "name": "Iron Folic Acid Tablets",
    "description": "Anemia prevention",
    "price": 1800,
    "category": "supplements",
    "subcategory": "Minerals",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/supplements/iron_folic_acid_tablets.jpg",
    "inStock": true,
    "stockQuantity": 52,
    "barcode": "729785309248",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [
      "Ferrous Sulfate"
    ],
    "dosageForm": "tablet",
    "tags": [
      "supplements"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819315"
  },
  {
    "id": "enhanced_supplements_021",
    "name": "Cod Liver Oil Capsules",
    "description": "Omega-3 and vitamins",
    "price": 3500,
    "category": "supplements",
    "subcategory": "General Supplements",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/supplements/cod_liver_oil_capsules.jpg",
    "inStock": true,
    "stockQuantity": 31,
    "barcode": "174976341698",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "capsule",
    "tags": [
      "supplements"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819376"
  },
  {
    "id": "enhanced_supplements_022",
    "name": "Zinc Tablets 50mg",
    "description": "Immune and wound healing",
    "price": 2000,
    "category": "supplements",
    "subcategory": "General Supplements",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/supplements/zinc_tablets_50mg.jpg",
    "inStock": true,
    "stockQuantity": 30,
    "barcode": "267802283000",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "tablet",
    "tags": [
      "supplements"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819438"
  },
  {
    "id": "enhanced_supplements_023",
    "name": "Vitamin B Complex",
    "description": "Energy and nervous system",
    "price": 2200,
    "category": "supplements",
    "subcategory": "Vitamins",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/supplements/vitamin_b_complex.jpg",
    "inStock": true,
    "stockQuantity": 39,
    "barcode": "603249144979",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "supplements",
      "supplement"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819498"
  },
  {
    "id": "enhanced_supplements_024",
    "name": "Magnesium Supplements",
    "description": "Muscle and nerve function",
    "price": 2800,
    "category": "supplements",
    "subcategory": "General Supplements",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/supplements/magnesium_supplements.jpg",
    "inStock": true,
    "stockQuantity": 73,
    "barcode": "730046337900",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "supplements"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819563"
  },
  {
    "id": "enhanced_beverages_025",
    "name": "Coca Cola 35cl",
    "description": "Classic soft drink",
    "price": 200,
    "category": "beverages",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/beverages/coca_cola_35cl.jpg",
    "inStock": true,
    "stockQuantity": 65,
    "barcode": "445988736475",
    "prescriptionRequired": false,
    "manufacturer": "Coca-Cola Company",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "beverages"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819622"
  },
  {
    "id": "enhanced_beverages_026",
    "name": "Sprite 50cl",
    "description": "Lemon-lime soda",
    "price": 250,
    "category": "beverages",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/beverages/sprite_50cl.jpg",
    "inStock": true,
    "stockQuantity": 16,
    "barcode": "990988155982",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "beverages"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819676"
  },
  {
    "id": "enhanced_beverages_027",
    "name": "Fanta Orange 35cl",
    "description": "Orange flavored drink",
    "price": 200,
    "category": "beverages",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/beverages/fanta_orange_35cl.jpg",
    "inStock": true,
    "stockQuantity": 48,
    "barcode": "614651810370",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "beverages"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819746"
  },
  {
    "id": "enhanced_beverages_028",
    "name": "Eva Water 75cl",
    "description": "Pure drinking water",
    "price": 150,
    "category": "beverages",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/beverages/eva_water_75cl.jpg",
    "inStock": true,
    "stockQuantity": 18,
    "barcode": "641606018424",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "beverages"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819812"
  },
  {
    "id": "enhanced_beverages_029",
    "name": "Chi Exotic Juice 1L",
    "description": "Fruit juice blend",
    "price": 400,
    "category": "beverages",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/beverages/chi_exotic_juice_1l.jpg",
    "inStock": true,
    "stockQuantity": 72,
    "barcode": "647120511538",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "beverages"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819873"
  },
  {
    "id": "enhanced_beverages_030",
    "name": "Hollandia Yoghurt",
    "description": "Probiotic dairy drink",
    "price": 500,
    "category": "beverages",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/beverages/hollandia_yoghurt.jpg",
    "inStock": true,
    "stockQuantity": 20,
    "barcode": "839578680158",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "beverages"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819931"
  },
  {
    "id": "enhanced_beverages_031",
    "name": "Pepsi 50cl",
    "description": "Cola soft drink",
    "price": 250,
    "category": "beverages",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/beverages/pepsi_50cl.jpg",
    "inStock": true,
    "stockQuantity": 43,
    "barcode": "998515482511",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "beverages"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.819987"
  },
  {
    "id": "enhanced_beverages_032",
    "name": "7UP 35cl",
    "description": "Lemon lime drink",
    "price": 200,
    "category": "beverages",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/beverages/7up_35cl.jpg",
    "inStock": true,
    "stockQuantity": 31,
    "barcode": "415997288289",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "beverages"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820034"
  },
  {
    "id": "enhanced_snacks_033",
    "name": "Digestive Biscuits",
    "description": "Healthy wholemeal biscuits",
    "price": 800,
    "category": "snacks",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/snacks/digestive_biscuits.jpg",
    "inStock": true,
    "stockQuantity": 41,
    "barcode": "420706839239",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "snacks"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820107"
  },
  {
    "id": "enhanced_snacks_034",
    "name": "Pringles Original 165g",
    "description": "Potato crisps",
    "price": 1200,
    "category": "snacks",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/snacks/pringles_original_165g.jpg",
    "inStock": true,
    "stockQuantity": 51,
    "barcode": "927315429824",
    "prescriptionRequired": false,
    "manufacturer": "Kellogg Company",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "snacks"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820161"
  },
  {
    "id": "enhanced_snacks_035",
    "name": "Gala Sausage Roll",
    "description": "Meat pastry snack",
    "price": 300,
    "category": "snacks",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/snacks/gala_sausage_roll.jpg",
    "inStock": true,
    "stockQuantity": 43,
    "barcode": "821218752489",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "snacks"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820214"
  },
  {
    "id": "enhanced_snacks_036",
    "name": "Plantain Chips 100g",
    "description": "Crunchy fried plantain",
    "price": 500,
    "category": "snacks",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/snacks/plantain_chips_100g.jpg",
    "inStock": true,
    "stockQuantity": 21,
    "barcode": "101422550543",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "snacks"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820270"
  },
  {
    "id": "enhanced_snacks_037",
    "name": "Groundnut 100g",
    "description": "Roasted peanuts",
    "price": 300,
    "category": "snacks",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/snacks/groundnut_100g.jpg",
    "inStock": true,
    "stockQuantity": 48,
    "barcode": "963706695145",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "snacks"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820323"
  },
  {
    "id": "enhanced_snacks_038",
    "name": "Cabin Biscuits",
    "description": "Classic cream crackers",
    "price": 400,
    "category": "snacks",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/snacks/cabin_biscuits.jpg",
    "inStock": true,
    "stockQuantity": 16,
    "barcode": "619182837127",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "snacks"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820375"
  },
  {
    "id": "enhanced_snacks_039",
    "name": "Shortbread Biscuits",
    "description": "Buttery Scottish biscuits",
    "price": 700,
    "category": "snacks",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/snacks/shortbread_biscuits.jpg",
    "inStock": true,
    "stockQuantity": 23,
    "barcode": "882445328646",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "snacks"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820429"
  },
  {
    "id": "enhanced_snacks_040",
    "name": "Meat Pie",
    "description": "Savory pastry with meat filling",
    "price": 400,
    "category": "snacks",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/snacks/meat_pie.jpg",
    "inStock": true,
    "stockQuantity": 36,
    "barcode": "260157455365",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "snacks"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820480"
  },
  {
    "id": "enhanced_personal-care_041",
    "name": "Dettol Antiseptic 250ml",
    "description": "Wound cleaning antiseptic",
    "price": 1500,
    "category": "personal-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/personal_care/dettol_antiseptic_250ml.jpg",
    "inStock": true,
    "stockQuantity": 62,
    "barcode": "583711117281",
    "prescriptionRequired": false,
    "manufacturer": "Reckitt Benckiser",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "personal care",
      "first aid"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820540"
  },
  {
    "id": "enhanced_personal-care_042",
    "name": "Savlon Antiseptic Cream",
    "description": "First aid antiseptic",
    "price": 1000,
    "category": "personal-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/personal_care/savlon_antiseptic_cream.jpg",
    "inStock": true,
    "stockQuantity": 76,
    "barcode": "176071263949",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "cream",
    "tags": [
      "personal care",
      "first aid"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820598"
  },
  {
    "id": "enhanced_baby-care_043",
    "name": "Johnson Baby Oil 300ml",
    "description": "Gentle moisturizing oil",
    "price": 1200,
    "category": "baby-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/baby_care/johnson_baby_oil_300ml.jpg",
    "inStock": true,
    "stockQuantity": 43,
    "barcode": "279213591794",
    "prescriptionRequired": false,
    "manufacturer": "Johnson & Johnson",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "baby care",
      "infant care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820650"
  },
  {
    "id": "enhanced_personal-care_044",
    "name": "Vaseline Petroleum Jelly",
    "description": "Skin protection and healing",
    "price": 800,
    "category": "personal-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/personal_care/vaseline_petroleum_jelly.jpg",
    "inStock": true,
    "stockQuantity": 30,
    "barcode": "687612285819",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "personal care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820707"
  },
  {
    "id": "enhanced_personal-care_045",
    "name": "Cotton Wool 50g",
    "description": "Medical grade cotton",
    "price": 400,
    "category": "personal-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/personal_care/cotton_wool_50g.jpg",
    "inStock": true,
    "stockQuantity": 51,
    "barcode": "628368990538",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "personal care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820755"
  },
  {
    "id": "enhanced_personal-care_046",
    "name": "Bandage Roll 5cm",
    "description": "First aid bandaging",
    "price": 300,
    "category": "personal-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/personal_care/bandage_roll_5cm.jpg",
    "inStock": true,
    "stockQuantity": 64,
    "barcode": "267311442619",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "personal care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820803"
  },
  {
    "id": "enhanced_personal-care_047",
    "name": "Hand Sanitizer 100ml",
    "description": "Alcohol-based hand cleaner",
    "price": 600,
    "category": "personal-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/personal_care/hand_sanitizer_100ml.jpg",
    "inStock": true,
    "stockQuantity": 71,
    "barcode": "880538762354",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "personal care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820857"
  },
  {
    "id": "enhanced_personal-care_048",
    "name": "Hydrogen Peroxide 100ml",
    "description": "Antiseptic solution",
    "price": 500,
    "category": "personal-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/personal_care/hydrogen_peroxide_100ml.jpg",
    "inStock": true,
    "stockQuantity": 43,
    "barcode": "753638455930",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "personal care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820910"
  },
  {
    "id": "enhanced_household_049",
    "name": "Dettol Disinfectant 500ml",
    "description": "Surface disinfectant",
    "price": 2000,
    "category": "household",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/household/dettol_disinfectant_500ml.jpg",
    "inStock": true,
    "stockQuantity": 68,
    "barcode": "712086331201",
    "prescriptionRequired": false,
    "manufacturer": "Reckitt Benckiser",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "household"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.820964"
  },
  {
    "id": "enhanced_household_050",
    "name": "Toilet Paper 4-pack",
    "description": "Soft tissue paper",
    "price": 1200,
    "category": "household",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/household/toilet_paper_4-pack.jpg",
    "inStock": true,
    "stockQuantity": 77,
    "barcode": "529882016153",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "household"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821013"
  },
  {
    "id": "enhanced_household_051",
    "name": "Omo Detergent 500g",
    "description": "Laundry washing powder",
    "price": 1500,
    "category": "household",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/household/omo_detergent_500g.jpg",
    "inStock": true,
    "stockQuantity": 16,
    "barcode": "615461669572",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "household"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821062"
  },
  {
    "id": "enhanced_household_052",
    "name": "Baygon Insecticide Spray",
    "description": "Insect killer spray",
    "price": 1800,
    "category": "household",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/household/baygon_insecticide_spray.jpg",
    "inStock": true,
    "stockQuantity": 72,
    "barcode": "285775278533",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "household"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821115"
  },
  {
    "id": "enhanced_household_053",
    "name": "Air Freshener Spray",
    "description": "Room fragrance spray",
    "price": 800,
    "category": "household",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/household/air_freshener_spray.jpg",
    "inStock": true,
    "stockQuantity": 18,
    "barcode": "928357786786",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "household"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821165"
  },
  {
    "id": "enhanced_household_054",
    "name": "Duracell Batteries AA",
    "description": "Long-lasting batteries",
    "price": 600,
    "category": "household",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/household/duracell_batteries_aa.jpg",
    "inStock": true,
    "stockQuantity": 48,
    "barcode": "546582202774",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "household"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821221"
  },
  {
    "id": "enhanced_household_055",
    "name": "Rose Tissue Paper",
    "description": "Facial tissue",
    "price": 400,
    "category": "household",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/household/rose_tissue_paper.jpg",
    "inStock": true,
    "stockQuantity": 78,
    "barcode": "819495978152",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "household"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821269"
  },
  {
    "id": "enhanced_household_056",
    "name": "Candles Pack of 6",
    "description": "Emergency lighting",
    "price": 300,
    "category": "household",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/household/candles_pack_of_6.jpg",
    "inStock": true,
    "stockQuantity": 78,
    "barcode": "977829574431",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "household"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821317"
  },
  {
    "id": "enhanced_baby-care_057",
    "name": "Pampers Baby Dry Size 3",
    "description": "Disposable diapers",
    "price": 4500,
    "category": "baby-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/baby_care/pampers_baby_dry_size_3.jpg",
    "inStock": true,
    "stockQuantity": 70,
    "barcode": "458957854978",
    "prescriptionRequired": false,
    "manufacturer": "Procter & Gamble",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "baby care",
      "infant care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821368"
  },
  {
    "id": "enhanced_baby-care_058",
    "name": "SMA Baby Formula 400g",
    "description": "Infant milk formula",
    "price": 5500,
    "category": "baby-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/baby_care/sma_baby_formula_400g.jpg",
    "inStock": true,
    "stockQuantity": 21,
    "barcode": "185126006168",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "baby care",
      "infant care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821418"
  },
  {
    "id": "enhanced_baby-care_059",
    "name": "Johnson Baby Shampoo",
    "description": "No tears baby shampoo",
    "price": 1500,
    "category": "baby-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/baby_care/johnson_baby_shampoo.jpg",
    "inStock": true,
    "stockQuantity": 78,
    "barcode": "344366473665",
    "prescriptionRequired": false,
    "manufacturer": "Johnson & Johnson",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "baby care",
      "infant care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821467"
  },
  {
    "id": "enhanced_baby-care_060",
    "name": "Baby Wipes 80-pack",
    "description": "Gentle cleansing wipes",
    "price": 1200,
    "category": "baby-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/baby_care/baby_wipes_80-pack.jpg",
    "inStock": true,
    "stockQuantity": 59,
    "barcode": "358508703398",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "baby care",
      "infant care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821517"
  },
  {
    "id": "enhanced_baby-care_061",
    "name": "Cerelac Baby Food 400g",
    "description": "Nutritious baby cereal",
    "price": 2200,
    "category": "baby-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/baby_care/cerelac_baby_food_400g.jpg",
    "inStock": true,
    "stockQuantity": 34,
    "barcode": "365149305966",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "baby care",
      "infant care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821570"
  },
  {
    "id": "enhanced_baby-care_062",
    "name": "Feeding Bottle 250ml",
    "description": "BPA-free baby bottle",
    "price": 2000,
    "category": "baby-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/baby_care/feeding_bottle_250ml.jpg",
    "inStock": true,
    "stockQuantity": 64,
    "barcode": "590682564123",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "baby care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821619"
  },
  {
    "id": "enhanced_baby-care_063",
    "name": "Baby Powder 200g",
    "description": "Talcum powder for babies",
    "price": 1300,
    "category": "baby-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/baby_care/baby_powder_200g.jpg",
    "inStock": true,
    "stockQuantity": 29,
    "barcode": "930906112158",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "powder",
    "tags": [
      "baby care",
      "infant care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821667"
  },
  {
    "id": "enhanced_baby-care_064",
    "name": "Pacifier Size 1",
    "description": "Baby soother",
    "price": 800,
    "category": "baby-care",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/baby_care/pacifier_size_1.jpg",
    "inStock": true,
    "stockQuantity": 51,
    "barcode": "119365005040",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "baby care"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821709"
  },
  {
    "id": "enhanced_herbal-natural_065",
    "name": "Moringa Powder 100g",
    "description": "Organic superfood powder",
    "price": 2500,
    "category": "herbal-natural",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/herbal_natural/moringa_powder_100g.jpg",
    "inStock": true,
    "stockQuantity": 38,
    "barcode": "704314846301",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "powder",
    "tags": [
      "herbal natural"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821758"
  },
  {
    "id": "enhanced_herbal-natural_066",
    "name": "Ginger Honey Tea",
    "description": "Natural immune booster",
    "price": 1500,
    "category": "herbal-natural",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/herbal_natural/ginger_honey_tea.jpg",
    "inStock": true,
    "stockQuantity": 65,
    "barcode": "601094199317",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "herbal natural"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821816"
  },
  {
    "id": "enhanced_supplements_067",
    "name": "Turmeric Capsules",
    "description": "Anti-inflammatory supplement",
    "price": 3000,
    "category": "supplements",
    "subcategory": "General Supplements",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/supplements/turmeric_capsules.jpg",
    "inStock": true,
    "stockQuantity": 46,
    "barcode": "481668754618",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "capsule",
    "tags": [
      "supplements"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821867"
  },
  {
    "id": "enhanced_herbal-natural_068",
    "name": "Black Seed Oil 100ml",
    "description": "Traditional healing oil",
    "price": 2800,
    "category": "herbal-natural",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/herbal_natural/black_seed_oil_100ml.jpg",
    "inStock": true,
    "stockQuantity": 50,
    "barcode": "844089063270",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "herbal natural"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821917"
  },
  {
    "id": "enhanced_herbal-natural_069",
    "name": "Pure Honey 500g",
    "description": "Raw unprocessed honey",
    "price": 3500,
    "category": "herbal-natural",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/herbal_natural/pure_honey_500g.jpg",
    "inStock": true,
    "stockQuantity": 23,
    "barcode": "366681788126",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "herbal natural"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.821963"
  },
  {
    "id": "enhanced_herbal-natural_070",
    "name": "Garlic Supplement",
    "description": "Natural cardiovascular support",
    "price": 2200,
    "category": "herbal-natural",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/herbal_natural/garlic_supplement.jpg",
    "inStock": true,
    "stockQuantity": 74,
    "barcode": "764648623309",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "herbal natural"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.822015"
  },
  {
    "id": "enhanced_fitness-wellness_071",
    "name": "Whey Protein Powder 1kg",
    "description": "Muscle building supplement",
    "price": 8500,
    "category": "fitness-wellness",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/fitness_wellness/whey_protein_powder_1kg.jpg",
    "inStock": true,
    "stockQuantity": 37,
    "barcode": "903020234552",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "powder",
    "tags": [
      "fitness wellness"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.822068"
  },
  {
    "id": "enhanced_fitness-wellness_072",
    "name": "Creatine Monohydrate",
    "description": "Performance enhancement",
    "price": 6500,
    "category": "fitness-wellness",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/fitness_wellness/creatine_monohydrate.jpg",
    "inStock": true,
    "stockQuantity": 48,
    "barcode": "116300179537",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "fitness wellness"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.822127"
  },
  {
    "id": "enhanced_fitness-wellness_073",
    "name": "BCAA Amino Acids",
    "description": "Workout recovery supplement",
    "price": 7200,
    "category": "fitness-wellness",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/fitness_wellness/bcaa_amino_acids.jpg",
    "inStock": true,
    "stockQuantity": 25,
    "barcode": "856859931897",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "fitness wellness"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.822180"
  },
  {
    "id": "enhanced_fitness-wellness_074",
    "name": "Fat Burner Capsules",
    "description": "Weight management support",
    "price": 5500,
    "category": "fitness-wellness",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/fitness_wellness/fat_burner_capsules.jpg",
    "inStock": true,
    "stockQuantity": 56,
    "barcode": "237554168264",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "capsule",
    "tags": [
      "fitness wellness"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.822229"
  },
  {
    "id": "enhanced_beverages_075",
    "name": "Pre-workout Energy Drink",
    "description": "Exercise performance booster",
    "price": 4500,
    "category": "beverages",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/beverages/pre-workout_energy_drink.jpg",
    "inStock": true,
    "stockQuantity": 40,
    "barcode": "795902085810",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "other",
    "tags": [
      "beverages"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.822287"
  },
  {
    "id": "enhanced_fitness-wellness_076",
    "name": "Mass Gainer Powder",
    "description": "Weight gain supplement",
    "price": 9200,
    "category": "fitness-wellness",
    "subcategory": "General",
    "brand": "Kunle Ara Pharmacy",
    "image": "/images/fitness_wellness/mass_gainer_powder.jpg",
    "inStock": true,
    "stockQuantity": 55,
    "barcode": "336055746356",
    "prescriptionRequired": false,
    "manufacturer": "Various",
    "activeIngredients": [],
    "dosageForm": "powder",
    "tags": [
      "fitness wellness"
    ],
    "source": "Enhanced Fallback Products",
    "scraped_at": "2026-01-09T01:50:33.822337"
  }
]

// Export by category for easy filtering
export const getProductsByCategory = (category: string) => {
  if (category === 'all') return allProducts
  return allProducts.filter(product => product.category === category)
}

// Search function
export const searchProducts = (query: string) => {
  const lowerQuery = query.toLowerCase()
  return allProducts.filter(product => 
    product.name.toLowerCase().includes(lowerQuery) ||
    product.description.toLowerCase().includes(lowerQuery) ||
    (product.tags && product.tags.some(tag => tag.toLowerCase().includes(lowerQuery)))
  )
}

// Category statistics
export const categoryStats = () => {
  const stats = {}
  allProducts.forEach(product => {
    stats[product.category] = (stats[product.category] || 0) + 1
  })
  return stats
}

// Product metadata
export const productMetadata = {
  totalProducts: 76,
  sources: ["Kunle Ara Scraped: 76 products"],
  categories: Object.keys(categoryStats()),
  lastUpdated: '2026-01-12T11:03:53.263710'
}
