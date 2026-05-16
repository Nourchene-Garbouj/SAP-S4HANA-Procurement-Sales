-- ============================================
-- SAP SD - Customer Master Data (Mock Export)
-- Sales Org: 1710 (Dom. Sales Org US)
-- Distribution Channel: 10 (Direct Sales)
-- Division: 00
-- ============================================

CREATE TABLE customers (
    customer_id      VARCHAR(20) PRIMARY KEY,
    customer_name    VARCHAR(100),
    country          VARCHAR(50),
    city             VARCHAR(50),
    state            VARCHAR(10),
    payment_terms    VARCHAR(50),
    currency         VARCHAR(5),
    customer_group   VARCHAR(20),
    sales_org        VARCHAR(10),
    dist_channel     VARCHAR(5),
    recon_account    VARCHAR(10),
    status           VARCHAR(10)
);

INSERT INTO customers VALUES
('17100001', 'Silverstar Corp.',  'USA', 'Atlanta',     'GA', 'End of Month', 'USD', 'Consulting', '1710', '10', '12100000', 'Active'),
('USCU-L05', 'Bluestar Corp',    'USA', 'Charleston',  'SC', 'Net 30 Days',  'USD', 'Large',      '1710', '10', '12100000', 'Active'),
('USCU-L03', 'Viadox',           'USA', 'New York',    'NY', 'Net 30 Days',  'USD', 'Large',      '1710', '10', '12100000', 'Active'),
('LACU-S01', 'YourCycleShop',    'USA', 'Los Angeles', 'CA', 'Net 14 Days',  'USD', 'Small',      '1710', '10', '12100000', 'Active'),
('CACU-S02', 'XYZ Cycles',       'USA', 'San Diego',   'CA', 'Net 14 Days',  'USD', 'Small',      '1710', '10', '12100000', 'Active');

-- Customer sales summary
SELECT
    customer_name,
    city,
    state,
    customer_group,
    payment_terms,
    currency
FROM customers
ORDER BY customer_group, customer_name;

-- ============================================
-- SAP SD - Sales Order Summary (Mock Export)
-- ============================================

CREATE TABLE sales_orders (
    so_number        VARCHAR(10) PRIMARY KEY,
    customer_id      VARCHAR(20),
    material_id      VARCHAR(20),
    quantity         INTEGER,
    net_value        DECIMAL(10,2),
    currency         VARCHAR(5),
    order_date       DATE,
    delivery_date    DATE,
    status           VARCHAR(20)
);

INSERT INTO sales_orders VALUES
('325136', '17100001', 'MZ-FG-C900', 3,  1395.00, 'USD', '2026-05-16', '2026-05-22', 'Open'),
('296697', 'USCU-L05', 'MZ-FG-C900', 8,  5600.00, 'USD', '2025-11-12', '2025-11-12', 'Completed'),
('293283', 'USCU-L03', 'MZ-FG-S100', 35, 25200.00,'USD', '2025-11-02', '2025-11-02', 'Completed'),
('271259', 'LACU-S01', 'MZ-FG-T200', 2,   960.00, 'USD', '2025-07-06', '2025-07-06', 'Completed'),
('265655', 'CACU-S02', 'MZ-FG-C900', 16,  8800.00,'USD', '2025-02-24', '2025-02-24', 'Completed');

-- Revenue by customer
SELECT
    c.customer_name,
    COUNT(s.so_number)        AS total_orders,
    SUM(s.net_value)          AS total_revenue,
    s.currency
FROM sales_orders s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name, s.currency
ORDER BY total_revenue DESC;