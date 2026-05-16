-- ============================================
-- SAP MM - Vendor Master Data (Mock Export)
-- Company Code: 1710 (Velotics Inc.)
-- Purchasing Org: 1710
-- ============================================

CREATE TABLE vendors (
    vendor_id        VARCHAR(10) PRIMARY KEY,
    vendor_name      VARCHAR(100),
    country          VARCHAR(50),
    city             VARCHAR(50),
    payment_terms    VARCHAR(50),
    currency         VARCHAR(5),
    purchasing_org   VARCHAR(10),
    company_code     VARCHAR(10),
    recon_account    VARCHAR(10),
    status           VARCHAR(10)
);

INSERT INTO vendors VALUES
('17300006', 'MFG TopConsult Inc.',  'USA', 'Cleveland',  'Net 30 Days', 'USD', '1710', '1710', '21100000', 'Active'),
('USSU-TRL14','ConsultUs Inc.',      'USA', 'Cleveland',  'Net 30 Days', 'USD', '1710', '1710', '21100000', 'Active'),
('USSU-VSF01','EV Parts Inc.',       'USA', 'Detroit',    'Net 45 Days', 'USD', '1710', '1710', '21100000', 'Active');

-- Vendor performance summary
SELECT
    vendor_name,
    currency,
    payment_terms,
    status
FROM vendors
ORDER BY vendor_name;