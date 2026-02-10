# Fixed Duplicate Product Checker for Kunle Ara Pharmacy
# Checks for duplicate products and provides summary

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "   KUNLE ARA PHARMACY - DUPLICATE PRODUCT CHECKER" -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan

# Function to check if file exists
function Test-FileExists {
    param($FilePath)
    if (Test-Path $FilePath) {
        Write-Host "Found: $FilePath" -ForegroundColor Green
        return $true
    } else {
        Write-Host "Missing: $FilePath" -ForegroundColor Red
        return $false
    }
}

# Check for product files
Write-Host "`n📁 CHECKING PRODUCT FILES..." -ForegroundColor Yellow

$files = @(
    "app\data\products.ts",
    "app\data\kunle_ara_products.ts", 
    "data\kunle_ara_products.json"
)

$filesFound = 0
foreach ($file in $files) {
    if (Test-FileExists $file) {
        $filesFound++
    }
}

Write-Host "`nFiles found: $filesFound/$($files.Count)" -ForegroundColor Cyan

# If no product files found, show help
if ($filesFound -eq 0) {
    Write-Host "`n❌ NO PRODUCT FILES FOUND!" -ForegroundColor Red
    Write-Host "Run the scraper first:" -ForegroundColor Yellow
    Write-Host "  cd ..\kunle_ara_scraper" -ForegroundColor White
    Write-Host "  python scraper\enhanced_kunle_ara_scraper_fixed.py" -ForegroundColor White
    exit 1
}

# Try to analyze products from JSON file
if (Test-Path "data\kunle_ara_products.json") {
    Write-Host "`n📊 ANALYZING PRODUCTS..." -ForegroundColor Yellow
    
    try {
        $jsonContent = Get-Content "data\kunle_ara_products.json" -Raw -Encoding UTF8
        $products = $jsonContent | ConvertFrom-Json
        
        Write-Host "✅ Successfully loaded $($products.Count) products" -ForegroundColor Green
        
        # Check for duplicates by name
        Write-Host "`n🔍 CHECKING FOR DUPLICATES..." -ForegroundColor Yellow
        
        $duplicates = $products | Group-Object -Property name | Where-Object { $_.Count -gt 1 }
        
        if ($duplicates.Count -eq 0) {
            Write-Host "✅ No duplicate products found!" -ForegroundColor Green
        } else {
            Write-Host "⚠️  Found $($duplicates.Count) duplicate product groups:" -ForegroundColor Yellow
            
            foreach ($duplicate in $duplicates) {
                Write-Host "  - $($duplicate.Name): $($duplicate.Count) copies" -ForegroundColor Red
            }
        }
        
        # Category breakdown
        Write-Host "`n📦 CATEGORY BREAKDOWN:" -ForegroundColor Yellow
        
        $categoryGroups = $products | Group-Object -Property category | Sort-Object Name
        
        foreach ($group in $categoryGroups) {
            $categoryName = $group.Name
            $count = $group.Count
            Write-Host "  $categoryName`: $count products" -ForegroundColor Cyan
        }
        
        # Price analysis
        Write-Host "`n💰 PRICE ANALYSIS:" -ForegroundColor Yellow
        
        $prices = $products | Where-Object { $_.price -gt 0 } | Select-Object -ExpandProperty price
        
        if ($prices.Count -gt 0) {
            $minPrice = ($prices | Measure-Object -Minimum).Minimum
            $maxPrice = ($prices | Measure-Object -Maximum).Maximum  
            $avgPrice = ($prices | Measure-Object -Average).Average
            
            Write-Host "  Min Price: NGN $minPrice" -ForegroundColor White
            Write-Host "  Max Price: NGN $maxPrice" -ForegroundColor White
            Write-Host "  Avg Price: NGN $([math]::Round($avgPrice, 2))" -ForegroundColor White
        }
        
        # Show sample products
        Write-Host "`n📋 SAMPLE PRODUCTS:" -ForegroundColor Yellow
        
        $products | Select-Object -First 5 | ForEach-Object {
            Write-Host "  - $($_.name)" -ForegroundColor White
            Write-Host "    Category: $($_.category)" -ForegroundColor Gray
            Write-Host "    Price: NGN $($_.price)" -ForegroundColor Gray
            Write-Host "" 
        }
        
        # Integration status
        Write-Host "`n🎯 INTEGRATION STATUS:" -ForegroundColor Yellow
        
        if (Test-Path "app\data\kunle_ara_products.ts") {
            Write-Host "✅ Products ready for Next.js integration" -ForegroundColor Green
        } else {
            Write-Host "⚠️  Copy products to Next.js:" -ForegroundColor Yellow
            Write-Host "  copy data\kunle_ara_products.ts app\data\" -ForegroundColor White
        }
        
    } catch {
        Write-Host "❌ Error reading product data: $($_.Exception.Message)" -ForegroundColor Red
    }
    
} else {
    Write-Host "`n⚠️  JSON product file not found. Checking TypeScript files..." -ForegroundColor Yellow
    
    if (Test-Path "app\data\kunle_ara_products.ts") {
        Write-Host "✅ TypeScript product file exists" -ForegroundColor Green
        
        # Count products in TypeScript file
        $tsContent = Get-Content "app\data\kunle_ara_products.ts" -Raw
        
        if ($tsContent -match "export const kunleAraProducts.*=\s*$$(.*)$$") {
            $productCount = ([regex]::Matches($tsContent, '\{\s*[''"]id[''"]')).Count
            Write-Host "📊 Estimated products in TS file: $productCount" -ForegroundColor Cyan
        }
    }
}

Write-Host "`n=====================================================" -ForegroundColor Cyan
Write-Host "✅ ANALYSIS COMPLETE!" -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Cyan
