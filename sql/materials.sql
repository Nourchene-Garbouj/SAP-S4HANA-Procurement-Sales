-- ============================================
-- SAP MM - Material Master Data (Mock Export)
-- Plant: 1710 (Plant 1 US)
-- Storage Location: 171A / 171C
-- ============================================

CREATE TABLE materials (
    material_id      VARCHAR(20) PRIMARY KEY,
    description      VARCHAR(100),
    material_type    VARCHAR(10),
    material_group   VARCHAR(20),
    base_uom         VARCHAR(5),
    plant            VARCHAR(10),
    storage_location VARCHAR(10),
    standard_price   DECIMAL(10,2),
    currency         VARCHAR(5),
    weight_kg        DECIMAL(10,3),
    mrp_type         VARCHAR(5)
);

INSERT INTO materials VALUES
('MZ-RM-BF01T', 'Bike Frame Set T',    'ROH', 'Raw Materials', 'PC', '1710', '171C', 130.00, 'USD', 9.000, 'PD'),
('MZ-RM-TS01T', 'Tyre Set T',          'ROH', 'Raw Materials', 'PC', '1710', '171C',  80.00, 'USD', 3.500, 'PD'),
('MZ-FG-C900',  'C900 Bike',           'FERT','Finished Goods','PC', '1710', '171A', 465.00, 'USD',15.000, 'PD'),
('MZ-FG-S100',  'S100 Speed Bike',     'FERT','Finished Goods','PC', '1710', '171A', 720.00, 'USD',12.500, 'PD'),
('MZ-FG-T200',  'T200 Trail Bike',     'FERT','Finished Goods','PC', '1710', '171A', 540.00, 'USD',14.000, 'PD');

-- Stock valuation summary
SELECT
    material_id,
    description,
    material_type,
    standard_price,
    currency,
    plant
FROM materials
ORDER BY material_type, standard_price DESC;