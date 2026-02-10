-- Enhanced Kunle Ara Pharmacy Database Schema
-- Optimized for 434 products across 3 branches

-- Branches table
CREATE TABLE branches (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  code VARCHAR(10) NOT NULL, -- UCH, YEM, RRD
  address TEXT,
  phone VARCHAR(20),
  manager_id INTEGER,
  created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO branches (name, code, address) VALUES 
('UCH Branch', 'UCH', 'University College Hospital Area, Ibadan'),
('Yemetu Branch', 'YEM', 'Yemetu Area, Ibadan'),  
('Ring Road Branch', 'RRD', 'Ring Road Area, Ibadan');

-- Enhanced products table for 434 products
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  sku VARCHAR(50) UNIQUE NOT NULL,
  name VARCHAR(500) NOT NULL, -- Increased for long product names
  description TEXT,
  price DECIMAL(12,2) NOT NULL, -- Support up to 999,999.99
  cost_price DECIMAL(12,2), -- For profit calculations
  category VARCHAR(100) DEFAULT 'General Medicine',
  subcategory VARCHAR(100),
  brand VARCHAR(100),
  is_prescription BOOLEAN DEFAULT false,
  is_controlled BOOLEAN DEFAULT false, -- Controlled substances
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Branch-specific inventory (each product at each branch)
CREATE TABLE branch_inventory (
  id SERIAL PRIMARY KEY,
  product_id INTEGER REFERENCES products(id),
  branch_id INTEGER REFERENCES branches(id),
  stock_quantity INTEGER DEFAULT 0,
  min_stock_level INTEGER DEFAULT 5, -- Reorder level
  max_stock_level INTEGER DEFAULT 100,
  location VARCHAR(50), -- Shop floor, back room, warehouse
  last_updated TIMESTAMP DEFAULT NOW(),
  UNIQUE(product_id, branch_id)
);

-- Orders table (POS + Online)
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  order_number VARCHAR(50) UNIQUE NOT NULL,
  branch_id INTEGER REFERENCES branches(id),
  staff_id INTEGER REFERENCES staff(id),
  customer_name VARCHAR(255),
  customer_phone VARCHAR(20),
  order_type VARCHAR(20) NOT NULL, -- 'pos', 'online_pickup', 'online_delivery'
  total_amount DECIMAL(12,2) NOT NULL,
  status VARCHAR(20) DEFAULT 'pending',
  
  -- Timing fields for SLA tracking
  order_created_at TIMESTAMP DEFAULT NOW(),
  payment_confirmed_at TIMESTAMP,
  dispenser_assigned_at TIMESTAMP,
  receipt_handed_at TIMESTAMP,
  order_dispatched_at TIMESTAMP,
  
  -- Calculated fields
  total_processing_seconds INTEGER,
  sla_met BOOLEAN, -- 5-minute pickup SLA
  
  created_at TIMESTAMP DEFAULT NOW()
);

-- Staff performance with commission tracking
CREATE TABLE staff_performance (
  id SERIAL PRIMARY KEY,
  staff_id INTEGER REFERENCES staff(id),
  branch_id INTEGER REFERENCES branches(id),
  performance_date DATE DEFAULT CURRENT_DATE,
  
  -- Daily metrics
  orders_completed INTEGER DEFAULT 0,
  consultations_given INTEGER DEFAULT 0,
  total_sales_amount DECIMAL(12,2) DEFAULT 0,
  avg_processing_time_seconds INTEGER,
  sla_compliance_rate DECIMAL(5,2), -- Percentage
  
  -- Commission calculation
  base_commission DECIMAL(10,2) DEFAULT 0,
  speed_bonus DECIMAL(10,2) DEFAULT 0,
  consultation_bonus DECIMAL(10,2) DEFAULT 0,
  sla_penalty DECIMAL(10,2) DEFAULT 0,
  total_commission DECIMAL(10,2) DEFAULT 0,
  
  created_at TIMESTAMP DEFAULT NOW()
);
