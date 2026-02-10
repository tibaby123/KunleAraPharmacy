-- Insert 434 products into products table

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-KUN-0001',
    'KunleAra Pharmacy',
    'KunleAra Pharmacy - Available at Kunle Ara Pharmacy',
    1208.0,
    'General Medicine',
    False,
    'KunleAra'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KUN-0001'),
    1,
    50,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KUN-0001'),
    2,
    50,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KUN-0001'),
    3,
    50,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-AXC-0002',
    'AXCEL CETIRIZINE SYRUP CETRIZINE 5MG/5ML 60ML X BOTTLE',
    'AXCEL CETIRIZINE SYRUP CETRIZINE 5MG/5ML 60ML X BOTTLE - Available at Kunle Ara Pharmacy',
    760.0,
    'Pharmaceuticals',
    False,
    'AXCEL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AXC-0002'),
    1,
    51,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AXC-0002'),
    2,
    51,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AXC-0002'),
    3,
    51,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GOL-0003',
    'GOLDEN GLOW VITAMIN C SHOWER BATH 1000ML',
    'GOLDEN GLOW VITAMIN C SHOWER BATH 1000ML - Available at Kunle Ara Pharmacy',
    11000.0,
    'Pharmaceuticals',
    False,
    'GOLDEN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOL-0003'),
    1,
    52,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOL-0003'),
    2,
    52,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOL-0003'),
    3,
    52,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-10M-0004',
    '10ML NEEDLE SYRINGE X PC',
    '10ML NEEDLE SYRINGE X PC - Available at Kunle Ara Pharmacy',
    60.0,
    'Pharmaceuticals',
    False,
    '10ML'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-10M-0004'),
    1,
    53,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-10M-0004'),
    2,
    53,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-10M-0004'),
    3,
    53,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-VIT-0005',
    'VIT A 10 000 IU NATURE FIELD X100 BOTTLE',
    'VIT A 10 000 IU NATURE FIELD X100 BOTTLE - Available at Kunle Ara Pharmacy',
    7970.0,
    'General Medicine',
    False,
    'VIT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIT-0005'),
    1,
    54,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIT-0005'),
    2,
    54,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIT-0005'),
    3,
    54,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-X-P-0006',
    'X-PRESSION RUWA BRAID COLOR 30',
    'X-PRESSION RUWA BRAID COLOR 30 - Available at Kunle Ara Pharmacy',
    3580.0,
    'General Medicine',
    False,
    'X-PRESSION'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-X-P-0006'),
    1,
    55,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-X-P-0006'),
    2,
    55,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-X-P-0006'),
    3,
    55,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-JER-0007',
    'JERGENS ORIGINAL SCENT CHERRY ALMOND 621ML IMPORTED',
    'JERGENS ORIGINAL SCENT CHERRY ALMOND 621ML IMPORTED - Available at Kunle Ara Pharmacy',
    16500.0,
    'Pharmaceuticals',
    False,
    'JERGENS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JER-0007'),
    1,
    56,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JER-0007'),
    2,
    56,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JER-0007'),
    3,
    56,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-IOD-0008',
    'IODINE TINCTURE 15ML SOLFAM X BOTTLE',
    'IODINE TINCTURE 15ML SOLFAM X BOTTLE - Available at Kunle Ara Pharmacy',
    300.0,
    'Pharmaceuticals',
    False,
    'IODINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-IOD-0008'),
    1,
    57,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-IOD-0008'),
    2,
    57,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-IOD-0008'),
    3,
    57,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ORI-0009',
    'ORIJIN ZERO NON -ALCOHOLIC CAN',
    'ORIJIN ZERO NON -ALCOHOLIC CAN - Available at Kunle Ara Pharmacy',
    300.0,
    'General Medicine',
    False,
    'ORIJIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ORI-0009'),
    1,
    58,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ORI-0009'),
    2,
    58,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ORI-0009'),
    3,
    58,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BET-0010',
    'BETASOL LOTION CLOBETASOL PROPIONATE 30ML',
    'BETASOL LOTION CLOBETASOL PROPIONATE 30ML - Available at Kunle Ara Pharmacy',
    750.0,
    'Pharmaceuticals',
    False,
    'BETASOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BET-0010'),
    1,
    59,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BET-0010'),
    2,
    59,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BET-0010'),
    3,
    59,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EPI-0011',
    'EPIDERM TRIPLE ACTION SKIN CREAM 30G X TUBE',
    'EPIDERM TRIPLE ACTION SKIN CREAM 30G X TUBE - Available at Kunle Ara Pharmacy',
    750.0,
    'Personal Care',
    False,
    'EPIDERM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EPI-0011'),
    1,
    60,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EPI-0011'),
    2,
    60,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EPI-0011'),
    3,
    60,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CYP-0012',
    'CYPRIVIT SYRUP 200MLS CYPROHEPTADINE ITAMIN AMINO ACID XBOTTLE',
    'CYPRIVIT SYRUP 200MLS CYPROHEPTADINE ITAMIN AMINO ACID XBOTTLE - Available at Kunle Ara Pharmacy',
    1350.0,
    'Pharmaceuticals',
    False,
    'CYPRIVIT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CYP-0012'),
    1,
    61,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CYP-0012'),
    2,
    61,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CYP-0012'),
    3,
    61,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAL-0013',
    'SALBUTAMOL INHALAR SALBOGET 100MCG',
    'SALBUTAMOL INHALAR SALBOGET 100MCG - Available at Kunle Ara Pharmacy',
    2880.0,
    'General Medicine',
    False,
    'SALBUTAMOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAL-0013'),
    1,
    62,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAL-0013'),
    2,
    62,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAL-0013'),
    3,
    62,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OMR-0014',
    'OMRON ARM M1 BASIC',
    'OMRON ARM M1 BASIC - Available at Kunle Ara Pharmacy',
    46230.0,
    'General Medicine',
    False,
    'OMRON'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OMR-0014'),
    1,
    63,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OMR-0014'),
    2,
    63,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OMR-0014'),
    3,
    63,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DAS-0015',
    'DAS OFADA RICE STONE FREE 10KG',
    'DAS OFADA RICE STONE FREE 10KG - Available at Kunle Ara Pharmacy',
    33550.0,
    'General Medicine',
    False,
    'DAS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DAS-0015'),
    1,
    64,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DAS-0015'),
    2,
    64,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DAS-0015'),
    3,
    64,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EVA-0016',
    'EVA PEARS SOAP 150G',
    'EVA PEARS SOAP 150G - Available at Kunle Ara Pharmacy',
    650.0,
    'Personal Care',
    False,
    'EVA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EVA-0016'),
    1,
    65,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EVA-0016'),
    2,
    65,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EVA-0016'),
    3,
    65,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BON-0017',
    'BONABABE SYRUP 60ML PARACETAMOL/CHLORPHENIRAMINE X BOTTLE',
    'BONABABE SYRUP 60ML PARACETAMOL/CHLORPHENIRAMINE X BOTTLE - Available at Kunle Ara Pharmacy',
    450.0,
    'Pharmaceuticals',
    False,
    'BONABABE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BON-0017'),
    1,
    66,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BON-0017'),
    2,
    66,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BON-0017'),
    3,
    66,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ELE-0018',
    'ELECTRONIC PULSE MASSAGER',
    'ELECTRONIC PULSE MASSAGER - Available at Kunle Ara Pharmacy',
    18000.0,
    'General Medicine',
    False,
    'ELECTRONIC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ELE-0018'),
    1,
    67,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ELE-0018'),
    2,
    67,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ELE-0018'),
    3,
    67,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ENC-0019',
    'ENCHANTEUR STUNNING POWDER 125G',
    'ENCHANTEUR STUNNING POWDER 125G - Available at Kunle Ara Pharmacy',
    2400.0,
    'General Medicine',
    False,
    'ENCHANTEUR'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ENC-0019'),
    1,
    68,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ENC-0019'),
    2,
    68,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ENC-0019'),
    3,
    68,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-V-S-0020',
    'V-SOY MULTI GRAIN 1LTRS',
    'V-SOY MULTI GRAIN 1LTRS - Available at Kunle Ara Pharmacy',
    1710.0,
    'General Medicine',
    False,
    'V-SOY'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-V-S-0020'),
    1,
    69,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-V-S-0020'),
    2,
    69,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-V-S-0020'),
    3,
    69,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MEF-0021',
    'MEFANTHER FORTE ARTEMETHER 80M/ LUMEFANTRINE 480MG 6TAB XPKT',
    'MEFANTHER FORTE ARTEMETHER 80M/ LUMEFANTRINE 480MG 6TAB XPKT - Available at Kunle Ara Pharmacy',
    610.0,
    'Pharmaceuticals',
    False,
    'MEFANTHER'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MEF-0021'),
    1,
    70,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MEF-0021'),
    2,
    70,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MEF-0021'),
    3,
    70,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PER-0022',
    'PERFECT SIMPLY WHITE 4 IN 1 CLEANSER 150ML',
    'PERFECT SIMPLY WHITE 4 IN 1 CLEANSER 150ML - Available at Kunle Ara Pharmacy',
    4130.0,
    'Pharmaceuticals',
    False,
    'PERFECT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PER-0022'),
    1,
    71,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PER-0022'),
    2,
    71,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PER-0022'),
    3,
    71,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-XYL-0023',
    'XYLOX LETROZOLE 2.5MG XSACHET 14TAB',
    'XYLOX LETROZOLE 2.5MG XSACHET 14TAB - Available at Kunle Ara Pharmacy',
    2100.0,
    'Pharmaceuticals',
    False,
    'XYLOX'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-XYL-0023'),
    1,
    72,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-XYL-0023'),
    2,
    72,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-XYL-0023'),
    3,
    72,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ORG-0024',
    'ORGANO HOT COCOA COFFEE PER SATCHET',
    'ORGANO HOT COCOA COFFEE PER SATCHET - Available at Kunle Ara Pharmacy',
    1000.0,
    'General Medicine',
    False,
    'ORGANO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ORG-0024'),
    1,
    73,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ORG-0024'),
    2,
    73,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ORG-0024'),
    3,
    73,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-TOK-0025',
    'TOKE KIDS FOLLOW ON LOTION 250ML',
    'TOKE KIDS FOLLOW ON LOTION 250ML - Available at Kunle Ara Pharmacy',
    4950.0,
    'Pharmaceuticals',
    False,
    'TOKE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TOK-0025'),
    1,
    74,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TOK-0025'),
    2,
    74,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TOK-0025'),
    3,
    74,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LEV-0026',
    'LEVOXIN 750MG LEVOFLOXACIN 10TABS X PKT',
    'LEVOXIN 750MG LEVOFLOXACIN 10TABS X PKT - Available at Kunle Ara Pharmacy',
    3420.0,
    'Pharmaceuticals',
    False,
    'LEVOXIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LEV-0026'),
    1,
    75,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LEV-0026'),
    2,
    75,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LEV-0026'),
    3,
    75,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BRE-0027',
    'BREXA 140MG SILYMARIN X SAT 10TABS',
    'BREXA 140MG SILYMARIN X SAT 10TABS - Available at Kunle Ara Pharmacy',
    1800.0,
    'Pharmaceuticals',
    False,
    'BREXA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BRE-0027'),
    1,
    76,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BRE-0027'),
    2,
    76,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BRE-0027'),
    3,
    76,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FRO-0028',
    'FROLIC SALAD DRESSING 250G',
    'FROLIC SALAD DRESSING 250G - Available at Kunle Ara Pharmacy',
    1330.0,
    'General Medicine',
    False,
    'FROLIC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FRO-0028'),
    1,
    77,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FRO-0028'),
    2,
    77,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FRO-0028'),
    3,
    77,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LAG-0029',
    'LAGOS BRAID COLOR T1/27',
    'LAGOS BRAID COLOR T1/27 - Available at Kunle Ara Pharmacy',
    2370.0,
    'General Medicine',
    False,
    'LAGOS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAG-0029'),
    1,
    78,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAG-0029'),
    2,
    78,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAG-0029'),
    3,
    78,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ANU-0030',
    'ANUDOL SUPPOSITORIES 6 SUPP XSATCHET',
    'ANUDOL SUPPOSITORIES 6 SUPP XSATCHET - Available at Kunle Ara Pharmacy',
    2400.0,
    'General Medicine',
    False,
    'ANUDOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANU-0030'),
    1,
    79,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANU-0030'),
    2,
    79,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANU-0030'),
    3,
    79,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BLA-0031',
    'BLADE EMERGENCE PERFUME 100ML',
    'BLADE EMERGENCE PERFUME 100ML - Available at Kunle Ara Pharmacy',
    2200.0,
    'Pharmaceuticals',
    False,
    'BLADE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLA-0031'),
    1,
    80,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLA-0031'),
    2,
    80,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLA-0031'),
    3,
    80,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LUS-0032',
    'LUSH WOW BRAID COLOR 33',
    'LUSH WOW BRAID COLOR 33 - Available at Kunle Ara Pharmacy',
    3630.0,
    'General Medicine',
    False,
    'LUSH'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUS-0032'),
    1,
    81,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUS-0032'),
    2,
    81,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUS-0032'),
    3,
    81,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAL-0033',
    'SALON PRO TWIN OLIVE 454MLS',
    'SALON PRO TWIN OLIVE 454MLS - Available at Kunle Ara Pharmacy',
    2200.0,
    'Pharmaceuticals',
    False,
    'SALON'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAL-0033'),
    1,
    82,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAL-0033'),
    2,
    82,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAL-0033'),
    3,
    82,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GOL-0034',
    'GOLDEN',
    'GOLDEN - Available at Kunle Ara Pharmacy',
    4500.0,
    'General Medicine',
    False,
    'GOLDEN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOL-0034'),
    1,
    83,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOL-0034'),
    2,
    83,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOL-0034'),
    3,
    83,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LUS-0035',
    'LUSH JUMBO BRAIDS COLOR 27X',
    'LUSH JUMBO BRAIDS COLOR 27X - Available at Kunle Ara Pharmacy',
    5100.0,
    'General Medicine',
    False,
    'LUSH'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUS-0035'),
    1,
    84,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUS-0035'),
    2,
    84,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUS-0035'),
    3,
    84,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ACT-0036',
    'ACTIVE CAVIAR DRIP GLUTA-C 100ML OIL',
    'ACTIVE CAVIAR DRIP GLUTA-C 100ML OIL - Available at Kunle Ara Pharmacy',
    6450.0,
    'Pharmaceuticals',
    False,
    'ACTIVE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ACT-0036'),
    1,
    85,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ACT-0036'),
    2,
    85,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ACT-0036'),
    3,
    85,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-KCL-0037',
    'KCLAVIN 625MG XPKT',
    'KCLAVIN 625MG XPKT - Available at Kunle Ara Pharmacy',
    1860.0,
    'Pharmaceuticals',
    False,
    'KCLAVIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KCL-0037'),
    1,
    86,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KCL-0037'),
    2,
    86,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KCL-0037'),
    3,
    86,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BEL-0038',
    'BELOXXI CRACKER 30G',
    'BELOXXI CRACKER 30G - Available at Kunle Ara Pharmacy',
    100.0,
    'General Medicine',
    False,
    'BELOXXI'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BEL-0038'),
    1,
    87,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BEL-0038'),
    2,
    87,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BEL-0038'),
    3,
    87,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LIS-0039',
    'LISINOTAB 10MG LISINOPRIL 14TABS X SACHET',
    'LISINOTAB 10MG LISINOPRIL 14TABS X SACHET - Available at Kunle Ara Pharmacy',
    330.0,
    'Pharmaceuticals',
    False,
    'LISINOTAB'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIS-0039'),
    1,
    88,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIS-0039'),
    2,
    88,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIS-0039'),
    3,
    88,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LUM-0040',
    'LUMIHALE MONTELUKAST SODIUM 10MG X10TAB SAT',
    'LUMIHALE MONTELUKAST SODIUM 10MG X10TAB SAT - Available at Kunle Ara Pharmacy',
    520.0,
    'Pharmaceuticals',
    False,
    'LUMIHALE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUM-0040'),
    1,
    89,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUM-0040'),
    2,
    89,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUM-0040'),
    3,
    89,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FIN-0041',
    'FINA ESSENTIAL MAXI-TONE LOTION 250ML',
    'FINA ESSENTIAL MAXI-TONE LOTION 250ML - Available at Kunle Ara Pharmacy',
    1200.0,
    'Pharmaceuticals',
    False,
    'FINA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FIN-0041'),
    1,
    90,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FIN-0041'),
    2,
    90,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FIN-0041'),
    3,
    90,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EMZ-0042',
    'EMZOBREX 200MG CELECOXIB 10CAPS X PKT',
    'EMZOBREX 200MG CELECOXIB 10CAPS X PKT - Available at Kunle Ara Pharmacy',
    1440.0,
    'Pharmaceuticals',
    False,
    'EMZOBREX'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EMZ-0042'),
    1,
    91,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EMZ-0042'),
    2,
    91,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EMZ-0042'),
    3,
    91,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LIS-0043',
    'LISINOPRIL 5MG TEVA 14TABS X SACHET',
    'LISINOPRIL 5MG TEVA 14TABS X SACHET - Available at Kunle Ara Pharmacy',
    430.0,
    'Pharmaceuticals',
    False,
    'LISINOPRIL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIS-0043'),
    1,
    92,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIS-0043'),
    2,
    92,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIS-0043'),
    3,
    92,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GOO-0044',
    'GOODFIT BABY DIAPER SIZE 3 JUMBO X99PCS',
    'GOODFIT BABY DIAPER SIZE 3 JUMBO X99PCS - Available at Kunle Ara Pharmacy',
    9880.0,
    'Baby Care',
    False,
    'GOODFIT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOO-0044'),
    1,
    93,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOO-0044'),
    2,
    93,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOO-0044'),
    3,
    93,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SUP-0045',
    'SUPRACAL SWIPHA 30TABS X PACK',
    'SUPRACAL SWIPHA 30TABS X PACK - Available at Kunle Ara Pharmacy',
    4800.0,
    'General Medicine',
    False,
    'SUPRACAL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SUP-0045'),
    1,
    94,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SUP-0045'),
    2,
    94,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SUP-0045'),
    3,
    94,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-KIS-0046',
    'KISS BEAUTY SUPERSTAY MATTE INK',
    'KISS BEAUTY SUPERSTAY MATTE INK - Available at Kunle Ara Pharmacy',
    700.0,
    'Beauty Products',
    False,
    'KISS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KIS-0046'),
    1,
    95,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KIS-0046'),
    2,
    95,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KIS-0046'),
    3,
    95,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-INF-0047',
    'INFRARED BULB',
    'INFRARED BULB - Available at Kunle Ara Pharmacy',
    12000.0,
    'General Medicine',
    False,
    'INFRARED'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-INF-0047'),
    1,
    96,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-INF-0047'),
    2,
    96,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-INF-0047'),
    3,
    96,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GAS-0048',
    'GASNIL WITH CARICA PAPAYA 10TABS X PACK',
    'GASNIL WITH CARICA PAPAYA 10TABS X PACK - Available at Kunle Ara Pharmacy',
    1400.0,
    'General Medicine',
    False,
    'GASNIL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAS-0048'),
    1,
    97,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAS-0048'),
    2,
    97,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAS-0048'),
    3,
    97,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LEV-0049',
    'LEVOFLOXACIN 500MG/100ML WELQUINE INFUSION X VIAL',
    'LEVOFLOXACIN 500MG/100ML WELQUINE INFUSION X VIAL - Available at Kunle Ara Pharmacy',
    910.0,
    'Pharmaceuticals',
    False,
    'LEVOFLOXACIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LEV-0049'),
    1,
    98,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LEV-0049'),
    2,
    98,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LEV-0049'),
    3,
    98,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-AMA-0050',
    'AMALORITE AMLODIPINE XSAT',
    'AMALORITE AMLODIPINE XSAT - Available at Kunle Ara Pharmacy',
    150.0,
    'Pharmaceuticals',
    False,
    'AMALORITE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMA-0050'),
    1,
    99,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMA-0050'),
    2,
    99,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMA-0050'),
    3,
    99,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FLA-0051',
    'FLAMINGO KNEE CAP L',
    'FLAMINGO KNEE CAP L - Available at Kunle Ara Pharmacy',
    2400.0,
    'General Medicine',
    False,
    'FLAMINGO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FLA-0051'),
    1,
    100,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FLA-0051'),
    2,
    100,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FLA-0051'),
    3,
    100,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CEF-0052',
    'CEFTRIAXONE JEFYTRAN 1GM INJECT X ONE VIAL',
    'CEFTRIAXONE JEFYTRAN 1GM INJECT X ONE VIAL - Available at Kunle Ara Pharmacy',
    630.0,
    'General Medicine',
    False,
    'CEFTRIAXONE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEF-0052'),
    1,
    101,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEF-0052'),
    2,
    101,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEF-0052'),
    3,
    101,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-HOT-0053',
    'HOT PEPPE POWDER 5GMS X 10PCS',
    'HOT PEPPE POWDER 5GMS X 10PCS - Available at Kunle Ara Pharmacy',
    540.0,
    'General Medicine',
    False,
    'HOT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HOT-0053'),
    1,
    102,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HOT-0053'),
    2,
    102,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HOT-0053'),
    3,
    102,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OBI-0054',
    'OBICLAF 625 AMOXICILLIN 500MG/CLAVULANIC ACID 125MG 14TAB XPACK',
    'OBICLAF 625 AMOXICILLIN 500MG/CLAVULANIC ACID 125MG 14TAB XPACK - Available at Kunle Ara Pharmacy',
    2220.0,
    'Pharmaceuticals',
    False,
    'OBICLAF'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OBI-0054'),
    1,
    103,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OBI-0054'),
    2,
    103,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OBI-0054'),
    3,
    103,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ROS-0055',
    'ROSUVASTATIN 5MG MEDREICH 14TABS X SACHET',
    'ROSUVASTATIN 5MG MEDREICH 14TABS X SACHET - Available at Kunle Ara Pharmacy',
    570.0,
    'Pharmaceuticals',
    False,
    'ROSUVASTATIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROS-0055'),
    1,
    104,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROS-0055'),
    2,
    104,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROS-0055'),
    3,
    104,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-YAL-0056',
    'YALE SPEEDY MINI BISCULT 15G',
    'YALE SPEEDY MINI BISCULT 15G - Available at Kunle Ara Pharmacy',
    50.0,
    'General Medicine',
    False,
    'YALE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-YAL-0056'),
    1,
    105,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-YAL-0056'),
    2,
    105,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-YAL-0056'),
    3,
    105,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-X-P-0057',
    'X-PRESSION MULTI COLOR 1',
    'X-PRESSION MULTI COLOR 1 - Available at Kunle Ara Pharmacy',
    1700.0,
    'General Medicine',
    False,
    'X-PRESSION'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-X-P-0057'),
    1,
    106,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-X-P-0057'),
    2,
    106,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-X-P-0057'),
    3,
    106,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LEV-0058',
    'LEVOFLOXACIN 500MG KESSINGTON 10TABS XPACK',
    'LEVOFLOXACIN 500MG KESSINGTON 10TABS XPACK - Available at Kunle Ara Pharmacy',
    980.0,
    'Pharmaceuticals',
    False,
    'LEVOFLOXACIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LEV-0058'),
    1,
    107,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LEV-0058'),
    2,
    107,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LEV-0058'),
    3,
    107,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LUM-0059',
    'LUMIPRESS 50MG LOSARTAN POTASSIUM 10TAB X SAT',
    'LUMIPRESS 50MG LOSARTAN POTASSIUM 10TAB X SAT - Available at Kunle Ara Pharmacy',
    550.0,
    'Pharmaceuticals',
    False,
    'LUMIPRESS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUM-0059'),
    1,
    108,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUM-0059'),
    2,
    108,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUM-0059'),
    3,
    108,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FAN-0060',
    'FANTASTIC SUGAR BLOOD GLUCOSE METER',
    'FANTASTIC SUGAR BLOOD GLUCOSE METER - Available at Kunle Ara Pharmacy',
    16800.0,
    'General Medicine',
    False,
    'FANTASTIC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAN-0060'),
    1,
    109,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAN-0060'),
    2,
    109,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAN-0060'),
    3,
    109,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SIM-0061',
    'SIMPLE MICELLAR GEL WASH 150ML',
    'SIMPLE MICELLAR GEL WASH 150ML - Available at Kunle Ara Pharmacy',
    5780.0,
    'Pharmaceuticals',
    False,
    'SIMPLE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIM-0061'),
    1,
    110,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIM-0061'),
    2,
    110,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIM-0061'),
    3,
    110,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SIM-0062',
    'SIMPLE MICELLAR CLEANSING WATER 400ML',
    'SIMPLE MICELLAR CLEANSING WATER 400ML - Available at Kunle Ara Pharmacy',
    7350.0,
    'Pharmaceuticals',
    False,
    'SIMPLE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIM-0062'),
    1,
    111,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIM-0062'),
    2,
    111,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIM-0062'),
    3,
    111,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OUD-0063',
    'OUD FOR AMETHYST PERFUME 100ML',
    'OUD FOR AMETHYST PERFUME 100ML - Available at Kunle Ara Pharmacy',
    30800.0,
    'Pharmaceuticals',
    False,
    'OUD'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OUD-0063'),
    1,
    112,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OUD-0063'),
    2,
    112,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OUD-0063'),
    3,
    112,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OTE-0064',
    'OTERO CASTLE BEJAR SPRAY 200ML',
    'OTERO CASTLE BEJAR SPRAY 200ML - Available at Kunle Ara Pharmacy',
    2600.0,
    'Pharmaceuticals',
    False,
    'OTERO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OTE-0064'),
    1,
    113,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OTE-0064'),
    2,
    113,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OTE-0064'),
    3,
    113,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ASA-0065',
    'ASAD LATTAFA PERFUME',
    'ASAD LATTAFA PERFUME - Available at Kunle Ara Pharmacy',
    24200.0,
    'General Medicine',
    False,
    'ASAD'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ASA-0065'),
    1,
    114,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ASA-0065'),
    2,
    114,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ASA-0065'),
    3,
    114,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LIP-0066',
    'LIPTON TEA',
    'LIPTON TEA - Available at Kunle Ara Pharmacy',
    930.0,
    'General Medicine',
    False,
    'LIPTON'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIP-0066'),
    1,
    115,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIP-0066'),
    2,
    115,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIP-0066'),
    3,
    115,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DOV-0067',
    'DOVE PINK 90G',
    'DOVE PINK 90G - Available at Kunle Ara Pharmacy',
    1150.0,
    'General Medicine',
    False,
    'DOVE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DOV-0067'),
    1,
    116,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DOV-0067'),
    2,
    116,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DOV-0067'),
    3,
    116,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-URB-0068',
    'URBAN WOMAN BODY SPRAY 200ML',
    'URBAN WOMAN BODY SPRAY 200ML - Available at Kunle Ara Pharmacy',
    3250.0,
    'Pharmaceuticals',
    False,
    'URBAN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-URB-0068'),
    1,
    117,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-URB-0068'),
    2,
    117,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-URB-0068'),
    3,
    117,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EPI-0069',
    'EPIC ADVENTURE EMPER PERFUMED SPRAY 200ML',
    'EPIC ADVENTURE EMPER PERFUMED SPRAY 200ML - Available at Kunle Ara Pharmacy',
    1430.0,
    'Pharmaceuticals',
    False,
    'EPIC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EPI-0069'),
    1,
    118,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EPI-0069'),
    2,
    118,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EPI-0069'),
    3,
    118,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAL-0070',
    'SALTROL 25 125MCG INHALER',
    'SALTROL 25 125MCG INHALER - Available at Kunle Ara Pharmacy',
    6200.0,
    'General Medicine',
    False,
    'SALTROL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAL-0070'),
    1,
    119,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAL-0070'),
    2,
    119,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAL-0070'),
    3,
    119,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MES-0071',
    'MESPORIN INJ 1G IM X ONE VIAL',
    'MESPORIN INJ 1G IM X ONE VIAL - Available at Kunle Ara Pharmacy',
    6780.0,
    'General Medicine',
    False,
    'MESPORIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MES-0071'),
    1,
    120,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MES-0071'),
    2,
    120,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MES-0071'),
    3,
    120,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-VAS-0072',
    'VASELINE GLUTA-HYA TUBE LOTION 300ML',
    'VASELINE GLUTA-HYA TUBE LOTION 300ML - Available at Kunle Ara Pharmacy',
    9170.0,
    'Pharmaceuticals',
    False,
    'VASELINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0072'),
    1,
    121,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0072'),
    2,
    121,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0072'),
    3,
    121,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ARA-0073',
    'ARAMINOL 2MG/120MG XSAT',
    'ARAMINOL 2MG/120MG XSAT - Available at Kunle Ara Pharmacy',
    90.0,
    'Pharmaceuticals',
    False,
    'ARAMINOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ARA-0073'),
    1,
    122,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ARA-0073'),
    2,
    122,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ARA-0073'),
    3,
    122,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-JUL-0074',
    'JULIET EVE 500MG X60CAP',
    'JULIET EVE 500MG X60CAP - Available at Kunle Ara Pharmacy',
    25300.0,
    'Pharmaceuticals',
    False,
    'JULIET'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JUL-0074'),
    1,
    123,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JUL-0074'),
    2,
    123,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JUL-0074'),
    3,
    123,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-NON-0075',
    'NON REBREATHING MASK CHILD',
    'NON REBREATHING MASK CHILD - Available at Kunle Ara Pharmacy',
    1800.0,
    'General Medicine',
    False,
    'NON'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NON-0075'),
    1,
    124,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NON-0075'),
    2,
    124,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NON-0075'),
    3,
    124,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BON-0076',
    'BONDMODINE 0.2 EYE DROP 5ML',
    'BONDMODINE 0.2 EYE DROP 5ML - Available at Kunle Ara Pharmacy',
    2280.0,
    'Pharmaceuticals',
    False,
    'BONDMODINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BON-0076'),
    1,
    125,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BON-0076'),
    2,
    125,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BON-0076'),
    3,
    125,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-JEO-0077',
    'JEONOL TABLET SALBUTAMOL THEOPHYLLINE XSATCHET',
    'JEONOL TABLET SALBUTAMOL THEOPHYLLINE XSATCHET - Available at Kunle Ara Pharmacy',
    140.0,
    'Pharmaceuticals',
    False,
    'JEONOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JEO-0077'),
    1,
    126,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JEO-0077'),
    2,
    126,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JEO-0077'),
    3,
    126,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-APE-0078',
    'APETABON SYRUP 200MLS',
    'APETABON SYRUP 200MLS - Available at Kunle Ara Pharmacy',
    2020.0,
    'Pharmaceuticals',
    False,
    'APETABON'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-APE-0078'),
    1,
    127,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-APE-0078'),
    2,
    127,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-APE-0078'),
    3,
    127,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ROS-0079',
    'ROSUVASTATIN 10MG MEDREICH/ETHIROSE 14TABS X SACHET',
    'ROSUVASTATIN 10MG MEDREICH/ETHIROSE 14TABS X SACHET - Available at Kunle Ara Pharmacy',
    1290.0,
    'Pharmaceuticals',
    False,
    'ROSUVASTATIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROS-0079'),
    1,
    128,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROS-0079'),
    2,
    128,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROS-0079'),
    3,
    128,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ADD-0080',
    'Add to favorite',
    'Add to favorite - Available at Kunle Ara Pharmacy',
    17400.0,
    'General Medicine',
    False,
    'Add'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ADD-0080'),
    1,
    129,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ADD-0080'),
    2,
    129,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ADD-0080'),
    3,
    129,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-YAL-0081',
    'YALE CABIN LUCKY',
    'YALE CABIN LUCKY - Available at Kunle Ara Pharmacy',
    100.0,
    'General Medicine',
    False,
    'YALE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-YAL-0081'),
    1,
    130,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-YAL-0081'),
    2,
    130,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-YAL-0081'),
    3,
    130,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OLE-0082',
    'OLEMPEA EIFFEL TOWER COLLECTION SPRAY 200ML',
    'OLEMPEA EIFFEL TOWER COLLECTION SPRAY 200ML - Available at Kunle Ara Pharmacy',
    3300.0,
    'Pharmaceuticals',
    False,
    'OLEMPEA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OLE-0082'),
    1,
    131,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OLE-0082'),
    2,
    131,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OLE-0082'),
    3,
    131,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-NUR-0083',
    'NUROFEN 400MG X12TABS PK',
    'NUROFEN 400MG X12TABS PK - Available at Kunle Ara Pharmacy',
    3730.0,
    'Pharmaceuticals',
    False,
    'NUROFEN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NUR-0083'),
    1,
    132,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NUR-0083'),
    2,
    132,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NUR-0083'),
    3,
    132,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DOV-0084',
    'DOVE NOURISHING SECRETS RELAXING RITUAL BODYWASH 750ML',
    'DOVE NOURISHING SECRETS RELAXING RITUAL BODYWASH 750ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'DOVE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DOV-0084'),
    1,
    133,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DOV-0084'),
    2,
    133,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DOV-0084'),
    3,
    133,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DOV-0085',
    'DOVE NOURISHING SECRETS BODYWASH 750ML',
    'DOVE NOURISHING SECRETS BODYWASH 750ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'DOVE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DOV-0085'),
    1,
    134,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DOV-0085'),
    2,
    134,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DOV-0085'),
    3,
    134,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OLA-0086',
    'OLAY EXCLUSIVE INSTANT WHITE ROSE CARROT EXTRACT SHOWER CREAM 1000ML',
    'OLAY EXCLUSIVE INSTANT WHITE ROSE CARROT EXTRACT SHOWER CREAM 1000ML - Available at Kunle Ara Pharmacy',
    4130.0,
    'Pharmaceuticals',
    False,
    'OLAY'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OLA-0086'),
    1,
    135,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OLA-0086'),
    2,
    135,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OLA-0086'),
    3,
    135,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ZOF-0087',
    'ZOFLAM DICLOFENAC 50MG XSAT 10TAB',
    'ZOFLAM DICLOFENAC 50MG XSAT 10TAB - Available at Kunle Ara Pharmacy',
    270.0,
    'Pharmaceuticals',
    False,
    'ZOFLAM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ZOF-0087'),
    1,
    136,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ZOF-0087'),
    2,
    136,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ZOF-0087'),
    3,
    136,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LUS-0088',
    'LUSH MEGA BRAIDS 6X COLOR 1/27',
    'LUSH MEGA BRAIDS 6X COLOR 1/27 - Available at Kunle Ara Pharmacy',
    5000.0,
    'General Medicine',
    False,
    'LUSH'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUS-0088'),
    1,
    137,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUS-0088'),
    2,
    137,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUS-0088'),
    3,
    137,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PER-0089',
    'PERLAY GOLDIE BEAUTY LOTION 550ML',
    'PERLAY GOLDIE BEAUTY LOTION 550ML - Available at Kunle Ara Pharmacy',
    5050.0,
    'Pharmaceuticals',
    False,
    'PERLAY'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PER-0089'),
    1,
    138,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PER-0089'),
    2,
    138,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PER-0089'),
    3,
    138,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-TRO-0090',
    'TROVAC CAP XPKT',
    'TROVAC CAP XPKT - Available at Kunle Ara Pharmacy',
    1200.0,
    'General Medicine',
    False,
    'TROVAC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TRO-0090'),
    1,
    139,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TRO-0090'),
    2,
    139,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TRO-0090'),
    3,
    139,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LOP-0091',
    'LOPERAMIDE PAUCO 2MG SATCHET',
    'LOPERAMIDE PAUCO 2MG SATCHET - Available at Kunle Ara Pharmacy',
    50.0,
    'Pharmaceuticals',
    False,
    'LOPERAMIDE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LOP-0091'),
    1,
    140,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LOP-0091'),
    2,
    140,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LOP-0091'),
    3,
    140,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAC-0092',
    'SACUVAN 24/26 SACUBITRIL 24MG VALSARTAN 25MG 10TAB XSAT',
    'SACUVAN 24/26 SACUBITRIL 24MG VALSARTAN 25MG 10TAB XSAT - Available at Kunle Ara Pharmacy',
    5600.0,
    'Pharmaceuticals',
    False,
    'SACUVAN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAC-0092'),
    1,
    141,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAC-0092'),
    2,
    141,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAC-0092'),
    3,
    141,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-AVR-0093',
    'AVRO',
    'AVRO - Available at Kunle Ara Pharmacy',
    380.0,
    'General Medicine',
    False,
    'AVRO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AVR-0093'),
    1,
    142,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AVR-0093'),
    2,
    142,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AVR-0093'),
    3,
    142,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ASC-0094',
    'ASCIPRAM 20MG ESCITALOPRAM 10TABS X SACHET',
    'ASCIPRAM 20MG ESCITALOPRAM 10TABS X SACHET - Available at Kunle Ara Pharmacy',
    1440.0,
    'Pharmaceuticals',
    False,
    'ASCIPRAM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ASC-0094'),
    1,
    143,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ASC-0094'),
    2,
    143,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ASC-0094'),
    3,
    143,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ART-0095',
    'ARTESUN PLUS 14YEARS',
    'ARTESUN PLUS 14YEARS - Available at Kunle Ara Pharmacy',
    100.0,
    'General Medicine',
    False,
    'ARTESUN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ART-0095'),
    1,
    144,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ART-0095'),
    2,
    144,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ART-0095'),
    3,
    144,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EMC-0096',
    'EMCAP EXTRA PARACETAMOL/CAFFEINE500MG /30MG 10TAB XSAT',
    'EMCAP EXTRA PARACETAMOL/CAFFEINE500MG /30MG 10TAB XSAT - Available at Kunle Ara Pharmacy',
    200.0,
    'Pharmaceuticals',
    False,
    'EMCAP'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EMC-0096'),
    1,
    145,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EMC-0096'),
    2,
    145,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EMC-0096'),
    3,
    145,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-TRE-0097',
    'TREVIA 50MG SITAGLIPTIN 7TABS X SACHET',
    'TREVIA 50MG SITAGLIPTIN 7TABS X SACHET - Available at Kunle Ara Pharmacy',
    2280.0,
    'Pharmaceuticals',
    False,
    'TREVIA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TRE-0097'),
    1,
    146,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TRE-0097'),
    2,
    146,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TRE-0097'),
    3,
    146,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CON-0098',
    'CONFORM GLOVE 10PCS',
    'CONFORM GLOVE 10PCS - Available at Kunle Ara Pharmacy',
    410.0,
    'General Medicine',
    False,
    'CONFORM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CON-0098'),
    1,
    147,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CON-0098'),
    2,
    147,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CON-0098'),
    3,
    147,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DIE-0099',
    'DIETHYLCARBAMAZINE 50MG COUNTING X TAB',
    'DIETHYLCARBAMAZINE 50MG COUNTING X TAB - Available at Kunle Ara Pharmacy',
    10.0,
    'Pharmaceuticals',
    False,
    'DIETHYLCARBAMAZINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIE-0099'),
    1,
    148,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIE-0099'),
    2,
    148,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIE-0099'),
    3,
    148,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ESS-0100',
    'ESSENTIAL FORTE ESSENTIAL PHOSPHOLIPID 300MG XSATCHET',
    'ESSENTIAL FORTE ESSENTIAL PHOSPHOLIPID 300MG XSATCHET - Available at Kunle Ara Pharmacy',
    2280.0,
    'Pharmaceuticals',
    False,
    'ESSENTIAL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ESS-0100'),
    1,
    149,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ESS-0100'),
    2,
    149,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ESS-0100'),
    3,
    149,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-5ML-0101',
    '5ML NEEDLE SYRINGE X PC',
    '5ML NEEDLE SYRINGE X PC - Available at Kunle Ara Pharmacy',
    50.0,
    'Pharmaceuticals',
    False,
    '5ML'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-5ML-0101'),
    1,
    50,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-5ML-0101'),
    2,
    50,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-5ML-0101'),
    3,
    50,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-2ML-0102',
    '2ML NEEDLE SYRINGE X PC',
    '2ML NEEDLE SYRINGE X PC - Available at Kunle Ara Pharmacy',
    50.0,
    'Pharmaceuticals',
    False,
    '2ML'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-2ML-0102'),
    1,
    51,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-2ML-0102'),
    2,
    51,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-2ML-0102'),
    3,
    51,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GYN-0103',
    'GYNO DAKTARIN VAG CREAM 40G MICONAZOLE 20MG X TUBE',
    'GYNO DAKTARIN VAG CREAM 40G MICONAZOLE 20MG X TUBE - Available at Kunle Ara Pharmacy',
    12700.0,
    'Pharmaceuticals',
    False,
    'GYNO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GYN-0103'),
    1,
    52,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GYN-0103'),
    2,
    52,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GYN-0103'),
    3,
    52,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CER-0104',
    'CERUMOL EAR DROP TURPENTINE OIL XBOTTLE',
    'CERUMOL EAR DROP TURPENTINE OIL XBOTTLE - Available at Kunle Ara Pharmacy',
    10200.0,
    'General Medicine',
    False,
    'CERUMOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0104'),
    1,
    53,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0104'),
    2,
    53,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0104'),
    3,
    53,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FLE-0105',
    'FLEMING 600MG INJ AMOXICILLIN/CLAVULANIC ACID X ONE VIAL',
    'FLEMING 600MG INJ AMOXICILLIN/CLAVULANIC ACID X ONE VIAL - Available at Kunle Ara Pharmacy',
    850.0,
    'Pharmaceuticals',
    False,
    'FLEMING'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FLE-0105'),
    1,
    54,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FLE-0105'),
    2,
    54,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FLE-0105'),
    3,
    54,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ERY-0106',
    'ERYTHROKID SUSP 250MG/5ML ERYTHROMYCIN 100ML X BOTTLE',
    'ERYTHROKID SUSP 250MG/5ML ERYTHROMYCIN 100ML X BOTTLE - Available at Kunle Ara Pharmacy',
    1860.0,
    'Pharmaceuticals',
    False,
    'ERYTHROKID'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ERY-0106'),
    1,
    55,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ERY-0106'),
    2,
    55,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ERY-0106'),
    3,
    55,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DYN-0107',
    'DYNAMOGEN ORAL 3MG/10ML X AMPOULE',
    'DYNAMOGEN ORAL 3MG/10ML X AMPOULE - Available at Kunle Ara Pharmacy',
    420.0,
    'Pharmaceuticals',
    False,
    'DYNAMOGEN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DYN-0107'),
    1,
    56,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DYN-0107'),
    2,
    56,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DYN-0107'),
    3,
    56,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EPI-0108',
    'EPILIM 500MG SODIUM VALPROATE SR 10TABS X SAT',
    'EPILIM 500MG SODIUM VALPROATE SR 10TABS X SAT - Available at Kunle Ara Pharmacy',
    8050.0,
    'Pharmaceuticals',
    False,
    'EPILIM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EPI-0108'),
    1,
    57,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EPI-0108'),
    2,
    57,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EPI-0108'),
    3,
    57,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DEP-0109',
    'DEPIXOL INJ 40MG/2ML FLUPENTIXOL DECONATE X AMPOULE',
    'DEPIXOL INJ 40MG/2ML FLUPENTIXOL DECONATE X AMPOULE - Available at Kunle Ara Pharmacy',
    9600.0,
    'Pharmaceuticals',
    False,
    'DEPIXOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DEP-0109'),
    1,
    58,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DEP-0109'),
    2,
    58,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DEP-0109'),
    3,
    58,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-COF-0110',
    'COFTA TAB AMMONIUM CL/IPECACUANHA 10TABS X SAT',
    'COFTA TAB AMMONIUM CL/IPECACUANHA 10TABS X SAT - Available at Kunle Ara Pharmacy',
    330.0,
    'General Medicine',
    False,
    'COFTA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COF-0110'),
    1,
    59,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COF-0110'),
    2,
    59,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COF-0110'),
    3,
    59,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CHL-0111',
    'CHLORAPHENICOL 0.5 EYE DROP 10ML MCA X BOTTLE',
    'CHLORAPHENICOL 0.5 EYE DROP 10ML MCA X BOTTLE - Available at Kunle Ara Pharmacy',
    455.0,
    'Pharmaceuticals',
    False,
    'CHLORAPHENICOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CHL-0111'),
    1,
    60,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CHL-0111'),
    2,
    60,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CHL-0111'),
    3,
    60,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DIS-0112',
    'DISPENSING ENVELOPE 1PK',
    'DISPENSING ENVELOPE 1PK - Available at Kunle Ara Pharmacy',
    220.0,
    'General Medicine',
    False,
    'DISPENSING'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIS-0112'),
    1,
    61,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIS-0112'),
    2,
    61,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIS-0112'),
    3,
    61,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DIS-0113',
    'DISPOSABLE GLOVES X100 PIECIES PER PKT',
    'DISPOSABLE GLOVES X100 PIECIES PER PKT - Available at Kunle Ara Pharmacy',
    380.0,
    'General Medicine',
    False,
    'DISPOSABLE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIS-0113'),
    1,
    62,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIS-0113'),
    2,
    62,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIS-0113'),
    3,
    62,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FER-0114',
    'FERROUS BOTTLE 200MG FERROUS SULPHATE 200MG X 100TABS',
    'FERROUS BOTTLE 200MG FERROUS SULPHATE 200MG X 100TABS - Available at Kunle Ara Pharmacy',
    445.0,
    'Pharmaceuticals',
    False,
    'FERROUS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FER-0114'),
    1,
    63,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FER-0114'),
    2,
    63,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FER-0114'),
    3,
    63,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-HCG-0115',
    'HCG DICLAIR INJ 5000IU XPKT',
    'HCG DICLAIR INJ 5000IU XPKT - Available at Kunle Ara Pharmacy',
    13200.0,
    'General Medicine',
    False,
    'HCG'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HCG-0115'),
    1,
    64,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HCG-0115'),
    2,
    64,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HCG-0115'),
    3,
    64,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-HIP-0116',
    'HIPRIL 10MG XSATCHET',
    'HIPRIL 10MG XSATCHET - Available at Kunle Ara Pharmacy',
    280.0,
    'Pharmaceuticals',
    False,
    'HIPRIL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HIP-0116'),
    1,
    65,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HIP-0116'),
    2,
    65,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HIP-0116'),
    3,
    65,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-HIP-0117',
    'HIPRIL 5MG XSACHET',
    'HIPRIL 5MG XSACHET - Available at Kunle Ara Pharmacy',
    220.0,
    'Pharmaceuticals',
    False,
    'HIPRIL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HIP-0117'),
    1,
    66,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HIP-0117'),
    2,
    66,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HIP-0117'),
    3,
    66,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FUN-0118',
    'FUNGUSOL LOTION 50ML MICONAZOLE 2 X BOTTLE',
    'FUNGUSOL LOTION 50ML MICONAZOLE 2 X BOTTLE - Available at Kunle Ara Pharmacy',
    1070.0,
    'Pharmaceuticals',
    False,
    'FUNGUSOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FUN-0118'),
    1,
    67,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FUN-0118'),
    2,
    67,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FUN-0118'),
    3,
    67,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-HEP-0119',
    'HEPP FORT 200ML X BOTTLE',
    'HEPP FORT 200ML X BOTTLE - Available at Kunle Ara Pharmacy',
    320.0,
    'Pharmaceuticals',
    False,
    'HEPP'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HEP-0119'),
    1,
    68,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HEP-0119'),
    2,
    68,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HEP-0119'),
    3,
    68,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GLU-0120',
    'GLUCOVANCE 500/2.5MG METFORMIN/GLIBENCLAMIDE 30TABS X PKT',
    'GLUCOVANCE 500/2.5MG METFORMIN/GLIBENCLAMIDE 30TABS X PKT - Available at Kunle Ara Pharmacy',
    12040.0,
    'Pharmaceuticals',
    False,
    'GLUCOVANCE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GLU-0120'),
    1,
    69,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GLU-0120'),
    2,
    69,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GLU-0120'),
    3,
    69,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EPA-0121',
    'EPANUTIN FENITOIN 100MG COUNTING X TAB',
    'EPANUTIN FENITOIN 100MG COUNTING X TAB - Available at Kunle Ara Pharmacy',
    40.0,
    'Pharmaceuticals',
    False,
    'EPANUTIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EPA-0121'),
    1,
    70,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EPA-0121'),
    2,
    70,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EPA-0121'),
    3,
    70,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CYC-0122',
    'CYCLOCEL 500MG CYCLOPHOSPHAMIDE X VIAL',
    'CYCLOCEL 500MG CYCLOPHOSPHAMIDE X VIAL - Available at Kunle Ara Pharmacy',
    750.0,
    'Pharmaceuticals',
    False,
    'CYCLOCEL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CYC-0122'),
    1,
    71,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CYC-0122'),
    2,
    71,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CYC-0122'),
    3,
    71,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OMR-0123',
    'OMRON ARM M2',
    'OMRON ARM M2 - Available at Kunle Ara Pharmacy',
    70070.0,
    'General Medicine',
    False,
    'OMRON'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OMR-0123'),
    1,
    72,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OMR-0123'),
    2,
    72,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OMR-0123'),
    3,
    72,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MIL-0124',
    'MILTON TAB',
    'MILTON TAB - Available at Kunle Ara Pharmacy',
    5960.0,
    'General Medicine',
    False,
    'MILTON'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MIL-0124'),
    1,
    73,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MIL-0124'),
    2,
    73,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MIL-0124'),
    3,
    73,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PUR-0125',
    'PURE LOVE SPRAY',
    'PURE LOVE SPRAY - Available at Kunle Ara Pharmacy',
    1950.0,
    'General Medicine',
    False,
    'PURE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0125'),
    1,
    74,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0125'),
    2,
    74,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0125'),
    3,
    74,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ABA-0126',
    'ABAKTAL 400MG TAB PKT',
    'ABAKTAL 400MG TAB PKT - Available at Kunle Ara Pharmacy',
    1170.0,
    'Pharmaceuticals',
    False,
    'ABAKTAL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ABA-0126'),
    1,
    75,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ABA-0126'),
    2,
    75,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ABA-0126'),
    3,
    75,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ANA-0127',
    'ANAFRANIL 25MG SATCHET',
    'ANAFRANIL 25MG SATCHET - Available at Kunle Ara Pharmacy',
    3000.0,
    'Pharmaceuticals',
    False,
    'ANAFRANIL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANA-0127'),
    1,
    76,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANA-0127'),
    2,
    76,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANA-0127'),
    3,
    76,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-E45-0128',
    'E45 SKIN NOURISHING SOAP 250G 2 IN 1',
    'E45 SKIN NOURISHING SOAP 250G 2 IN 1 - Available at Kunle Ara Pharmacy',
    1430.0,
    'Personal Care',
    False,
    'E45'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-E45-0128'),
    1,
    77,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-E45-0128'),
    2,
    77,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-E45-0128'),
    3,
    77,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CIA-0129',
    'CIALIS 20MG TADALAFIL 2TAB XPK',
    'CIALIS 20MG TADALAFIL 2TAB XPK - Available at Kunle Ara Pharmacy',
    8340.0,
    'Pharmaceuticals',
    False,
    'CIALIS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CIA-0129'),
    1,
    78,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CIA-0129'),
    2,
    78,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CIA-0129'),
    3,
    78,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LUM-0130',
    'LUMIGAN EYE DROP X 1',
    'LUMIGAN EYE DROP X 1 - Available at Kunle Ara Pharmacy',
    17400.0,
    'General Medicine',
    False,
    'LUMIGAN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUM-0130'),
    1,
    79,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUM-0130'),
    2,
    79,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUM-0130'),
    3,
    79,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PUR-0131',
    'PURIT 4L',
    'PURIT 4L - Available at Kunle Ara Pharmacy',
    19470.0,
    'General Medicine',
    False,
    'PURIT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0131'),
    1,
    80,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0131'),
    2,
    80,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0131'),
    3,
    80,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ATR-0132',
    'ATRACURIUM INJ 50MG X AMP',
    'ATRACURIUM INJ 50MG X AMP - Available at Kunle Ara Pharmacy',
    6600.0,
    'Pharmaceuticals',
    False,
    'ATRACURIUM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ATR-0132'),
    1,
    81,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ATR-0132'),
    2,
    81,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ATR-0132'),
    3,
    81,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-COL-0133',
    'COLOSTOMY BAG X 1PIECE',
    'COLOSTOMY BAG X 1PIECE - Available at Kunle Ara Pharmacy',
    1800.0,
    'General Medicine',
    False,
    'COLOSTOMY'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COL-0133'),
    1,
    82,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COL-0133'),
    2,
    82,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COL-0133'),
    3,
    82,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SUD-0134',
    'SUDREX CAFFEINE/PARACETAMOL XSATCHET',
    'SUDREX CAFFEINE/PARACETAMOL XSATCHET - Available at Kunle Ara Pharmacy',
    510.0,
    'General Medicine',
    False,
    'SUDREX'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SUD-0134'),
    1,
    83,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SUD-0134'),
    2,
    83,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SUD-0134'),
    3,
    83,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ABR-0135',
    'ABRO LEATHER CLEANER FURNITURE CLEANER 473ML',
    'ABRO LEATHER CLEANER FURNITURE CLEANER 473ML - Available at Kunle Ara Pharmacy',
    1380.0,
    'Pharmaceuticals',
    False,
    'ABRO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ABR-0135'),
    1,
    84,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ABR-0135'),
    2,
    84,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ABR-0135'),
    3,
    84,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DET-0136',
    'DETTOL HAND SANITIZER 50ML',
    'DETTOL HAND SANITIZER 50ML - Available at Kunle Ara Pharmacy',
    810.0,
    'Pharmaceuticals',
    False,
    'DETTOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DET-0136'),
    1,
    85,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DET-0136'),
    2,
    85,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DET-0136'),
    3,
    85,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DIA-0137',
    'DIABETAMIL 187.5G DRINK PK',
    'DIABETAMIL 187.5G DRINK PK - Available at Kunle Ara Pharmacy',
    6240.0,
    'General Medicine',
    False,
    'DIABETAMIL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIA-0137'),
    1,
    86,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIA-0137'),
    2,
    86,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIA-0137'),
    3,
    86,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EAS-0138',
    'EASY ON',
    'EASY ON - Available at Kunle Ara Pharmacy',
    2750.0,
    'General Medicine',
    False,
    'EASY'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EAS-0138'),
    1,
    87,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EAS-0138'),
    2,
    87,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EAS-0138'),
    3,
    87,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ONI-0139',
    'ONION CRACKERS 200G BISCUIT',
    'ONION CRACKERS 200G BISCUIT - Available at Kunle Ara Pharmacy',
    1980.0,
    'General Medicine',
    False,
    'ONION'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ONI-0139'),
    1,
    88,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ONI-0139'),
    2,
    88,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ONI-0139'),
    3,
    88,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-KOF-0140',
    'KOFOL COUGH EXPECTORANT SYRUP',
    'KOFOL COUGH EXPECTORANT SYRUP - Available at Kunle Ara Pharmacy',
    2040.0,
    'Pharmaceuticals',
    False,
    'KOFOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KOF-0140'),
    1,
    89,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KOF-0140'),
    2,
    89,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KOF-0140'),
    3,
    89,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MON-0141',
    'MONTE CARLO PERFUME 100ML',
    'MONTE CARLO PERFUME 100ML - Available at Kunle Ara Pharmacy',
    6600.0,
    'Pharmaceuticals',
    False,
    'MONTE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MON-0141'),
    1,
    90,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MON-0141'),
    2,
    90,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MON-0141'),
    3,
    90,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LEV-0142',
    'LEVITRA 10MG XPKT',
    'LEVITRA 10MG XPKT - Available at Kunle Ara Pharmacy',
    4000.0,
    'Pharmaceuticals',
    False,
    'LEVITRA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LEV-0142'),
    1,
    91,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LEV-0142'),
    2,
    91,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LEV-0142'),
    3,
    91,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CEN-0143',
    'CENTRUM SILVER MEN 50 MULTIVITAMIN X 65TAB',
    'CENTRUM SILVER MEN 50 MULTIVITAMIN X 65TAB - Available at Kunle Ara Pharmacy',
    30000.0,
    'Vitamins & Supplements',
    False,
    'CENTRUM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEN-0143'),
    1,
    92,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEN-0143'),
    2,
    92,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEN-0143'),
    3,
    92,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CEN-0144',
    'CENTRUM SILVER WOMEN 50 MULTIVITAMIN X100TAB',
    'CENTRUM SILVER WOMEN 50 MULTIVITAMIN X100TAB - Available at Kunle Ara Pharmacy',
    31050.0,
    'Vitamins & Supplements',
    False,
    'CENTRUM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEN-0144'),
    1,
    93,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEN-0144'),
    2,
    93,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEN-0144'),
    3,
    93,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CEN-0145',
    'CENTRUM SILVER ADULT 50 MULTIVITAMINS 125TABS X CUP',
    'CENTRUM SILVER ADULT 50 MULTIVITAMINS 125TABS X CUP - Available at Kunle Ara Pharmacy',
    31050.0,
    'Vitamins & Supplements',
    False,
    'CENTRUM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEN-0145'),
    1,
    94,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEN-0145'),
    2,
    94,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEN-0145'),
    3,
    94,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FAI-0146',
    'FAIR AND WHITE SAVON EXCLUSIVE WHITENIZER SOAP 200G',
    'FAIR AND WHITE SAVON EXCLUSIVE WHITENIZER SOAP 200G - Available at Kunle Ara Pharmacy',
    5775.0,
    'Personal Care',
    False,
    'FAIR'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAI-0146'),
    1,
    95,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAI-0146'),
    2,
    95,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAI-0146'),
    3,
    95,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FAI-0147',
    'FAIR AND WHITE EXCLUSIVE WHITENIZER MAXI TONE 250ML',
    'FAIR AND WHITE EXCLUSIVE WHITENIZER MAXI TONE 250ML - Available at Kunle Ara Pharmacy',
    15000.0,
    'Pharmaceuticals',
    False,
    'FAIR'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAI-0147'),
    1,
    96,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAI-0147'),
    2,
    96,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAI-0147'),
    3,
    96,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FAI-0148',
    'FAIR WHITE SOWHITE SERUM 30MLX1',
    'FAIR WHITE SOWHITE SERUM 30MLX1 - Available at Kunle Ara Pharmacy',
    12000.0,
    'Pharmaceuticals',
    False,
    'FAIR'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAI-0148'),
    1,
    97,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAI-0148'),
    2,
    97,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAI-0148'),
    3,
    97,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FAI-0149',
    'FAIR AND WHITE SAVON GOMMANT SOAP 200G',
    'FAIR AND WHITE SAVON GOMMANT SOAP 200G - Available at Kunle Ara Pharmacy',
    4950.0,
    'Personal Care',
    False,
    'FAIR'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAI-0149'),
    1,
    98,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAI-0149'),
    2,
    98,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAI-0149'),
    3,
    98,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FIE-0150',
    'FIESTA DOTTED CONDOM',
    'FIESTA DOTTED CONDOM - Available at Kunle Ara Pharmacy',
    480.0,
    'General Medicine',
    False,
    'FIESTA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FIE-0150'),
    1,
    99,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FIE-0150'),
    2,
    99,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FIE-0150'),
    3,
    99,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LAD-0151',
    'LADYCARE WITH WINGS YELLOW X 10PCS',
    'LADYCARE WITH WINGS YELLOW X 10PCS - Available at Kunle Ara Pharmacy',
    640.0,
    'General Medicine',
    False,
    'LADYCARE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAD-0151'),
    1,
    100,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAD-0151'),
    2,
    100,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAD-0151'),
    3,
    100,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CIP-0152',
    'CIPROBIOTIC FORTE 500MG CIPROFLOXACIN 10TABS X PKT',
    'CIPROBIOTIC FORTE 500MG CIPROFLOXACIN 10TABS X PKT - Available at Kunle Ara Pharmacy',
    660.0,
    'Pharmaceuticals',
    False,
    'CIPROBIOTIC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CIP-0152'),
    1,
    101,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CIP-0152'),
    2,
    101,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CIP-0152'),
    3,
    101,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PIL-0153',
    'PILOCARPINE 2 EYE DROP',
    'PILOCARPINE 2 EYE DROP - Available at Kunle Ara Pharmacy',
    6000.0,
    'General Medicine',
    False,
    'PILOCARPINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PIL-0153'),
    1,
    102,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PIL-0153'),
    2,
    102,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PIL-0153'),
    3,
    102,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BRU-0154',
    'BRUT DEODORANT ORIGINAL BODY SPRAY 200ML',
    'BRUT DEODORANT ORIGINAL BODY SPRAY 200ML - Available at Kunle Ara Pharmacy',
    2550.0,
    'Pharmaceuticals',
    False,
    'BRUT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BRU-0154'),
    1,
    103,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BRU-0154'),
    2,
    103,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BRU-0154'),
    3,
    103,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-TAX-0155',
    'TAXOTERE 80MG/4ML DOCETAXEL X VIAL',
    'TAXOTERE 80MG/4ML DOCETAXEL X VIAL - Available at Kunle Ara Pharmacy',
    129830.0,
    'Pharmaceuticals',
    False,
    'TAXOTERE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TAX-0155'),
    1,
    104,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TAX-0155'),
    2,
    104,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TAX-0155'),
    3,
    104,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-COL-0156',
    'COLIPAN SYRUP 60ML HYOSCINE-N-BUTYLBROMIDE X BOTTLE',
    'COLIPAN SYRUP 60ML HYOSCINE-N-BUTYLBROMIDE X BOTTLE - Available at Kunle Ara Pharmacy',
    750.0,
    'Pharmaceuticals',
    False,
    'COLIPAN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COL-0156'),
    1,
    105,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COL-0156'),
    2,
    105,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COL-0156'),
    3,
    105,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FEV-0157',
    'FEVIZ PLUS PK',
    'FEVIZ PLUS PK - Available at Kunle Ara Pharmacy',
    1000.0,
    'General Medicine',
    False,
    'FEVIZ'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FEV-0157'),
    1,
    106,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FEV-0157'),
    2,
    106,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FEV-0157'),
    3,
    106,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-TRI-0158',
    'TRIBACT CREAM 30G CLOTRIMAZOLE BETAMETHASONE NEOMYCIN X TUBE',
    'TRIBACT CREAM 30G CLOTRIMAZOLE BETAMETHASONE NEOMYCIN X TUBE - Available at Kunle Ara Pharmacy',
    600.0,
    'Personal Care',
    False,
    'TRIBACT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TRI-0158'),
    1,
    107,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TRI-0158'),
    2,
    107,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TRI-0158'),
    3,
    107,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CLI-0159',
    'CLINDA GPO 150MG CLINDAMYCIN 10CAPS X SAT',
    'CLINDA GPO 150MG CLINDAMYCIN 10CAPS X SAT - Available at Kunle Ara Pharmacy',
    1980.0,
    'Pharmaceuticals',
    False,
    'CLINDA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CLI-0159'),
    1,
    108,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CLI-0159'),
    2,
    108,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CLI-0159'),
    3,
    108,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-END-0160',
    'ENDIX G CREAM 20G ECONAZOLE TRIAMCINOLONE GENTAMICIN X TUBE',
    'ENDIX G CREAM 20G ECONAZOLE TRIAMCINOLONE GENTAMICIN X TUBE - Available at Kunle Ara Pharmacy',
    1500.0,
    'Personal Care',
    False,
    'ENDIX'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-END-0160'),
    1,
    109,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-END-0160'),
    2,
    109,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-END-0160'),
    3,
    109,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-QUA-0161',
    'QUAKER OAT 420G TIN',
    'QUAKER OAT 420G TIN - Available at Kunle Ara Pharmacy',
    3260.0,
    'General Medicine',
    False,
    'QUAKER'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-QUA-0161'),
    1,
    110,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-QUA-0161'),
    2,
    110,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-QUA-0161'),
    3,
    110,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ROY-0162',
    'ROYAL SHAVING POWDER',
    'ROYAL SHAVING POWDER - Available at Kunle Ara Pharmacy',
    2110.0,
    'General Medicine',
    False,
    'ROYAL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROY-0162'),
    1,
    111,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROY-0162'),
    2,
    111,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROY-0162'),
    3,
    111,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ANG-0163',
    'ANGEL BABY ECO LARGE 9-14KGS X36PCS',
    'ANGEL BABY ECO LARGE 9-14KGS X36PCS - Available at Kunle Ara Pharmacy',
    5230.0,
    'Baby Care',
    False,
    'ANGEL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANG-0163'),
    1,
    112,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANG-0163'),
    2,
    112,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANG-0163'),
    3,
    112,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ANG-0164',
    'ANGEL BABY DIAPER JUMBO LARGE 9-1KGS X 72PCS',
    'ANGEL BABY DIAPER JUMBO LARGE 9-1KGS X 72PCS - Available at Kunle Ara Pharmacy',
    10500.0,
    'Baby Care',
    False,
    'ANGEL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANG-0164'),
    1,
    113,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANG-0164'),
    2,
    113,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANG-0164'),
    3,
    113,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DAN-0165',
    'DANO SLIM 900G SATCHET',
    'DANO SLIM 900G SATCHET - Available at Kunle Ara Pharmacy',
    11750.0,
    'General Medicine',
    False,
    'DANO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DAN-0165'),
    1,
    114,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DAN-0165'),
    2,
    114,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DAN-0165'),
    3,
    114,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DAN-0166',
    'DANO SLIM SACHET 400G',
    'DANO SLIM SACHET 400G - Available at Kunle Ara Pharmacy',
    5700.0,
    'General Medicine',
    False,
    'DANO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DAN-0166'),
    1,
    115,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DAN-0166'),
    2,
    115,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DAN-0166'),
    3,
    115,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DR -0167',
    'DR ALADDINS 7 KEYS HERBAL MIXTURE X BOTTLE',
    'DR ALADDINS 7 KEYS HERBAL MIXTURE X BOTTLE - Available at Kunle Ara Pharmacy',
    1280.0,
    'General Medicine',
    False,
    'DR'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DR -0167'),
    1,
    116,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DR -0167'),
    2,
    116,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DR -0167'),
    3,
    116,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-INS-0168',
    'INSULIN SYRINGE X ONE PIECE',
    'INSULIN SYRINGE X ONE PIECE - Available at Kunle Ara Pharmacy',
    120.0,
    'Medical Supplies',
    False,
    'INSULIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-INS-0168'),
    1,
    117,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-INS-0168'),
    2,
    117,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-INS-0168'),
    3,
    117,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MEN-0169',
    'MENTHOLATUM',
    'MENTHOLATUM - Available at Kunle Ara Pharmacy',
    590.0,
    'General Medicine',
    False,
    'MENTHOLATUM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MEN-0169'),
    1,
    118,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MEN-0169'),
    2,
    118,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MEN-0169'),
    3,
    118,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SIL-0170',
    'SILVERCARE PLUS UNDERPADS X 1',
    'SILVERCARE PLUS UNDERPADS X 1 - Available at Kunle Ara Pharmacy',
    3360.0,
    'General Medicine',
    False,
    'SILVERCARE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIL-0170'),
    1,
    119,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIL-0170'),
    2,
    119,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIL-0170'),
    3,
    119,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CEF-0171',
    'CEFIXIME DISP 200MG BENOW PKT',
    'CEFIXIME DISP 200MG BENOW PKT - Available at Kunle Ara Pharmacy',
    840.0,
    'Pharmaceuticals',
    False,
    'CEFIXIME'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEF-0171'),
    1,
    120,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEF-0171'),
    2,
    120,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEF-0171'),
    3,
    120,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FOR-0172',
    'FORBETIC 500MG METFORMIN HYDROCHLORIDE X 10TABS X SAT',
    'FORBETIC 500MG METFORMIN HYDROCHLORIDE X 10TABS X SAT - Available at Kunle Ara Pharmacy',
    210.0,
    'Pharmaceuticals',
    False,
    'FORBETIC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FOR-0172'),
    1,
    121,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FOR-0172'),
    2,
    121,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FOR-0172'),
    3,
    121,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-AAR-0173',
    'AAROMATE ORGANIC FRESHENER',
    'AAROMATE ORGANIC FRESHENER - Available at Kunle Ara Pharmacy',
    780.0,
    'General Medicine',
    False,
    'AAROMATE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AAR-0173'),
    1,
    122,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AAR-0173'),
    2,
    122,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AAR-0173'),
    3,
    122,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CER-0174',
    'CERELAC HONEY WHEAT MILK 400G',
    'CERELAC HONEY WHEAT MILK 400G - Available at Kunle Ara Pharmacy',
    8250.0,
    'General Medicine',
    False,
    'CERELAC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0174'),
    1,
    123,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0174'),
    2,
    123,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0174'),
    3,
    123,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PEA-0175',
    'PEAK BABY INFANT FORMULAR 0-12MONTH',
    'PEAK BABY INFANT FORMULAR 0-12MONTH - Available at Kunle Ara Pharmacy',
    8710.0,
    'Baby Care',
    False,
    'PEAK'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0175'),
    1,
    124,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0175'),
    2,
    124,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0175'),
    3,
    124,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FRI-0176',
    'FRISO GOLD RICE MILK CEREAL 300G',
    'FRISO GOLD RICE MILK CEREAL 300G - Available at Kunle Ara Pharmacy',
    27500.0,
    'General Medicine',
    False,
    'FRISO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FRI-0176'),
    1,
    125,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FRI-0176'),
    2,
    125,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FRI-0176'),
    3,
    125,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FRI-0177',
    'FRISO GOLD WHEAT MILK CEREAL 300G',
    'FRISO GOLD WHEAT MILK CEREAL 300G - Available at Kunle Ara Pharmacy',
    32100.0,
    'General Medicine',
    False,
    'FRISO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FRI-0177'),
    1,
    126,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FRI-0177'),
    2,
    126,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FRI-0177'),
    3,
    126,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-AMO-0178',
    'AMOS WHITE WHITENING SOAP WITH SHEA',
    'AMOS WHITE WHITENING SOAP WITH SHEA - Available at Kunle Ara Pharmacy',
    420.0,
    'Personal Care',
    False,
    'AMOS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMO-0178'),
    1,
    127,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMO-0178'),
    2,
    127,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMO-0178'),
    3,
    127,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MY -0179',
    'MY BOY INFANT FORMULA 400G',
    'MY BOY INFANT FORMULA 400G - Available at Kunle Ara Pharmacy',
    7660.0,
    'Baby Care',
    False,
    'MY'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MY -0179'),
    1,
    128,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MY -0179'),
    2,
    128,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MY -0179'),
    3,
    128,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GOL-0180',
    'GOLDEN MORN 300G',
    'GOLDEN MORN 300G - Available at Kunle Ara Pharmacy',
    1700.0,
    'General Medicine',
    False,
    'GOLDEN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOL-0180'),
    1,
    129,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOL-0180'),
    2,
    129,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOL-0180'),
    3,
    129,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-THR-0181',
    'THREE CROWN EVAPORATED TIN',
    'THREE CROWN EVAPORATED TIN - Available at Kunle Ara Pharmacy',
    630.0,
    'General Medicine',
    False,
    'THREE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-THR-0181'),
    1,
    130,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-THR-0181'),
    2,
    130,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-THR-0181'),
    3,
    130,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-NIV-0182',
    'NIVEA NOURISHING COCOA BUTTER 5IN1 400ML',
    'NIVEA NOURISHING COCOA BUTTER 5IN1 400ML - Available at Kunle Ara Pharmacy',
    3950.0,
    'Pharmaceuticals',
    False,
    'NIVEA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NIV-0182'),
    1,
    131,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NIV-0182'),
    2,
    131,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NIV-0182'),
    3,
    131,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CER-0183',
    'CERELAC HONEY WHEAT MILK 1KG RUBBER COVER',
    'CERELAC HONEY WHEAT MILK 1KG RUBBER COVER - Available at Kunle Ara Pharmacy',
    16500.0,
    'General Medicine',
    False,
    'CERELAC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0183'),
    1,
    132,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0183'),
    2,
    132,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0183'),
    3,
    132,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BAM-0184',
    'BAMA MAYONNAISE 385ML',
    'BAMA MAYONNAISE 385ML - Available at Kunle Ara Pharmacy',
    1835.0,
    'Pharmaceuticals',
    False,
    'BAMA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAM-0184'),
    1,
    133,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAM-0184'),
    2,
    133,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAM-0184'),
    3,
    133,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DIG-0185',
    'DIGITAL ELECTRONIC PERSONAL SCALE',
    'DIGITAL ELECTRONIC PERSONAL SCALE - Available at Kunle Ara Pharmacy',
    12000.0,
    'General Medicine',
    False,
    'DIGITAL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIG-0185'),
    1,
    134,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIG-0185'),
    2,
    134,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIG-0185'),
    3,
    134,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CT -0186',
    'CT CLEAR THERAPY 250ML ORANGE',
    'CT CLEAR THERAPY 250ML ORANGE - Available at Kunle Ara Pharmacy',
    3300.0,
    'Pharmaceuticals',
    False,
    'CT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CT -0186'),
    1,
    135,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CT -0186'),
    2,
    135,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CT -0186'),
    3,
    135,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PAW-0187',
    'PAWPAW OIL 60ML',
    'PAWPAW OIL 60ML - Available at Kunle Ara Pharmacy',
    1380.0,
    'Pharmaceuticals',
    False,
    'PAWPAW'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAW-0187'),
    1,
    136,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAW-0187'),
    2,
    136,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAW-0187'),
    3,
    136,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PEA-0188',
    'PEAK FULL CREAM INSTANT MILK POWDER 900G TIN',
    'PEAK FULL CREAM INSTANT MILK POWDER 900G TIN - Available at Kunle Ara Pharmacy',
    11740.0,
    'Personal Care',
    False,
    'PEAK'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0188'),
    1,
    137,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0188'),
    2,
    137,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0188'),
    3,
    137,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PEA-0189',
    'PEAK FULL CREAM INSTANT MILK POWDER 400G TIN',
    'PEAK FULL CREAM INSTANT MILK POWDER 400G TIN - Available at Kunle Ara Pharmacy',
    5500.0,
    'Personal Care',
    False,
    'PEAK'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0189'),
    1,
    138,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0189'),
    2,
    138,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0189'),
    3,
    138,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PEA-0190',
    'PEAK FULL CREAM INSTANT MILK POWDER SATCHET X10PCS',
    'PEAK FULL CREAM INSTANT MILK POWDER SATCHET X10PCS - Available at Kunle Ara Pharmacy',
    1770.0,
    'Personal Care',
    False,
    'PEAK'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0190'),
    1,
    139,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0190'),
    2,
    139,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0190'),
    3,
    139,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PEA-0191',
    'PEAK FULL CREAM INSTANT MILK POWDER 360G SATCHET',
    'PEAK FULL CREAM INSTANT MILK POWDER 360G SATCHET - Available at Kunle Ara Pharmacy',
    4310.0,
    'Personal Care',
    False,
    'PEAK'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0191'),
    1,
    140,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0191'),
    2,
    140,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0191'),
    3,
    140,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BLU-0192',
    'BLUE BAND LOW FAT SPREAD 250G',
    'BLUE BAND LOW FAT SPREAD 250G - Available at Kunle Ara Pharmacy',
    1650.0,
    'General Medicine',
    False,
    'BLUE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0192'),
    1,
    141,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0192'),
    2,
    141,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0192'),
    3,
    141,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BLU-0193',
    'BLUE BAND LOW FAT SPREAD 75G',
    'BLUE BAND LOW FAT SPREAD 75G - Available at Kunle Ara Pharmacy',
    520.0,
    'General Medicine',
    False,
    'BLUE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0193'),
    1,
    142,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0193'),
    2,
    142,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0193'),
    3,
    142,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-X-P-0194',
    'X-PRESSION 3X RUWA BRAID COLOR 1',
    'X-PRESSION 3X RUWA BRAID COLOR 1 - Available at Kunle Ara Pharmacy',
    4070.0,
    'General Medicine',
    False,
    'X-PRESSION'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-X-P-0194'),
    1,
    143,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-X-P-0194'),
    2,
    143,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-X-P-0194'),
    3,
    143,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SEN-0195',
    'SENSODYNE DAILYCARE PROMO PACK TWO75ML ONE50ML',
    'SENSODYNE DAILYCARE PROMO PACK TWO75ML ONE50ML - Available at Kunle Ara Pharmacy',
    2920.0,
    'Pharmaceuticals',
    False,
    'SENSODYNE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0195'),
    1,
    144,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0195'),
    2,
    144,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0195'),
    3,
    144,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ZOT-0196',
    'ZOTRIM CO-TRIMOXAZOLE SUSP 240MG/5ML',
    'ZOTRIM CO-TRIMOXAZOLE SUSP 240MG/5ML - Available at Kunle Ara Pharmacy',
    570.0,
    'Pharmaceuticals',
    False,
    'ZOTRIM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ZOT-0196'),
    1,
    145,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ZOT-0196'),
    2,
    145,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ZOT-0196'),
    3,
    145,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-WIN-0197',
    'WIND AIR FRESHENER BLOCK STRAWBERRY/ APPLE 65G',
    'WIND AIR FRESHENER BLOCK STRAWBERRY/ APPLE 65G - Available at Kunle Ara Pharmacy',
    360.0,
    'General Medicine',
    False,
    'WIND'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-WIN-0197'),
    1,
    146,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-WIN-0197'),
    2,
    146,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-WIN-0197'),
    3,
    146,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SIM-0198',
    'SIMPSOM BP GREEN WATER 20MLS',
    'SIMPSOM BP GREEN WATER 20MLS - Available at Kunle Ara Pharmacy',
    6600.0,
    'Pharmaceuticals',
    False,
    'SIMPSOM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIM-0198'),
    1,
    147,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIM-0198'),
    2,
    147,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIM-0198'),
    3,
    147,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ZED-0199',
    'ZEDEX COLD PKT',
    'ZEDEX COLD PKT - Available at Kunle Ara Pharmacy',
    300.0,
    'General Medicine',
    False,
    'ZEDEX'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ZED-0199'),
    1,
    148,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ZED-0199'),
    2,
    148,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ZED-0199'),
    3,
    148,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ANG-0200',
    'ANGITEL 40MG X SAT',
    'ANGITEL 40MG X SAT - Available at Kunle Ara Pharmacy',
    760.0,
    'Pharmaceuticals',
    False,
    'ANGITEL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANG-0200'),
    1,
    149,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANG-0200'),
    2,
    149,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANG-0200'),
    3,
    149,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ESO-0201',
    'ESOFAG -D ESOMEPRAZOE 40MG DOMEPERIDONE 30MG 10TABS X SACHET',
    'ESOFAG -D ESOMEPRAZOE 40MG DOMEPERIDONE 30MG 10TABS X SACHET - Available at Kunle Ara Pharmacy',
    1960.0,
    'Pharmaceuticals',
    False,
    'ESOFAG'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ESO-0201'),
    1,
    50,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ESO-0201'),
    2,
    50,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ESO-0201'),
    3,
    50,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ACL-0202',
    'ACLOTIL 75MG CLOPIDOGREL X SAT',
    'ACLOTIL 75MG CLOPIDOGREL X SAT - Available at Kunle Ara Pharmacy',
    300.0,
    'Pharmaceuticals',
    False,
    'ACLOTIL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ACL-0202'),
    1,
    51,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ACL-0202'),
    2,
    51,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ACL-0202'),
    3,
    51,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MAG-0203',
    'MAGIC YOUR LIFE LIP OIL',
    'MAGIC YOUR LIFE LIP OIL - Available at Kunle Ara Pharmacy',
    450.0,
    'General Medicine',
    False,
    'MAGIC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAG-0203'),
    1,
    52,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAG-0203'),
    2,
    52,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAG-0203'),
    3,
    52,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GAB-0204',
    'GAB-M SACHET X10TABS',
    'GAB-M SACHET X10TABS - Available at Kunle Ara Pharmacy',
    480.0,
    'General Medicine',
    False,
    'GAB-M'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAB-0204'),
    1,
    53,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAB-0204'),
    2,
    53,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAB-0204'),
    3,
    53,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CLA-0205',
    'CLARTEM QS 80/480MG ARTEMETHER 80MG LUMEFANTRINE 480MG 6TABS X PKT',
    'CLARTEM QS 80/480MG ARTEMETHER 80MG LUMEFANTRINE 480MG 6TABS X PKT - Available at Kunle Ara Pharmacy',
    990.0,
    'Pharmaceuticals',
    False,
    'CLARTEM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CLA-0205'),
    1,
    54,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CLA-0205'),
    2,
    54,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CLA-0205'),
    3,
    54,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-AMP-0206',
    'AMPICILLIN AND CLOXACILLIN 500MG KRISCLOX 10CAPS X SACHET',
    'AMPICILLIN AND CLOXACILLIN 500MG KRISCLOX 10CAPS X SACHET - Available at Kunle Ara Pharmacy',
    530.0,
    'Pharmaceuticals',
    False,
    'AMPICILLIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMP-0206'),
    1,
    55,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMP-0206'),
    2,
    55,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMP-0206'),
    3,
    55,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EL -0207',
    'EL GAZELLE BIG CHICKEN KILISHI',
    'EL GAZELLE BIG CHICKEN KILISHI - Available at Kunle Ara Pharmacy',
    990.0,
    'General Medicine',
    False,
    'EL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EL -0207'),
    1,
    56,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EL -0207'),
    2,
    56,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EL -0207'),
    3,
    56,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ALM-0208',
    'ALMIITRON SOFTGEL 80/480MG ARTEMETHER LUMEFANTRINE 6TABS X PKT',
    'ALMIITRON SOFTGEL 80/480MG ARTEMETHER LUMEFANTRINE 6TABS X PKT - Available at Kunle Ara Pharmacy',
    2040.0,
    'Pharmaceuticals',
    False,
    'ALMIITRON'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ALM-0208'),
    1,
    57,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ALM-0208'),
    2,
    57,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ALM-0208'),
    3,
    57,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LIT-0209',
    'LITTLE GIRL 3PIECES BAND',
    'LITTLE GIRL 3PIECES BAND - Available at Kunle Ara Pharmacy',
    1000.0,
    'General Medicine',
    False,
    'LITTLE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIT-0209'),
    1,
    58,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIT-0209'),
    2,
    58,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIT-0209'),
    3,
    58,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-KIS-0210',
    'KISSKIDS EMBRACE SOFT BABY DIAPER MIDI SIZE 3 X 50PCS',
    'KISSKIDS EMBRACE SOFT BABY DIAPER MIDI SIZE 3 X 50PCS - Available at Kunle Ara Pharmacy',
    6000.0,
    'Baby Care',
    False,
    'KISSKIDS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KIS-0210'),
    1,
    59,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KIS-0210'),
    2,
    59,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KIS-0210'),
    3,
    59,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BAB-0211',
    'BABY LIP BALM WITH OIL',
    'BABY LIP BALM WITH OIL - Available at Kunle Ara Pharmacy',
    690.0,
    'Baby Care',
    False,
    'BABY'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0211'),
    1,
    60,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0211'),
    2,
    60,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0211'),
    3,
    60,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MAR-0212',
    'MARVICO NUTMEG POWDER 5G X10',
    'MARVICO NUTMEG POWDER 5G X10 - Available at Kunle Ara Pharmacy',
    1100.0,
    'General Medicine',
    False,
    'MARVICO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAR-0212'),
    1,
    61,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAR-0212'),
    2,
    61,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAR-0212'),
    3,
    61,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BAF-0213',
    'BAFAMA CREAM 30G X TUBE',
    'BAFAMA CREAM 30G X TUBE - Available at Kunle Ara Pharmacy',
    580.0,
    'Personal Care',
    False,
    'BAFAMA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAF-0213'),
    1,
    62,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAF-0213'),
    2,
    62,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAF-0213'),
    3,
    62,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LIP-0214',
    'LIPIKIND 10MG XSAT',
    'LIPIKIND 10MG XSAT - Available at Kunle Ara Pharmacy',
    580.0,
    'Pharmaceuticals',
    False,
    'LIPIKIND'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIP-0214'),
    1,
    63,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIP-0214'),
    2,
    63,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LIP-0214'),
    3,
    63,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LAV-0215',
    'LAVERA SANDWICH BISCUITS BIG XPACKET',
    'LAVERA SANDWICH BISCUITS BIG XPACKET - Available at Kunle Ara Pharmacy',
    1380.0,
    'General Medicine',
    False,
    'LAVERA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAV-0215'),
    1,
    64,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAV-0215'),
    2,
    64,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAV-0215'),
    3,
    64,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MAR-0216',
    'MARCNOL 5/2.5MG AMLODIPINE RAMIPRIL 10TABS X SACHET',
    'MARCNOL 5/2.5MG AMLODIPINE RAMIPRIL 10TABS X SACHET - Available at Kunle Ara Pharmacy',
    750.0,
    'Pharmaceuticals',
    False,
    'MARCNOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAR-0216'),
    1,
    65,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAR-0216'),
    2,
    65,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAR-0216'),
    3,
    65,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-NEU-0217',
    'NEUROGESIC EXTRA 35G X TUBE',
    'NEUROGESIC EXTRA 35G X TUBE - Available at Kunle Ara Pharmacy',
    1320.0,
    'General Medicine',
    False,
    'NEUROGESIC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NEU-0217'),
    1,
    66,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NEU-0217'),
    2,
    66,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NEU-0217'),
    3,
    66,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PAR-0218',
    'PARLE-G GLUCO BISCUITS 30G',
    'PARLE-G GLUCO BISCUITS 30G - Available at Kunle Ara Pharmacy',
    100.0,
    'General Medicine',
    False,
    'PARLE-G'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAR-0218'),
    1,
    67,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAR-0218'),
    2,
    67,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAR-0218'),
    3,
    67,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ORI-0219',
    'ORIGINAL OYIN AYO HONEY 500ML',
    'ORIGINAL OYIN AYO HONEY 500ML - Available at Kunle Ara Pharmacy',
    3850.0,
    'Pharmaceuticals',
    False,
    'ORIGINAL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ORI-0219'),
    1,
    68,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ORI-0219'),
    2,
    68,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ORI-0219'),
    3,
    68,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SPI-0220',
    'SPIDOL 75MG CLOPIDOGREL 7TABS X SATCHET',
    'SPIDOL 75MG CLOPIDOGREL 7TABS X SATCHET - Available at Kunle Ara Pharmacy',
    660.0,
    'Pharmaceuticals',
    False,
    'SPIDOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SPI-0220'),
    1,
    69,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SPI-0220'),
    2,
    69,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SPI-0220'),
    3,
    69,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DIC-0221',
    'DICLOFENAC EYE DROP DGF',
    'DICLOFENAC EYE DROP DGF - Available at Kunle Ara Pharmacy',
    1260.0,
    'General Medicine',
    False,
    'DICLOFENAC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIC-0221'),
    1,
    70,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIC-0221'),
    2,
    70,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIC-0221'),
    3,
    70,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-VAS-0222',
    'VASELINE ESSENTIAL EVENTONE SPF24 LOTION 400ML',
    'VASELINE ESSENTIAL EVENTONE SPF24 LOTION 400ML - Available at Kunle Ara Pharmacy',
    3710.0,
    'Pharmaceuticals',
    False,
    'VASELINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0222'),
    1,
    71,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0222'),
    2,
    71,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0222'),
    3,
    71,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-VAS-0223',
    'VASELINE ALOE SOOTHE NON GREASY LOTION 400ML',
    'VASELINE ALOE SOOTHE NON GREASY LOTION 400ML - Available at Kunle Ara Pharmacy',
    3710.0,
    'Pharmaceuticals',
    False,
    'VASELINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0223'),
    1,
    72,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0223'),
    2,
    72,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0223'),
    3,
    72,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-VAS-0224',
    'VASELINE COCOA RADIANTT NON GREASY 400ML',
    'VASELINE COCOA RADIANTT NON GREASY 400ML - Available at Kunle Ara Pharmacy',
    3710.0,
    'Pharmaceuticals',
    False,
    'VASELINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0224'),
    1,
    73,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0224'),
    2,
    73,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0224'),
    3,
    73,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MET-0225',
    'METRONIDAZOLE 200MG COUNTING X TAB',
    'METRONIDAZOLE 200MG COUNTING X TAB - Available at Kunle Ara Pharmacy',
    10.0,
    'Pharmaceuticals',
    False,
    'METRONIDAZOLE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MET-0225'),
    1,
    74,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MET-0225'),
    2,
    74,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MET-0225'),
    3,
    74,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MUL-0226',
    'MULTIVITE TAB COUNTING X TAB',
    'MULTIVITE TAB COUNTING X TAB - Available at Kunle Ara Pharmacy',
    5.0,
    'General Medicine',
    False,
    'MULTIVITE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MUL-0226'),
    1,
    75,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MUL-0226'),
    2,
    75,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MUL-0226'),
    3,
    75,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CAL-0227',
    'CALCIUM 300MGTAB COUNT',
    'CALCIUM 300MGTAB COUNT - Available at Kunle Ara Pharmacy',
    6.0,
    'Pharmaceuticals',
    False,
    'CALCIUM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAL-0227'),
    1,
    76,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAL-0227'),
    2,
    76,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAL-0227'),
    3,
    76,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FER-0228',
    'FERSOLATE FERROUS SULPHATE COUNTING X TAB',
    'FERSOLATE FERROUS SULPHATE COUNTING X TAB - Available at Kunle Ara Pharmacy',
    5.0,
    'General Medicine',
    False,
    'FERSOLATE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FER-0228'),
    1,
    77,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FER-0228'),
    2,
    77,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FER-0228'),
    3,
    77,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ASP-0229',
    'ASPIRIN 300MG TAB',
    'ASPIRIN 300MG TAB - Available at Kunle Ara Pharmacy',
    5.0,
    'Pharmaceuticals',
    False,
    'ASPIRIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ASP-0229'),
    1,
    78,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ASP-0229'),
    2,
    78,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ASP-0229'),
    3,
    78,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PIR-0230',
    'PIRITON TAB COUNTING X TAB',
    'PIRITON TAB COUNTING X TAB - Available at Kunle Ara Pharmacy',
    2.0,
    'General Medicine',
    False,
    'PIRITON'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PIR-0230'),
    1,
    79,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PIR-0230'),
    2,
    79,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PIR-0230'),
    3,
    79,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PAR-0231',
    'PARACETAMOL EMZOR 500MG 12TABS X SAT',
    'PARACETAMOL EMZOR 500MG 12TABS X SAT - Available at Kunle Ara Pharmacy',
    150.0,
    'Pharmaceuticals',
    False,
    'PARACETAMOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAR-0231'),
    1,
    80,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAR-0231'),
    2,
    80,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAR-0231'),
    3,
    80,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-AMI-0232',
    'AMINOPHYLLINE 100MG COUNTING X TAB',
    'AMINOPHYLLINE 100MG COUNTING X TAB - Available at Kunle Ara Pharmacy',
    10.0,
    'Pharmaceuticals',
    False,
    'AMINOPHYLLINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMI-0232'),
    1,
    81,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMI-0232'),
    2,
    81,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMI-0232'),
    3,
    81,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DAP-0233',
    'DAPSONE 100MG COUNTING X TAB',
    'DAPSONE 100MG COUNTING X TAB - Available at Kunle Ara Pharmacy',
    10.0,
    'Pharmaceuticals',
    False,
    'DAPSONE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DAP-0233'),
    1,
    82,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DAP-0233'),
    2,
    82,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DAP-0233'),
    3,
    82,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-C/P-0234',
    'C/PROMAZINE 50MG COUNTING X TAB',
    'C/PROMAZINE 50MG COUNTING X TAB - Available at Kunle Ara Pharmacy',
    10.0,
    'Pharmaceuticals',
    False,
    'C/PROMAZINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-C/P-0234'),
    1,
    83,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-C/P-0234'),
    2,
    83,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-C/P-0234'),
    3,
    83,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BEN-0235',
    'BENDROFLUAZIDE 5MG COUNTING X TAB',
    'BENDROFLUAZIDE 5MG COUNTING X TAB - Available at Kunle Ara Pharmacy',
    10.0,
    'Pharmaceuticals',
    False,
    'BENDROFLUAZIDE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BEN-0235'),
    1,
    84,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BEN-0235'),
    2,
    84,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BEN-0235'),
    3,
    84,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FRU-0236',
    'FRUSEMIDE TAB COUNTING X TAB',
    'FRUSEMIDE TAB COUNTING X TAB - Available at Kunle Ara Pharmacy',
    10.0,
    'General Medicine',
    False,
    'FRUSEMIDE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FRU-0236'),
    1,
    85,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FRU-0236'),
    2,
    85,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FRU-0236'),
    3,
    85,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-HYD-0237',
    'HYDROCHLORTHIAZIDE 50MG XTAB',
    'HYDROCHLORTHIAZIDE 50MG XTAB - Available at Kunle Ara Pharmacy',
    6.0,
    'Pharmaceuticals',
    False,
    'HYDROCHLORTHIAZIDE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HYD-0237'),
    1,
    86,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HYD-0237'),
    2,
    86,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HYD-0237'),
    3,
    86,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SPI-0238',
    'SPIRINOLACTONE 25MG COUNTING X TAB',
    'SPIRINOLACTONE 25MG COUNTING X TAB - Available at Kunle Ara Pharmacy',
    70.0,
    'Pharmaceuticals',
    False,
    'SPIRINOLACTONE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SPI-0238'),
    1,
    87,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SPI-0238'),
    2,
    87,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SPI-0238'),
    3,
    87,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-NIT-0239',
    'NITROFURANTOIN 100MG COUNTING X TAB',
    'NITROFURANTOIN 100MG COUNTING X TAB - Available at Kunle Ara Pharmacy',
    30.0,
    'Pharmaceuticals',
    False,
    'NITROFURANTOIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NIT-0239'),
    1,
    88,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NIT-0239'),
    2,
    88,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NIT-0239'),
    3,
    88,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PYR-0240',
    'PYRIDOXINE B6 50MG COUNTING X TAB',
    'PYRIDOXINE B6 50MG COUNTING X TAB - Available at Kunle Ara Pharmacy',
    10.0,
    'Pharmaceuticals',
    False,
    'PYRIDOXINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PYR-0240'),
    1,
    89,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PYR-0240'),
    2,
    89,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PYR-0240'),
    3,
    89,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-KET-0241',
    'KETRAX TAB COUNTING LEVAMISOLE X TAB',
    'KETRAX TAB COUNTING LEVAMISOLE X TAB - Available at Kunle Ara Pharmacy',
    10.0,
    'General Medicine',
    False,
    'KETRAX'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KET-0241'),
    1,
    90,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KET-0241'),
    2,
    90,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-KET-0241'),
    3,
    90,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-C/P-0242',
    'C/PROMAZINE 100MG COUNTING X TAB',
    'C/PROMAZINE 100MG COUNTING X TAB - Available at Kunle Ara Pharmacy',
    30.0,
    'Pharmaceuticals',
    False,
    'C/PROMAZINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-C/P-0242'),
    1,
    91,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-C/P-0242'),
    2,
    91,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-C/P-0242'),
    3,
    91,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PAR-0243',
    'PARACETAMOL 500MG COUNTING X TAB',
    'PARACETAMOL 500MG COUNTING X TAB - Available at Kunle Ara Pharmacy',
    10.0,
    'Pharmaceuticals',
    False,
    'PARACETAMOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAR-0243'),
    1,
    92,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAR-0243'),
    2,
    92,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAR-0243'),
    3,
    92,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CHL-0244',
    'CHLOROQUINE COUNTING X TAB',
    'CHLOROQUINE COUNTING X TAB - Available at Kunle Ara Pharmacy',
    50.0,
    'General Medicine',
    False,
    'CHLOROQUINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CHL-0244'),
    1,
    93,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CHL-0244'),
    2,
    93,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CHL-0244'),
    3,
    93,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DIG-0245',
    'DIGOXIN TAB 0.25MG',
    'DIGOXIN TAB 0.25MG - Available at Kunle Ara Pharmacy',
    20.0,
    'Pharmaceuticals',
    False,
    'DIGOXIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIG-0245'),
    1,
    94,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIG-0245'),
    2,
    94,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIG-0245'),
    3,
    94,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BAB-0246',
    'BABYMED GENTLE LOTION 800ML',
    'BABYMED GENTLE LOTION 800ML - Available at Kunle Ara Pharmacy',
    5500.0,
    'Pharmaceuticals',
    False,
    'BABYMED'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0246'),
    1,
    95,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0246'),
    2,
    95,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0246'),
    3,
    95,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BAB-0247',
    'BABYMED GENTLE SOAP 175G',
    'BABYMED GENTLE SOAP 175G - Available at Kunle Ara Pharmacy',
    1400.0,
    'Personal Care',
    False,
    'BABYMED'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0247'),
    1,
    96,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0247'),
    2,
    96,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0247'),
    3,
    96,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PAW-0248',
    'PAWPAW CLARIFYING LOTION 500ML',
    'PAWPAW CLARIFYING LOTION 500ML - Available at Kunle Ara Pharmacy',
    4770.0,
    'Pharmaceuticals',
    False,
    'PAWPAW'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAW-0248'),
    1,
    97,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAW-0248'),
    2,
    97,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAW-0248'),
    3,
    97,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CAR-0249',
    'CAROWHITE LIGHTDROPS SERUM 5AMPLES',
    'CAROWHITE LIGHTDROPS SERUM 5AMPLES - Available at Kunle Ara Pharmacy',
    1300.0,
    'General Medicine',
    False,
    'CAROWHITE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAR-0249'),
    1,
    98,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAR-0249'),
    2,
    98,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAR-0249'),
    3,
    98,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PAW-0250',
    'PAWPAW LIGHTENING SHOWER GEL 500ML',
    'PAWPAW LIGHTENING SHOWER GEL 500ML - Available at Kunle Ara Pharmacy',
    4950.0,
    'Pharmaceuticals',
    False,
    'PAWPAW'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAW-0250'),
    1,
    99,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAW-0250'),
    2,
    99,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAW-0250'),
    3,
    99,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-TER-0251',
    'TERRA CHICKEN X50CUBES PKT',
    'TERRA CHICKEN X50CUBES PKT - Available at Kunle Ara Pharmacy',
    940.0,
    'General Medicine',
    False,
    'TERRA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TER-0251'),
    1,
    100,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TER-0251'),
    2,
    100,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TER-0251'),
    3,
    100,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BLU-0252',
    'BLUE BAND ORIGINAL FAT SPREAD 450G',
    'BLUE BAND ORIGINAL FAT SPREAD 450G - Available at Kunle Ara Pharmacy',
    3720.0,
    'General Medicine',
    False,
    'BLUE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0252'),
    1,
    101,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0252'),
    2,
    101,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0252'),
    3,
    101,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BLU-0253',
    'BLUE BAND ORIGINAL FAT SPREAD 250G',
    'BLUE BAND ORIGINAL FAT SPREAD 250G - Available at Kunle Ara Pharmacy',
    2300.0,
    'General Medicine',
    False,
    'BLUE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0253'),
    1,
    102,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0253'),
    2,
    102,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0253'),
    3,
    102,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BLU-0254',
    'BLUE BAND LOW FAT SPREAD 900G',
    'BLUE BAND LOW FAT SPREAD 900G - Available at Kunle Ara Pharmacy',
    4310.0,
    'General Medicine',
    False,
    'BLUE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0254'),
    1,
    103,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0254'),
    2,
    103,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLU-0254'),
    3,
    103,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PEA-0255',
    'PEAK 1-2-3YEARS GROWING UP MILK 360G SACHET',
    'PEAK 1-2-3YEARS GROWING UP MILK 360G SACHET - Available at Kunle Ara Pharmacy',
    4770.0,
    'General Medicine',
    False,
    'PEAK'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0255'),
    1,
    104,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0255'),
    2,
    104,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEA-0255'),
    3,
    104,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PUR-0256',
    'PURIT ANTISEPTIC 125ML',
    'PURIT ANTISEPTIC 125ML - Available at Kunle Ara Pharmacy',
    1455.0,
    'Pharmaceuticals',
    False,
    'PURIT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0256'),
    1,
    105,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0256'),
    2,
    105,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0256'),
    3,
    105,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PUR-0257',
    'PURIT ANTISEPTIC 250ML',
    'PURIT ANTISEPTIC 250ML - Available at Kunle Ara Pharmacy',
    2450.0,
    'Pharmaceuticals',
    False,
    'PURIT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0257'),
    1,
    106,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0257'),
    2,
    106,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0257'),
    3,
    106,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PUR-0258',
    'PURIT ANTISEPTIC 500ML',
    'PURIT ANTISEPTIC 500ML - Available at Kunle Ara Pharmacy',
    4760.0,
    'Pharmaceuticals',
    False,
    'PURIT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0258'),
    1,
    107,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0258'),
    2,
    107,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0258'),
    3,
    107,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAF-0259',
    'SAFE CUT 125ML',
    'SAFE CUT 125ML - Available at Kunle Ara Pharmacy',
    930.0,
    'Pharmaceuticals',
    False,
    'SAFE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAF-0259'),
    1,
    108,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAF-0259'),
    2,
    108,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAF-0259'),
    3,
    108,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PUR-0260',
    'PURIT 2LITERS',
    'PURIT 2LITERS - Available at Kunle Ara Pharmacy',
    11660.0,
    'General Medicine',
    False,
    'PURIT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0260'),
    1,
    109,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0260'),
    2,
    109,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0260'),
    3,
    109,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ALW-0261',
    'ALWAYS ULTRA THIN 3IN1 X 7PADS',
    'ALWAYS ULTRA THIN 3IN1 X 7PADS - Available at Kunle Ara Pharmacy',
    1200.0,
    'General Medicine',
    False,
    'ALWAYS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ALW-0261'),
    1,
    110,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ALW-0261'),
    2,
    110,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ALW-0261'),
    3,
    110,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ALW-0262',
    'ALWAYS ULTRA THIN X14 BLUE',
    'ALWAYS ULTRA THIN X14 BLUE - Available at Kunle Ara Pharmacy',
    2260.0,
    'General Medicine',
    False,
    'ALWAYS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ALW-0262'),
    1,
    111,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ALW-0262'),
    2,
    111,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ALW-0262'),
    3,
    111,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LAR-0263',
    'LARSOR TOMATO SEASONING 100G',
    'LARSOR TOMATO SEASONING 100G - Available at Kunle Ara Pharmacy',
    800.0,
    'General Medicine',
    False,
    'LARSOR'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAR-0263'),
    1,
    112,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAR-0263'),
    2,
    112,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAR-0263'),
    3,
    112,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LAR-0264',
    'LARSOR CHICKEN SEASONING X10PCS',
    'LARSOR CHICKEN SEASONING X10PCS - Available at Kunle Ara Pharmacy',
    800.0,
    'General Medicine',
    False,
    'LARSOR'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAR-0264'),
    1,
    113,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAR-0264'),
    2,
    113,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAR-0264'),
    3,
    113,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LAR-0265',
    'LARSOR FRIED RICE SEASONING 100G',
    'LARSOR FRIED RICE SEASONING 100G - Available at Kunle Ara Pharmacy',
    800.0,
    'General Medicine',
    False,
    'LARSOR'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAR-0265'),
    1,
    114,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAR-0265'),
    2,
    114,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAR-0265'),
    3,
    114,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FUR-0266',
    'FUROCYST POLYCYSTIC OVARY XPKT',
    'FUROCYST POLYCYSTIC OVARY XPKT - Available at Kunle Ara Pharmacy',
    36000.0,
    'General Medicine',
    False,
    'FUROCYST'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FUR-0266'),
    1,
    115,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FUR-0266'),
    2,
    115,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FUR-0266'),
    3,
    115,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-JOH-0267',
    'JOHNSON COTTON BUD X200PCS',
    'JOHNSON COTTON BUD X200PCS - Available at Kunle Ara Pharmacy',
    1200.0,
    'General Medicine',
    False,
    'JOHNSON'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JOH-0267'),
    1,
    116,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JOH-0267'),
    2,
    116,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JOH-0267'),
    3,
    116,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-HAY-0268',
    'HAYAATI LATTAFA BLACK PERFUME 100MLS',
    'HAYAATI LATTAFA BLACK PERFUME 100MLS - Available at Kunle Ara Pharmacy',
    18800.0,
    'Pharmaceuticals',
    False,
    'HAYAATI'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HAY-0268'),
    1,
    117,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HAY-0268'),
    2,
    117,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HAY-0268'),
    3,
    117,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OUD-0269',
    'OUD FOR GLORY PERFUME 100ML',
    'OUD FOR GLORY PERFUME 100ML - Available at Kunle Ara Pharmacy',
    30800.0,
    'Pharmaceuticals',
    False,
    'OUD'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OUD-0269'),
    1,
    118,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OUD-0269'),
    2,
    118,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OUD-0269'),
    3,
    118,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LUX-0270',
    'LUXE LATTAFA PERFUME 100ML',
    'LUXE LATTAFA PERFUME 100ML - Available at Kunle Ara Pharmacy',
    24200.0,
    'Pharmaceuticals',
    False,
    'LUXE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUX-0270'),
    1,
    119,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUX-0270'),
    2,
    119,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LUX-0270'),
    3,
    119,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-QAE-0271',
    'QAED AL FURSAN PERFUME 90ML',
    'QAED AL FURSAN PERFUME 90ML - Available at Kunle Ara Pharmacy',
    7200.0,
    'Pharmaceuticals',
    False,
    'QAED'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-QAE-0271'),
    1,
    120,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-QAE-0271'),
    2,
    120,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-QAE-0271'),
    3,
    120,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAM-0272',
    'SAMJONES AMLODIPINE 10MG XSACHET',
    'SAMJONES AMLODIPINE 10MG XSACHET - Available at Kunle Ara Pharmacy',
    410.0,
    'Pharmaceuticals',
    False,
    'SAMJONES'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAM-0272'),
    1,
    121,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAM-0272'),
    2,
    121,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAM-0272'),
    3,
    121,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-VES-0273',
    'VESICARE 5MG X10TABS SACHET',
    'VESICARE 5MG X10TABS SACHET - Available at Kunle Ara Pharmacy',
    5200.0,
    'Pharmaceuticals',
    False,
    'VESICARE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VES-0273'),
    1,
    122,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VES-0273'),
    2,
    122,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VES-0273'),
    3,
    122,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MAL-0274',
    'MALAL DISPERSIBLEX6 XPKT',
    'MALAL DISPERSIBLEX6 XPKT - Available at Kunle Ara Pharmacy',
    200.0,
    'General Medicine',
    False,
    'MALAL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAL-0274'),
    1,
    123,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAL-0274'),
    2,
    123,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAL-0274'),
    3,
    123,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MDP-0275',
    'MDP YITE WHITE TONE GLUTA/GOLD/CARROT SOAP 200G',
    'MDP YITE WHITE TONE GLUTA/GOLD/CARROT SOAP 200G - Available at Kunle Ara Pharmacy',
    2300.0,
    'Personal Care',
    False,
    'MDP'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MDP-0275'),
    1,
    124,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MDP-0275'),
    2,
    124,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MDP-0275'),
    3,
    124,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PAN-0276',
    'PANDA COLD DROP PARACETA CHLORPHENIRAMINE 15ML',
    'PANDA COLD DROP PARACETA CHLORPHENIRAMINE 15ML - Available at Kunle Ara Pharmacy',
    1500.0,
    'Pharmaceuticals',
    False,
    'PANDA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAN-0276'),
    1,
    125,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAN-0276'),
    2,
    125,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAN-0276'),
    3,
    125,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LAR-0277',
    'LARIACT 20/120 PKT',
    'LARIACT 20/120 PKT - Available at Kunle Ara Pharmacy',
    240.0,
    'General Medicine',
    False,
    'LARIACT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAR-0277'),
    1,
    126,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAR-0277'),
    2,
    126,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LAR-0277'),
    3,
    126,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-X-P-0278',
    'X-PRESSION RUWA BRAID COLOR 33',
    'X-PRESSION RUWA BRAID COLOR 33 - Available at Kunle Ara Pharmacy',
    3580.0,
    'General Medicine',
    False,
    'X-PRESSION'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-X-P-0278'),
    1,
    127,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-X-P-0278'),
    2,
    127,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-X-P-0278'),
    3,
    127,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CAM-0279',
    'CAMARA MEASURE BODY SPRAY 250ML',
    'CAMARA MEASURE BODY SPRAY 250ML - Available at Kunle Ara Pharmacy',
    3150.0,
    'Pharmaceuticals',
    False,
    'CAMARA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAM-0279'),
    1,
    128,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAM-0279'),
    2,
    128,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAM-0279'),
    3,
    128,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CAM-0280',
    'CAMARA MONARCH BODY SPRAY 250ML',
    'CAMARA MONARCH BODY SPRAY 250ML - Available at Kunle Ara Pharmacy',
    3150.0,
    'Pharmaceuticals',
    False,
    'CAMARA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAM-0280'),
    1,
    129,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAM-0280'),
    2,
    129,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAM-0280'),
    3,
    129,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GOO-0281',
    'GOOD DAY CHUNKIES CHOCOCHIP 150G',
    'GOOD DAY CHUNKIES CHOCOCHIP 150G - Available at Kunle Ara Pharmacy',
    1300.0,
    'General Medicine',
    False,
    'GOOD'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOO-0281'),
    1,
    130,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOO-0281'),
    2,
    130,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GOO-0281'),
    3,
    130,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BOU-0282',
    'BOURBON BRITANNIA ORIGINAL CHOCOLATE BISCUIT 2X100G',
    'BOURBON BRITANNIA ORIGINAL CHOCOLATE BISCUIT 2X100G - Available at Kunle Ara Pharmacy',
    1250.0,
    'General Medicine',
    False,
    'BOURBON'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BOU-0282'),
    1,
    131,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BOU-0282'),
    2,
    131,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BOU-0282'),
    3,
    131,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ROY-0283',
    'ROYAL GAD LYSOL 60ML',
    'ROYAL GAD LYSOL 60ML - Available at Kunle Ara Pharmacy',
    200.0,
    'Pharmaceuticals',
    False,
    'ROYAL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROY-0283'),
    1,
    132,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROY-0283'),
    2,
    132,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROY-0283'),
    3,
    132,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAI-0284',
    'SAIDA FOREVER BISCUIT STUFFED WITH COCOA CREAM 100G',
    'SAIDA FOREVER BISCUIT STUFFED WITH COCOA CREAM 100G - Available at Kunle Ara Pharmacy',
    300.0,
    'Personal Care',
    False,
    'SAIDA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAI-0284'),
    1,
    133,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAI-0284'),
    2,
    133,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAI-0284'),
    3,
    133,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAI-0285',
    'SAIDA DARK CHOCOLATE BISCUIT 100G',
    'SAIDA DARK CHOCOLATE BISCUIT 100G - Available at Kunle Ara Pharmacy',
    300.0,
    'General Medicine',
    False,
    'SAIDA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAI-0285'),
    1,
    134,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAI-0285'),
    2,
    134,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAI-0285'),
    3,
    134,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAI-0286',
    'SAIDA TRENDY CHOCOLATE BISCIUTSWITH COCOA CREAM 100G',
    'SAIDA TRENDY CHOCOLATE BISCIUTSWITH COCOA CREAM 100G - Available at Kunle Ara Pharmacy',
    300.0,
    'Personal Care',
    False,
    'SAIDA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAI-0286'),
    1,
    135,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAI-0286'),
    2,
    135,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAI-0286'),
    3,
    135,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OPT-0287',
    'OPTAFEN EYE DROP 10ML TIMOLOL MALEATE 0.5 X BOTTLE',
    'OPTAFEN EYE DROP 10ML TIMOLOL MALEATE 0.5 X BOTTLE - Available at Kunle Ara Pharmacy',
    1140.0,
    'Pharmaceuticals',
    False,
    'OPTAFEN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OPT-0287'),
    1,
    136,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OPT-0287'),
    2,
    136,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OPT-0287'),
    3,
    136,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CET-0288',
    'CETAFENAC 500/50MG PARACETAMOL DICLOFENAC 10TAB XPACK',
    'CETAFENAC 500/50MG PARACETAMOL DICLOFENAC 10TAB XPACK - Available at Kunle Ara Pharmacy',
    540.0,
    'Pharmaceuticals',
    False,
    'CETAFENAC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CET-0288'),
    1,
    137,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CET-0288'),
    2,
    137,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CET-0288'),
    3,
    137,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CET-0289',
    'CETIN LORATADINE 10MG 10TAB XSAT',
    'CETIN LORATADINE 10MG 10TAB XSAT - Available at Kunle Ara Pharmacy',
    110.0,
    'Pharmaceuticals',
    False,
    'CETIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CET-0289'),
    1,
    138,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CET-0289'),
    2,
    138,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CET-0289'),
    3,
    138,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-NOW-0290',
    'NOW BONE STRENGHT X 120CAPS',
    'NOW BONE STRENGHT X 120CAPS - Available at Kunle Ara Pharmacy',
    6000.0,
    'General Medicine',
    False,
    'NOW'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NOW-0290'),
    1,
    139,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NOW-0290'),
    2,
    139,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NOW-0290'),
    3,
    139,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-HIS-0291',
    'HISTOLAT 5MG LEVOCETRIZINE 10TABS X SAT',
    'HISTOLAT 5MG LEVOCETRIZINE 10TABS X SAT - Available at Kunle Ara Pharmacy',
    120.0,
    'Pharmaceuticals',
    False,
    'HISTOLAT'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HIS-0291'),
    1,
    140,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HIS-0291'),
    2,
    140,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HIS-0291'),
    3,
    140,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-NO--0292',
    'NO-PAIN 300MG ACETYL SALICYLIC ACID 10TABS X SACHET',
    'NO-PAIN 300MG ACETYL SALICYLIC ACID 10TABS X SACHET - Available at Kunle Ara Pharmacy',
    120.0,
    'Pharmaceuticals',
    False,
    'NO-PAIN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NO--0292'),
    1,
    141,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NO--0292'),
    2,
    141,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NO--0292'),
    3,
    141,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-WAL-0293',
    'WALKING FRAME WITH TYRE X1',
    'WALKING FRAME WITH TYRE X1 - Available at Kunle Ara Pharmacy',
    33600.0,
    'General Medicine',
    False,
    'WALKING'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-WAL-0293'),
    1,
    142,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-WAL-0293'),
    2,
    142,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-WAL-0293'),
    3,
    142,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CAR-0294',
    'CARTINEX RANOLAZINE EXTENTED 500MG 10TABS X SACHET',
    'CARTINEX RANOLAZINE EXTENTED 500MG 10TABS X SACHET - Available at Kunle Ara Pharmacy',
    3080.0,
    'Pharmaceuticals',
    False,
    'CARTINEX'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAR-0294'),
    1,
    143,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAR-0294'),
    2,
    143,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAR-0294'),
    3,
    143,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CLA-0295',
    'CLAVUREM 375 X PKT',
    'CLAVUREM 375 X PKT - Available at Kunle Ara Pharmacy',
    1020.0,
    'General Medicine',
    False,
    'CLAVUREM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CLA-0295'),
    1,
    144,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CLA-0295'),
    2,
    144,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CLA-0295'),
    3,
    144,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-NEX-0296',
    'NEXA 1000MG 1VIAL MEROPENEM',
    'NEXA 1000MG 1VIAL MEROPENEM - Available at Kunle Ara Pharmacy',
    10080.0,
    'Pharmaceuticals',
    False,
    'NEXA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NEX-0296'),
    1,
    145,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NEX-0296'),
    2,
    145,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-NEX-0296'),
    3,
    145,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-TAM-0297',
    'TAMARAB INJ 20MG RABEPRAZOLE X VIAL',
    'TAMARAB INJ 20MG RABEPRAZOLE X VIAL - Available at Kunle Ara Pharmacy',
    2040.0,
    'Pharmaceuticals',
    False,
    'TAMARAB'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TAM-0297'),
    1,
    146,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TAM-0297'),
    2,
    146,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TAM-0297'),
    3,
    146,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FUR-0298',
    'FUROSEMIDE 20MG ROTEX BRAND INJECT XONE AMPOULE',
    'FUROSEMIDE 20MG ROTEX BRAND INJECT XONE AMPOULE - Available at Kunle Ara Pharmacy',
    400.0,
    'Pharmaceuticals',
    False,
    'FUROSEMIDE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FUR-0298'),
    1,
    147,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FUR-0298'),
    2,
    147,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FUR-0298'),
    3,
    147,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SIL-0299',
    'SILVER CARE UNDERPAD X25',
    'SILVER CARE UNDERPAD X25 - Available at Kunle Ara Pharmacy',
    3600.0,
    'General Medicine',
    False,
    'SILVER'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIL-0299'),
    1,
    148,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIL-0299'),
    2,
    148,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SIL-0299'),
    3,
    148,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GLO-0300',
    'GLODERM CREAM 30G CLOBETASOL MICONAZOLE GENTAMYCIN X TUBE',
    'GLODERM CREAM 30G CLOBETASOL MICONAZOLE GENTAMYCIN X TUBE - Available at Kunle Ara Pharmacy',
    1020.0,
    'Personal Care',
    False,
    'GLODERM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GLO-0300'),
    1,
    149,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GLO-0300'),
    2,
    149,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GLO-0300'),
    3,
    149,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0301',
    'SMART COLLECTION PERFUME 25ML NO540',
    'SMART COLLECTION PERFUME 25ML NO540 - Available at Kunle Ara Pharmacy',
    2520.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0301'),
    1,
    50,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0301'),
    2,
    50,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0301'),
    3,
    50,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-LOS-0302',
    'LOSARTAN POTASSIUM 50MG NUSAR 10TABS X SACHET',
    'LOSARTAN POTASSIUM 50MG NUSAR 10TABS X SACHET - Available at Kunle Ara Pharmacy',
    1200.0,
    'Pharmaceuticals',
    False,
    'LOSARTAN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LOS-0302'),
    1,
    51,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LOS-0302'),
    2,
    51,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-LOS-0302'),
    3,
    51,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EAS-0303',
    'EASADOL 500MG ACETAMINOPHEN 10CAPS X SACHET',
    'EASADOL 500MG ACETAMINOPHEN 10CAPS X SACHET - Available at Kunle Ara Pharmacy',
    180.0,
    'Pharmaceuticals',
    False,
    'EASADOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EAS-0303'),
    1,
    52,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EAS-0303'),
    2,
    52,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EAS-0303'),
    3,
    52,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-HAE-0304',
    'HAEMATOVITE XPKT',
    'HAEMATOVITE XPKT - Available at Kunle Ara Pharmacy',
    360.0,
    'General Medicine',
    False,
    'HAEMATOVITE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HAE-0304'),
    1,
    53,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HAE-0304'),
    2,
    53,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HAE-0304'),
    3,
    53,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-WAY-0305',
    'WAYBILL 3',
    'WAYBILL 3 - Available at Kunle Ara Pharmacy',
    2000.0,
    'General Medicine',
    False,
    'WAYBILL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-WAY-0305'),
    1,
    54,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-WAY-0305'),
    2,
    54,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-WAY-0305'),
    3,
    54,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0306',
    'SMART COLLECTION PERFUME NO225 100ML',
    'SMART COLLECTION PERFUME NO225 100ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0306'),
    1,
    55,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0306'),
    2,
    55,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0306'),
    3,
    55,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CER-0307',
    'CERELAC WHEAT APPLE AFTER 6 MONTH 250G REFILL',
    'CERELAC WHEAT APPLE AFTER 6 MONTH 250G REFILL - Available at Kunle Ara Pharmacy',
    1980.0,
    'General Medicine',
    False,
    'CERELAC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0307'),
    1,
    56,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0307'),
    2,
    56,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0307'),
    3,
    56,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0308',
    'SMART COLLECTION PERFUME NO332 100ML',
    'SMART COLLECTION PERFUME NO332 100ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0308'),
    1,
    57,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0308'),
    2,
    57,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0308'),
    3,
    57,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0309',
    'SMART COLLECTION PERFUME NO322 100ML',
    'SMART COLLECTION PERFUME NO322 100ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0309'),
    1,
    58,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0309'),
    2,
    58,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0309'),
    3,
    58,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0310',
    'SMART COLLECTION PERFUME NO94 100ML',
    'SMART COLLECTION PERFUME NO94 100ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0310'),
    1,
    59,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0310'),
    2,
    59,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0310'),
    3,
    59,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0311',
    'SMART COLLECTION PERFUME NO359 100ML',
    'SMART COLLECTION PERFUME NO359 100ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0311'),
    1,
    60,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0311'),
    2,
    60,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0311'),
    3,
    60,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0312',
    'SMART COLLECTION PERFUME NO540 100ML',
    'SMART COLLECTION PERFUME NO540 100ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0312'),
    1,
    61,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0312'),
    2,
    61,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0312'),
    3,
    61,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0313',
    'SMART COLLECTION PERFUME NO262 100ML',
    'SMART COLLECTION PERFUME NO262 100ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0313'),
    1,
    62,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0313'),
    2,
    62,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0313'),
    3,
    62,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0314',
    'SMART COLLECTION PERFUMR NO67 100ML',
    'SMART COLLECTION PERFUMR NO67 100ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0314'),
    1,
    63,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0314'),
    2,
    63,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0314'),
    3,
    63,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0315',
    'SMART COLLECTION PERFUME NO275 100ML',
    'SMART COLLECTION PERFUME NO275 100ML - Available at Kunle Ara Pharmacy',
    6450.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0315'),
    1,
    64,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0315'),
    2,
    64,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0315'),
    3,
    64,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0316',
    'SMART COLLECTION PERFUME NO28 100ML',
    'SMART COLLECTION PERFUME NO28 100ML - Available at Kunle Ara Pharmacy',
    6450.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0316'),
    1,
    65,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0316'),
    2,
    65,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0316'),
    3,
    65,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0317',
    'SMART COLLECTION PERFUME NO02 100ML',
    'SMART COLLECTION PERFUME NO02 100ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0317'),
    1,
    66,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0317'),
    2,
    66,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0317'),
    3,
    66,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0318',
    'SMART COLLECTION PERFUME NO250 100ML',
    'SMART COLLECTION PERFUME NO250 100ML - Available at Kunle Ara Pharmacy',
    6450.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0318'),
    1,
    67,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0318'),
    2,
    67,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0318'),
    3,
    67,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0319',
    'SMART COLLECTION PERFUME NO538 100ML',
    'SMART COLLECTION PERFUME NO538 100ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0319'),
    1,
    68,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0319'),
    2,
    68,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0319'),
    3,
    68,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0320',
    'SMART COLLECTION PERFUME 100 NO64',
    'SMART COLLECTION PERFUME 100 NO64 - Available at Kunle Ara Pharmacy',
    6200.0,
    'General Medicine',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0320'),
    1,
    69,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0320'),
    2,
    69,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0320'),
    3,
    69,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0321',
    'SMART COLLECTION PERFUME NO393 100ML',
    'SMART COLLECTION PERFUME NO393 100ML - Available at Kunle Ara Pharmacy',
    6420.0,
    'Pharmaceuticals',
    False,
    'SMART'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0321'),
    1,
    70,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0321'),
    2,
    70,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0321'),
    3,
    70,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAD-0322',
    'SADOER HONEY FACIAL MASK 25G',
    'SADOER HONEY FACIAL MASK 25G - Available at Kunle Ara Pharmacy',
    330.0,
    'General Medicine',
    False,
    'SADOER'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAD-0322'),
    1,
    71,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAD-0322'),
    2,
    71,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAD-0322'),
    3,
    71,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAD-0323',
    'SADOER RASPBERRY FACIAL MASK 25G',
    'SADOER RASPBERRY FACIAL MASK 25G - Available at Kunle Ara Pharmacy',
    330.0,
    'General Medicine',
    False,
    'SADOER'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAD-0323'),
    1,
    72,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAD-0323'),
    2,
    72,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAD-0323'),
    3,
    72,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAD-0324',
    'SADOER ORANGE FACIAL MASK 25G',
    'SADOER ORANGE FACIAL MASK 25G - Available at Kunle Ara Pharmacy',
    330.0,
    'General Medicine',
    False,
    'SADOER'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAD-0324'),
    1,
    73,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAD-0324'),
    2,
    73,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAD-0324'),
    3,
    73,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DR.-0325',
    'DR. MEINAIER BODY MASSAGE OIL 250MLS',
    'DR. MEINAIER BODY MASSAGE OIL 250MLS - Available at Kunle Ara Pharmacy',
    2300.0,
    'Pharmaceuticals',
    False,
    'DR.'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DR.-0325'),
    1,
    74,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DR.-0325'),
    2,
    74,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DR.-0325'),
    3,
    74,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DRU-0326',
    'DRUMAZINE PLUS CREAM 25G',
    'DRUMAZINE PLUS CREAM 25G - Available at Kunle Ara Pharmacy',
    1020.0,
    'Personal Care',
    False,
    'DRUMAZINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DRU-0326'),
    1,
    75,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DRU-0326'),
    2,
    75,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DRU-0326'),
    3,
    75,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-TOR-0327',
    'TOROLAC EYE DROP 5ML KETOROLAC TROMETHAMINE 0.5 X BOTTLE',
    'TOROLAC EYE DROP 5ML KETOROLAC TROMETHAMINE 0.5 X BOTTLE - Available at Kunle Ara Pharmacy',
    2520.0,
    'Pharmaceuticals',
    False,
    'TOROLAC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TOR-0327'),
    1,
    76,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TOR-0327'),
    2,
    76,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TOR-0327'),
    3,
    76,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OLU-0328',
    'OLUJI PURE COCOA POWDER 250g TIN',
    'OLUJI PURE COCOA POWDER 250g TIN - Available at Kunle Ara Pharmacy',
    4310.0,
    'General Medicine',
    False,
    'OLUJI'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OLU-0328'),
    1,
    77,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OLU-0328'),
    2,
    77,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OLU-0328'),
    3,
    77,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OLU-0329',
    'OLUJI PURE COCOA POWDER 250G REFILL PACKET',
    'OLUJI PURE COCOA POWDER 250G REFILL PACKET - Available at Kunle Ara Pharmacy',
    3670.0,
    'General Medicine',
    False,
    'OLUJI'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OLU-0329'),
    1,
    78,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OLU-0329'),
    2,
    78,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OLU-0329'),
    3,
    78,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ANU-0330',
    'ANUA NIACINAMIDE 10 TXA4 DARK SPOT 30ML',
    'ANUA NIACINAMIDE 10 TXA4 DARK SPOT 30ML - Available at Kunle Ara Pharmacy',
    22000.0,
    'Pharmaceuticals',
    False,
    'ANUA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANU-0330'),
    1,
    79,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANU-0330'),
    2,
    79,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANU-0330'),
    3,
    79,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SPA-0331',
    'SPANISH GARDEN CHARCOAL EMERGENCY CONDITIONER 450ML',
    'SPANISH GARDEN CHARCOAL EMERGENCY CONDITIONER 450ML - Available at Kunle Ara Pharmacy',
    3670.0,
    'Pharmaceuticals',
    False,
    'SPANISH'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SPA-0331'),
    1,
    80,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SPA-0331'),
    2,
    80,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SPA-0331'),
    3,
    80,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ROS-0332',
    'ROSHAL 10MG ROSUVASTATIN 10TABS X SAT',
    'ROSHAL 10MG ROSUVASTATIN 10TABS X SAT - Available at Kunle Ara Pharmacy',
    1600.0,
    'Pharmaceuticals',
    False,
    'ROSHAL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROS-0332'),
    1,
    81,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROS-0332'),
    2,
    81,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROS-0332'),
    3,
    81,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SEG-0333',
    'SEGO WRIST SUPPORT ELASTIC LARGE',
    'SEGO WRIST SUPPORT ELASTIC LARGE - Available at Kunle Ara Pharmacy',
    4200.0,
    'General Medicine',
    False,
    'SEGO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEG-0333'),
    1,
    82,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEG-0333'),
    2,
    82,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEG-0333'),
    3,
    82,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-VIN-0334',
    'VINOZ ANTI- DANDRUFF CONDITIONER 225ML',
    'VINOZ ANTI- DANDRUFF CONDITIONER 225ML - Available at Kunle Ara Pharmacy',
    700.0,
    'Pharmaceuticals',
    False,
    'VINOZ'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIN-0334'),
    1,
    83,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIN-0334'),
    2,
    83,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIN-0334'),
    3,
    83,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-COT-0335',
    'COTRIM 10TAB XSACHET',
    'COTRIM 10TAB XSACHET - Available at Kunle Ara Pharmacy',
    25.0,
    'General Medicine',
    False,
    'COTRIM'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COT-0335'),
    1,
    84,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COT-0335'),
    2,
    84,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COT-0335'),
    3,
    84,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-TYG-0336',
    'TYGACIL INJ 50MG',
    'TYGACIL INJ 50MG - Available at Kunle Ara Pharmacy',
    13610.0,
    'Pharmaceuticals',
    False,
    'TYGACIL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TYG-0336'),
    1,
    85,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TYG-0336'),
    2,
    85,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TYG-0336'),
    3,
    85,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EUC-0337',
    'EUCALYPTUS OIL 30ML',
    'EUCALYPTUS OIL 30ML - Available at Kunle Ara Pharmacy',
    750.0,
    'Pharmaceuticals',
    False,
    'EUCALYPTUS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EUC-0337'),
    1,
    86,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EUC-0337'),
    2,
    86,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EUC-0337'),
    3,
    86,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DIP-0338',
    'DIPLOVAS 10MG XSACHET',
    'DIPLOVAS 10MG XSACHET - Available at Kunle Ara Pharmacy',
    170.0,
    'Pharmaceuticals',
    False,
    'DIPLOVAS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIP-0338'),
    1,
    87,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIP-0338'),
    2,
    87,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIP-0338'),
    3,
    87,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CIR-0339',
    'CIRCUMCISSION SET BY 14',
    'CIRCUMCISSION SET BY 14 - Available at Kunle Ara Pharmacy',
    9600.0,
    'General Medicine',
    False,
    'CIRCUMCISSION'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CIR-0339'),
    1,
    88,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CIR-0339'),
    2,
    88,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CIR-0339'),
    3,
    88,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FOL-0340',
    'FOLIC ACID 400MCG X100TAB NATURES FIELD',
    'FOLIC ACID 400MCG X100TAB NATURES FIELD - Available at Kunle Ara Pharmacy',
    2860.0,
    'General Medicine',
    False,
    'FOLIC'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FOL-0340'),
    1,
    89,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FOL-0340'),
    2,
    89,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FOL-0340'),
    3,
    89,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-RID-0341',
    'RIDA HERBAL SUPPLEMENT X90CAPSULES',
    'RIDA HERBAL SUPPLEMENT X90CAPSULES - Available at Kunle Ara Pharmacy',
    4080.0,
    'Pharmaceuticals',
    False,
    'RIDA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-RID-0341'),
    1,
    90,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-RID-0341'),
    2,
    90,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-RID-0341'),
    3,
    90,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EXA-0342',
    'EXACLAV CO-AMOXICLAV 625MG XPKT',
    'EXACLAV CO-AMOXICLAV 625MG XPKT - Available at Kunle Ara Pharmacy',
    1440.0,
    'Pharmaceuticals',
    False,
    'EXACLAV'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EXA-0342'),
    1,
    91,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EXA-0342'),
    2,
    91,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EXA-0342'),
    3,
    91,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BET-0343',
    'BETAWOMAN X30SOFTGEL XPKT',
    'BETAWOMAN X30SOFTGEL XPKT - Available at Kunle Ara Pharmacy',
    8040.0,
    'General Medicine',
    False,
    'BETAWOMAN'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BET-0343'),
    1,
    92,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BET-0343'),
    2,
    92,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BET-0343'),
    3,
    92,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ACE-0344',
    'ACEL PLUS ACECLOFENAC PARACETAMOL 10TABS X PKT',
    'ACEL PLUS ACECLOFENAC PARACETAMOL 10TABS X PKT - Available at Kunle Ara Pharmacy',
    600.0,
    'General Medicine',
    False,
    'ACEL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ACE-0344'),
    1,
    93,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ACE-0344'),
    2,
    93,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ACE-0344'),
    3,
    93,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MEP-0345',
    'MEPRID 2MG GLIMEPIRIDE 10TABS X SAT',
    'MEPRID 2MG GLIMEPIRIDE 10TABS X SAT - Available at Kunle Ara Pharmacy',
    500.0,
    'Pharmaceuticals',
    False,
    'MEPRID'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MEP-0345'),
    1,
    94,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MEP-0345'),
    2,
    94,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MEP-0345'),
    3,
    94,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MID-0346',
    'MIDOZOL EYE DROP 5ML DORZOLAMIDE TIMOLOL X BOTTLE',
    'MIDOZOL EYE DROP 5ML DORZOLAMIDE TIMOLOL X BOTTLE - Available at Kunle Ara Pharmacy',
    5040.0,
    'Pharmaceuticals',
    False,
    'MIDOZOL'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MID-0346'),
    1,
    95,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MID-0346'),
    2,
    95,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MID-0346'),
    3,
    95,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-U-T-0347',
    'U-TRYP 100 000 IU XVIAL',
    'U-TRYP 100 000 IU XVIAL - Available at Kunle Ara Pharmacy',
    49500.0,
    'General Medicine',
    False,
    'U-TRYP'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-U-T-0347'),
    1,
    96,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-U-T-0347'),
    2,
    96,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-U-T-0347'),
    3,
    96,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BIS-0348',
    'BISMID FACE WHITENING CREAM 50G',
    'BISMID FACE WHITENING CREAM 50G - Available at Kunle Ara Pharmacy',
    12100.0,
    'Personal Care',
    False,
    'BISMID'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BIS-0348'),
    1,
    97,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BIS-0348'),
    2,
    97,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BIS-0348'),
    3,
    97,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-VIT-0349',
    'VITAMIX SELENIUM ACE D XPKT',
    'VITAMIX SELENIUM ACE D XPKT - Available at Kunle Ara Pharmacy',
    3300.0,
    'General Medicine',
    False,
    'VITAMIX'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIT-0349'),
    1,
    98,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIT-0349'),
    2,
    98,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIT-0349'),
    3,
    98,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-COM-0350',
    'COMPREZON SOCKS XL',
    'COMPREZON SOCKS XL - Available at Kunle Ara Pharmacy',
    11000.0,
    'General Medicine',
    False,
    'COMPREZON'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COM-0350'),
    1,
    99,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COM-0350'),
    2,
    99,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COM-0350'),
    3,
    99,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-AML-0351',
    'AMLODIPINE 10MG XSACHET SANDOZ',
    'AMLODIPINE 10MG XSACHET SANDOZ - Available at Kunle Ara Pharmacy',
    310.0,
    'Pharmaceuticals',
    False,
    'AMLODIPINE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AML-0351'),
    1,
    100,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AML-0351'),
    2,
    100,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AML-0351'),
    3,
    100,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GAR-0352',
    'GARNIER SKIN NATURALS BRIGHT COMPLETE 400ML',
    'GARNIER SKIN NATURALS BRIGHT COMPLETE 400ML - Available at Kunle Ara Pharmacy',
    8250.0,
    'Pharmaceuticals',
    False,
    'GARNIER'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAR-0352'),
    1,
    101,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAR-0352'),
    2,
    101,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAR-0352'),
    3,
    101,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SEN-0353',
    'SENSODYNE DAILY CARE 75ML',
    'SENSODYNE DAILY CARE 75ML - Available at Kunle Ara Pharmacy',
    2200.0,
    'Pharmaceuticals',
    False,
    'SENSODYNE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0353'),
    1,
    102,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0353'),
    2,
    102,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0353'),
    3,
    102,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SEN-0354',
    'SENSODYNE EXTRA FRESH',
    'SENSODYNE EXTRA FRESH - Available at Kunle Ara Pharmacy',
    970.0,
    'General Medicine',
    False,
    'SENSODYNE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0354'),
    1,
    103,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0354'),
    2,
    103,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0354'),
    3,
    103,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SEN-0355',
    'SENSODYNE RAPID RELIEF TOOTHBRUSH',
    'SENSODYNE RAPID RELIEF TOOTHBRUSH - Available at Kunle Ara Pharmacy',
    670.0,
    'General Medicine',
    False,
    'SENSODYNE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0355'),
    1,
    104,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0355'),
    2,
    104,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0355'),
    3,
    104,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SEN-0356',
    'SENSODYNE RAPID ACTION',
    'SENSODYNE RAPID ACTION - Available at Kunle Ara Pharmacy',
    2240.0,
    'General Medicine',
    False,
    'SENSODYNE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0356'),
    1,
    105,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0356'),
    2,
    105,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0356'),
    3,
    105,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SEN-0357',
    'SENSODYNE EXTRA WHITENING',
    'SENSODYNE EXTRA WHITENING - Available at Kunle Ara Pharmacy',
    3380.0,
    'General Medicine',
    False,
    'SENSODYNE'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0357'),
    1,
    106,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0357'),
    2,
    106,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SEN-0357'),
    3,
    106,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-IRO-0358',
    'IROKO AFRICAN ROOT 500ML',
    'IROKO AFRICAN ROOT 500ML - Available at Kunle Ara Pharmacy',
    12000.0,
    'Pharmaceuticals',
    False,
    'IROKO'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-IRO-0358'),
    1,
    107,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-IRO-0358'),
    2,
    107,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-IRO-0358'),
    3,
    107,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-AMO-0359',
    'Amoxicillin 500mg Capsules',
    'Amoxicillin 500mg Capsules - Available at Kunle Ara Pharmacy',
    2500.0,
    'Pharmaceuticals',
    False,
    'Amoxicillin'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMO-0359'),
    1,
    108,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMO-0359'),
    2,
    108,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AMO-0359'),
    3,
    108,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-AUG-0360',
    'Augmentin 625mg Tablets',
    'Augmentin 625mg Tablets - Available at Kunle Ara Pharmacy',
    4500.0,
    'Pharmaceuticals',
    False,
    'Augmentin'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AUG-0360'),
    1,
    109,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AUG-0360'),
    2,
    109,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AUG-0360'),
    3,
    109,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CIP-0361',
    'Ciprofloxacin 500mg Tablets',
    'Ciprofloxacin 500mg Tablets - Available at Kunle Ara Pharmacy',
    3200.0,
    'Pharmaceuticals',
    False,
    'Ciprofloxacin'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CIP-0361'),
    1,
    110,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CIP-0361'),
    2,
    110,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CIP-0361'),
    3,
    110,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MET-0362',
    'Metronidazole 400mg Tablets',
    'Metronidazole 400mg Tablets - Available at Kunle Ara Pharmacy',
    1800.0,
    'Pharmaceuticals',
    False,
    'Metronidazole'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MET-0362'),
    1,
    111,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MET-0362'),
    2,
    111,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MET-0362'),
    3,
    111,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ART-0363',
    'Artemether Lumefantrine Tablets',
    'Artemether Lumefantrine Tablets - Available at Kunle Ara Pharmacy',
    3500.0,
    'Pharmaceuticals',
    False,
    'Artemether'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ART-0363'),
    1,
    112,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ART-0363'),
    2,
    112,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ART-0363'),
    3,
    112,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OME-0364',
    'Omeprazole 20mg Capsules',
    'Omeprazole 20mg Capsules - Available at Kunle Ara Pharmacy',
    2800.0,
    'Pharmaceuticals',
    False,
    'Omeprazole'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OME-0364'),
    1,
    113,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OME-0364'),
    2,
    113,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OME-0364'),
    3,
    113,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ATE-0365',
    'Atenolol 50mg Tablets',
    'Atenolol 50mg Tablets - Available at Kunle Ara Pharmacy',
    2200.0,
    'Pharmaceuticals',
    False,
    'Atenolol'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ATE-0365'),
    1,
    114,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ATE-0365'),
    2,
    114,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ATE-0365'),
    3,
    114,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MET-0366',
    'Metformin 500mg Tablets',
    'Metformin 500mg Tablets - Available at Kunle Ara Pharmacy',
    1900.0,
    'Pharmaceuticals',
    False,
    'Metformin'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MET-0366'),
    1,
    115,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MET-0366'),
    2,
    115,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MET-0366'),
    3,
    115,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PAR-0367',
    'Paracetamol 500mg Tablets',
    'Paracetamol 500mg Tablets - Available at Kunle Ara Pharmacy',
    600.0,
    'Pharmaceuticals',
    False,
    'Paracetamol'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAR-0367'),
    1,
    116,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAR-0367'),
    2,
    116,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAR-0367'),
    3,
    116,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PAN-0368',
    'Panadol Extra Tablets',
    'Panadol Extra Tablets - Available at Kunle Ara Pharmacy',
    900.0,
    'Pharmaceuticals',
    False,
    'Panadol'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAN-0368'),
    1,
    117,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAN-0368'),
    2,
    117,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAN-0368'),
    3,
    117,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-IBU-0369',
    'Ibuprofen 400mg Tablets',
    'Ibuprofen 400mg Tablets - Available at Kunle Ara Pharmacy',
    800.0,
    'Pharmaceuticals',
    False,
    'Ibuprofen'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-IBU-0369'),
    1,
    118,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-IBU-0369'),
    2,
    118,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-IBU-0369'),
    3,
    118,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BOS-0370',
    'Boska Pain Relief Tablets',
    'Boska Pain Relief Tablets - Available at Kunle Ara Pharmacy',
    500.0,
    'Pharmaceuticals',
    False,
    'Boska'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BOS-0370'),
    1,
    119,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BOS-0370'),
    2,
    119,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BOS-0370'),
    3,
    119,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ALA-0371',
    'Alabukun Powder',
    'Alabukun Powder - Available at Kunle Ara Pharmacy',
    300.0,
    'General Medicine',
    False,
    'Alabukun'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ALA-0371'),
    1,
    120,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ALA-0371'),
    2,
    120,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ALA-0371'),
    3,
    120,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BEN-0372',
    'Benylin Cough Syrup 100ml',
    'Benylin Cough Syrup 100ml - Available at Kunle Ara Pharmacy',
    1200.0,
    'Pharmaceuticals',
    False,
    'Benylin'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BEN-0372'),
    1,
    121,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BEN-0372'),
    2,
    121,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BEN-0372'),
    3,
    121,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ORS-0373',
    'ORS Oral Rehydration Salt',
    'ORS Oral Rehydration Salt - Available at Kunle Ara Pharmacy',
    200.0,
    'General Medicine',
    False,
    'ORS'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ORS-0373'),
    1,
    122,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ORS-0373'),
    2,
    122,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ORS-0373'),
    3,
    122,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ANT-0374',
    'Antacid Tablets',
    'Antacid Tablets - Available at Kunle Ara Pharmacy',
    450.0,
    'Pharmaceuticals',
    False,
    'Antacid'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANT-0374'),
    1,
    123,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANT-0374'),
    2,
    123,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ANT-0374'),
    3,
    123,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-VIT-0375',
    'Vitamin C 1000mg Tablets',
    'Vitamin C 1000mg Tablets - Available at Kunle Ara Pharmacy',
    2500.0,
    'Pharmaceuticals',
    False,
    'Vitamin'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIT-0375'),
    1,
    124,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIT-0375'),
    2,
    124,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIT-0375'),
    3,
    124,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CEN-0376',
    'Centrum Multivitamin',
    'Centrum Multivitamin - Available at Kunle Ara Pharmacy',
    4000.0,
    'Vitamins & Supplements',
    False,
    'Centrum'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEN-0376'),
    1,
    125,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEN-0376'),
    2,
    125,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CEN-0376'),
    3,
    125,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CAL-0377',
    'Calcium Vitamin D3 Tablets',
    'Calcium Vitamin D3 Tablets - Available at Kunle Ara Pharmacy',
    3200.0,
    'Pharmaceuticals',
    False,
    'Calcium'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAL-0377'),
    1,
    126,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAL-0377'),
    2,
    126,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAL-0377'),
    3,
    126,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-IRO-0378',
    'Iron Folic Acid Tablets',
    'Iron Folic Acid Tablets - Available at Kunle Ara Pharmacy',
    1800.0,
    'Pharmaceuticals',
    False,
    'Iron'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-IRO-0378'),
    1,
    127,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-IRO-0378'),
    2,
    127,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-IRO-0378'),
    3,
    127,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-COD-0379',
    'Cod Liver Oil Capsules',
    'Cod Liver Oil Capsules - Available at Kunle Ara Pharmacy',
    3500.0,
    'Pharmaceuticals',
    False,
    'Cod'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COD-0379'),
    1,
    128,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COD-0379'),
    2,
    128,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COD-0379'),
    3,
    128,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ZIN-0380',
    'Zinc Tablets 50mg',
    'Zinc Tablets 50mg - Available at Kunle Ara Pharmacy',
    2000.0,
    'Pharmaceuticals',
    False,
    'Zinc'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ZIN-0380'),
    1,
    129,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ZIN-0380'),
    2,
    129,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ZIN-0380'),
    3,
    129,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-VIT-0381',
    'Vitamin B Complex',
    'Vitamin B Complex - Available at Kunle Ara Pharmacy',
    2200.0,
    'Vitamins & Supplements',
    False,
    'Vitamin'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIT-0381'),
    1,
    130,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIT-0381'),
    2,
    130,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VIT-0381'),
    3,
    130,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MAG-0382',
    'Magnesium Supplements',
    'Magnesium Supplements - Available at Kunle Ara Pharmacy',
    2800.0,
    'Vitamins & Supplements',
    False,
    'Magnesium'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAG-0382'),
    1,
    131,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAG-0382'),
    2,
    131,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAG-0382'),
    3,
    131,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-COC-0383',
    'Coca Cola 35cl',
    'Coca Cola 35cl - Available at Kunle Ara Pharmacy',
    200.0,
    'General Medicine',
    False,
    'Coca'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COC-0383'),
    1,
    132,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COC-0383'),
    2,
    132,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COC-0383'),
    3,
    132,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SPR-0384',
    'Sprite 50cl',
    'Sprite 50cl - Available at Kunle Ara Pharmacy',
    250.0,
    'General Medicine',
    False,
    'Sprite'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SPR-0384'),
    1,
    133,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SPR-0384'),
    2,
    133,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SPR-0384'),
    3,
    133,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FAN-0385',
    'Fanta Orange 35cl',
    'Fanta Orange 35cl - Available at Kunle Ara Pharmacy',
    200.0,
    'General Medicine',
    False,
    'Fanta'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAN-0385'),
    1,
    134,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAN-0385'),
    2,
    134,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAN-0385'),
    3,
    134,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-EVA-0386',
    'Eva Water 75cl',
    'Eva Water 75cl - Available at Kunle Ara Pharmacy',
    150.0,
    'General Medicine',
    False,
    'Eva'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EVA-0386'),
    1,
    135,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EVA-0386'),
    2,
    135,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-EVA-0386'),
    3,
    135,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CHI-0387',
    'Chi Exotic Juice 1L',
    'Chi Exotic Juice 1L - Available at Kunle Ara Pharmacy',
    400.0,
    'General Medicine',
    False,
    'Chi'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CHI-0387'),
    1,
    136,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CHI-0387'),
    2,
    136,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CHI-0387'),
    3,
    136,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-HOL-0388',
    'Hollandia Yoghurt',
    'Hollandia Yoghurt - Available at Kunle Ara Pharmacy',
    500.0,
    'General Medicine',
    False,
    'Hollandia'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HOL-0388'),
    1,
    137,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HOL-0388'),
    2,
    137,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HOL-0388'),
    3,
    137,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PEP-0389',
    'Pepsi 50cl',
    'Pepsi 50cl - Available at Kunle Ara Pharmacy',
    250.0,
    'General Medicine',
    False,
    'Pepsi'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEP-0389'),
    1,
    138,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEP-0389'),
    2,
    138,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PEP-0389'),
    3,
    138,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-7UP-0390',
    '7UP 35cl',
    '7UP 35cl - Available at Kunle Ara Pharmacy',
    200.0,
    'General Medicine',
    False,
    '7UP'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-7UP-0390'),
    1,
    139,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-7UP-0390'),
    2,
    139,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-7UP-0390'),
    3,
    139,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DIG-0391',
    'Digestive Biscuits',
    'Digestive Biscuits - Available at Kunle Ara Pharmacy',
    800.0,
    'General Medicine',
    False,
    'Digestive'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIG-0391'),
    1,
    140,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIG-0391'),
    2,
    140,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DIG-0391'),
    3,
    140,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PRI-0392',
    'Pringles Original 165g',
    'Pringles Original 165g - Available at Kunle Ara Pharmacy',
    1200.0,
    'General Medicine',
    False,
    'Pringles'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PRI-0392'),
    1,
    141,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PRI-0392'),
    2,
    141,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PRI-0392'),
    3,
    141,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GAL-0393',
    'Gala Sausage Roll',
    'Gala Sausage Roll - Available at Kunle Ara Pharmacy',
    300.0,
    'General Medicine',
    False,
    'Gala'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAL-0393'),
    1,
    142,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAL-0393'),
    2,
    142,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAL-0393'),
    3,
    142,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PLA-0394',
    'Plantain Chips 100g',
    'Plantain Chips 100g - Available at Kunle Ara Pharmacy',
    500.0,
    'General Medicine',
    False,
    'Plantain'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PLA-0394'),
    1,
    143,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PLA-0394'),
    2,
    143,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PLA-0394'),
    3,
    143,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GRO-0395',
    'Groundnut 100g',
    'Groundnut 100g - Available at Kunle Ara Pharmacy',
    300.0,
    'General Medicine',
    False,
    'Groundnut'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GRO-0395'),
    1,
    144,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GRO-0395'),
    2,
    144,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GRO-0395'),
    3,
    144,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CAB-0396',
    'Cabin Biscuits',
    'Cabin Biscuits - Available at Kunle Ara Pharmacy',
    400.0,
    'General Medicine',
    False,
    'Cabin'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAB-0396'),
    1,
    145,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAB-0396'),
    2,
    145,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAB-0396'),
    3,
    145,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SHO-0397',
    'Shortbread Biscuits',
    'Shortbread Biscuits - Available at Kunle Ara Pharmacy',
    700.0,
    'General Medicine',
    False,
    'Shortbread'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SHO-0397'),
    1,
    146,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SHO-0397'),
    2,
    146,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SHO-0397'),
    3,
    146,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MEA-0398',
    'Meat Pie',
    'Meat Pie - Available at Kunle Ara Pharmacy',
    400.0,
    'General Medicine',
    False,
    'Meat'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MEA-0398'),
    1,
    147,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MEA-0398'),
    2,
    147,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MEA-0398'),
    3,
    147,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DET-0399',
    'Dettol Antiseptic 250ml',
    'Dettol Antiseptic 250ml - Available at Kunle Ara Pharmacy',
    1500.0,
    'Pharmaceuticals',
    False,
    'Dettol'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DET-0399'),
    1,
    148,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DET-0399'),
    2,
    148,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DET-0399'),
    3,
    148,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SAV-0400',
    'Savlon Antiseptic Cream',
    'Savlon Antiseptic Cream - Available at Kunle Ara Pharmacy',
    1000.0,
    'Personal Care',
    False,
    'Savlon'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAV-0400'),
    1,
    149,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAV-0400'),
    2,
    149,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SAV-0400'),
    3,
    149,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-JOH-0401',
    'Johnson Baby Oil 300ml',
    'Johnson Baby Oil 300ml - Available at Kunle Ara Pharmacy',
    1200.0,
    'Pharmaceuticals',
    False,
    'Johnson'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JOH-0401'),
    1,
    50,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JOH-0401'),
    2,
    50,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JOH-0401'),
    3,
    50,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-VAS-0402',
    'Vaseline Petroleum Jelly',
    'Vaseline Petroleum Jelly - Available at Kunle Ara Pharmacy',
    800.0,
    'General Medicine',
    False,
    'Vaseline'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0402'),
    1,
    51,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0402'),
    2,
    51,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-VAS-0402'),
    3,
    51,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-COT-0403',
    'Cotton Wool 50g',
    'Cotton Wool 50g - Available at Kunle Ara Pharmacy',
    400.0,
    'General Medicine',
    False,
    'Cotton'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COT-0403'),
    1,
    52,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COT-0403'),
    2,
    52,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-COT-0403'),
    3,
    52,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BAN-0404',
    'Bandage Roll 5cm',
    'Bandage Roll 5cm - Available at Kunle Ara Pharmacy',
    300.0,
    'Medical Supplies',
    False,
    'Bandage'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAN-0404'),
    1,
    53,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAN-0404'),
    2,
    53,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAN-0404'),
    3,
    53,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-HAN-0405',
    'Hand Sanitizer 100ml',
    'Hand Sanitizer 100ml - Available at Kunle Ara Pharmacy',
    600.0,
    'Pharmaceuticals',
    False,
    'Hand'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HAN-0405'),
    1,
    54,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HAN-0405'),
    2,
    54,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HAN-0405'),
    3,
    54,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-HYD-0406',
    'Hydrogen Peroxide 100ml',
    'Hydrogen Peroxide 100ml - Available at Kunle Ara Pharmacy',
    500.0,
    'Pharmaceuticals',
    False,
    'Hydrogen'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HYD-0406'),
    1,
    55,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HYD-0406'),
    2,
    55,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-HYD-0406'),
    3,
    55,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DET-0407',
    'Dettol Disinfectant 500ml',
    'Dettol Disinfectant 500ml - Available at Kunle Ara Pharmacy',
    2000.0,
    'Pharmaceuticals',
    False,
    'Dettol'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DET-0407'),
    1,
    56,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DET-0407'),
    2,
    56,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DET-0407'),
    3,
    56,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-TOI-0408',
    'Toilet Paper 4-pack',
    'Toilet Paper 4-pack - Available at Kunle Ara Pharmacy',
    1200.0,
    'General Medicine',
    False,
    'Toilet'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TOI-0408'),
    1,
    57,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TOI-0408'),
    2,
    57,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TOI-0408'),
    3,
    57,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-OMO-0409',
    'Omo Detergent 500g',
    'Omo Detergent 500g - Available at Kunle Ara Pharmacy',
    1500.0,
    'General Medicine',
    False,
    'Omo'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OMO-0409'),
    1,
    58,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OMO-0409'),
    2,
    58,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-OMO-0409'),
    3,
    58,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BAY-0410',
    'Baygon Insecticide Spray',
    'Baygon Insecticide Spray - Available at Kunle Ara Pharmacy',
    1800.0,
    'General Medicine',
    False,
    'Baygon'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAY-0410'),
    1,
    59,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAY-0410'),
    2,
    59,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAY-0410'),
    3,
    59,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-AIR-0411',
    'Air Freshener Spray',
    'Air Freshener Spray - Available at Kunle Ara Pharmacy',
    800.0,
    'General Medicine',
    False,
    'Air'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AIR-0411'),
    1,
    60,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AIR-0411'),
    2,
    60,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-AIR-0411'),
    3,
    60,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-DUR-0412',
    'Duracell Batteries AA',
    'Duracell Batteries AA - Available at Kunle Ara Pharmacy',
    600.0,
    'General Medicine',
    False,
    'Duracell'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DUR-0412'),
    1,
    61,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DUR-0412'),
    2,
    61,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-DUR-0412'),
    3,
    61,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-ROS-0413',
    'Rose Tissue Paper',
    'Rose Tissue Paper - Available at Kunle Ara Pharmacy',
    400.0,
    'General Medicine',
    False,
    'Rose'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROS-0413'),
    1,
    62,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROS-0413'),
    2,
    62,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-ROS-0413'),
    3,
    62,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CAN-0414',
    'Candles Pack of 6',
    'Candles Pack of 6 - Available at Kunle Ara Pharmacy',
    300.0,
    'General Medicine',
    False,
    'Candles'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAN-0414'),
    1,
    63,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAN-0414'),
    2,
    63,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CAN-0414'),
    3,
    63,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PAM-0415',
    'Pampers Baby Dry Size 3',
    'Pampers Baby Dry Size 3 - Available at Kunle Ara Pharmacy',
    4500.0,
    'Baby Care',
    False,
    'Pampers'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAM-0415'),
    1,
    64,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAM-0415'),
    2,
    64,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAM-0415'),
    3,
    64,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-SMA-0416',
    'SMA Baby Formula 400g',
    'SMA Baby Formula 400g - Available at Kunle Ara Pharmacy',
    5500.0,
    'Baby Care',
    False,
    'SMA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0416'),
    1,
    65,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0416'),
    2,
    65,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-SMA-0416'),
    3,
    65,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-JOH-0417',
    'Johnson Baby Shampoo',
    'Johnson Baby Shampoo - Available at Kunle Ara Pharmacy',
    1500.0,
    'Personal Care',
    False,
    'Johnson'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JOH-0417'),
    1,
    66,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JOH-0417'),
    2,
    66,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-JOH-0417'),
    3,
    66,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BAB-0418',
    'Baby Wipes 80-pack',
    'Baby Wipes 80-pack - Available at Kunle Ara Pharmacy',
    1200.0,
    'Baby Care',
    False,
    'Baby'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0418'),
    1,
    67,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0418'),
    2,
    67,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0418'),
    3,
    67,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CER-0419',
    'Cerelac Baby Food 400g',
    'Cerelac Baby Food 400g - Available at Kunle Ara Pharmacy',
    2200.0,
    'Baby Care',
    False,
    'Cerelac'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0419'),
    1,
    68,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0419'),
    2,
    68,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CER-0419'),
    3,
    68,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FEE-0420',
    'Feeding Bottle 250ml',
    'Feeding Bottle 250ml - Available at Kunle Ara Pharmacy',
    2000.0,
    'Pharmaceuticals',
    False,
    'Feeding'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FEE-0420'),
    1,
    69,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FEE-0420'),
    2,
    69,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FEE-0420'),
    3,
    69,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BAB-0421',
    'Baby Powder 200g',
    'Baby Powder 200g - Available at Kunle Ara Pharmacy',
    1300.0,
    'Baby Care',
    False,
    'Baby'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0421'),
    1,
    70,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0421'),
    2,
    70,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BAB-0421'),
    3,
    70,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PAC-0422',
    'Pacifier Size 1',
    'Pacifier Size 1 - Available at Kunle Ara Pharmacy',
    800.0,
    'General Medicine',
    False,
    'Pacifier'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAC-0422'),
    1,
    71,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAC-0422'),
    2,
    71,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PAC-0422'),
    3,
    71,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MOR-0423',
    'Moringa Powder 100g',
    'Moringa Powder 100g - Available at Kunle Ara Pharmacy',
    2500.0,
    'General Medicine',
    False,
    'Moringa'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MOR-0423'),
    1,
    72,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MOR-0423'),
    2,
    72,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MOR-0423'),
    3,
    72,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GIN-0424',
    'Ginger Honey Tea',
    'Ginger Honey Tea - Available at Kunle Ara Pharmacy',
    1500.0,
    'General Medicine',
    False,
    'Ginger'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GIN-0424'),
    1,
    73,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GIN-0424'),
    2,
    73,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GIN-0424'),
    3,
    73,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-TUR-0425',
    'Turmeric Capsules',
    'Turmeric Capsules - Available at Kunle Ara Pharmacy',
    3000.0,
    'Pharmaceuticals',
    False,
    'Turmeric'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TUR-0425'),
    1,
    74,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TUR-0425'),
    2,
    74,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-TUR-0425'),
    3,
    74,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BLA-0426',
    'Black Seed Oil 100ml',
    'Black Seed Oil 100ml - Available at Kunle Ara Pharmacy',
    2800.0,
    'Pharmaceuticals',
    False,
    'Black'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLA-0426'),
    1,
    75,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLA-0426'),
    2,
    75,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BLA-0426'),
    3,
    75,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PUR-0427',
    'Pure Honey 500g',
    'Pure Honey 500g - Available at Kunle Ara Pharmacy',
    3500.0,
    'General Medicine',
    False,
    'Pure'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0427'),
    1,
    76,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0427'),
    2,
    76,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PUR-0427'),
    3,
    76,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-GAR-0428',
    'Garlic Supplement',
    'Garlic Supplement - Available at Kunle Ara Pharmacy',
    2200.0,
    'Vitamins & Supplements',
    False,
    'Garlic'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAR-0428'),
    1,
    77,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAR-0428'),
    2,
    77,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-GAR-0428'),
    3,
    77,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-WHE-0429',
    'Whey Protein Powder 1kg',
    'Whey Protein Powder 1kg - Available at Kunle Ara Pharmacy',
    8500.0,
    'General Medicine',
    False,
    'Whey'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-WHE-0429'),
    1,
    78,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-WHE-0429'),
    2,
    78,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-WHE-0429'),
    3,
    78,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-CRE-0430',
    'Creatine Monohydrate',
    'Creatine Monohydrate - Available at Kunle Ara Pharmacy',
    6500.0,
    'General Medicine',
    False,
    'Creatine'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CRE-0430'),
    1,
    79,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CRE-0430'),
    2,
    79,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-CRE-0430'),
    3,
    79,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-BCA-0431',
    'BCAA Amino Acids',
    'BCAA Amino Acids - Available at Kunle Ara Pharmacy',
    7200.0,
    'General Medicine',
    False,
    'BCAA'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BCA-0431'),
    1,
    80,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BCA-0431'),
    2,
    80,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-BCA-0431'),
    3,
    80,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-FAT-0432',
    'Fat Burner Capsules',
    'Fat Burner Capsules - Available at Kunle Ara Pharmacy',
    5500.0,
    'Pharmaceuticals',
    False,
    'Fat'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAT-0432'),
    1,
    81,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAT-0432'),
    2,
    81,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-FAT-0432'),
    3,
    81,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-PRE-0433',
    'Pre-workout Energy Drink',
    'Pre-workout Energy Drink - Available at Kunle Ara Pharmacy',
    4500.0,
    'General Medicine',
    False,
    'Pre-workout'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PRE-0433'),
    1,
    82,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PRE-0433'),
    2,
    82,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-PRE-0433'),
    3,
    82,  -- Random stock between 50-150
    10
);

INSERT INTO products (sku, name, description, price, category, is_prescription, brand) VALUES (
    'KAP-MAS-0434',
    'Mass Gainer Powder',
    'Mass Gainer Powder - Available at Kunle Ara Pharmacy',
    9200.0,
    'General Medicine',
    False,
    'Mass'
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAS-0434'),
    1,
    83,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAS-0434'),
    2,
    83,  -- Random stock between 50-150
    10
);
INSERT INTO branch_inventory (product_id, branch_id, stock_quantity, min_stock_level) VALUES (
    (SELECT id FROM products WHERE sku = 'KAP-MAS-0434'),
    3,
    83,  -- Random stock between 50-150
    10
);
