# SAP S/4HANA Procurement & Sales Management System

![SAP](https://img.shields.io/badge/SAP-S%2F4HANA-blue?style=for-the-badge&logo=sap&logoColor=white)
![Module](https://img.shields.io/badge/Module-MM%20%7C%20SD-teal?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-green?style=for-the-badge)

> A simulated end-to-end ERP project for a retail company built on SAP S/4HANA, covering the full **Procure-to-Pay (P2P)** and **Order-to-Cash (O2C)** business cycles using SAP MM and SAP SD modules.

---

## Project Overview

This project simulates the procurement and sales operations of a fictional retail company — **RetailCo** — using SAP S/4HANA. The goal was to configure the system from scratch, execute real business transactions, and demonstrate how integrated ERP processes improve visibility, control, and efficiency across supply chain and sales operations.

| Detail | Value |
|---|---|
| **ERP System** | SAP S/4HANA Cloud (Public Edition) |
| **Modules** | SAP MM (Materials Management), SAP SD (Sales & Distribution) |
| **Company** | RetailCo (fictional retail company) |
| **Scenario** | Procurement of goods from vendors + Sales to customers |
| **Cycles Covered** | Procure-to-Pay (P2P) · Order-to-Cash (O2C) |

---

## Business Scenario

RetailCo purchases consumer electronics from two vendors and sells them to retail customers. This project simulates:

- Sourcing goods from vendors via purchase orders
- Receiving goods into warehouse inventory
- Verifying and posting vendor invoices (3-way match)
- Accepting customer sales orders
- Shipping goods and generating customer invoices
- Monitoring stock levels in real time

---

## Modules & Key Transactions

### SAP MM — Materials Management (Procure-to-Pay)

| Transaction | T-Code | Description |
|---|---|---|
| Vendor Master | XK01 | Created vendor records with payment terms |
| Material Master | MM01 | Created material records with purchasing & MRP views |
| Purchase Requisition | ME51N | Internal request to procure goods |
| Purchase Order | ME21N | Official order sent to vendor |
| Goods Receipt | MIGO | Recorded delivery of goods to warehouse |
| Invoice Verification | MIRO | 3-way match: PO + GR + Invoice |
| Stock Overview | MMBE | Real-time inventory monitoring |
| Physical Inventory | MI01/MI07 | Stock count and difference posting |

### SAP SD — Sales & Distribution (Order-to-Cash)

| Transaction | T-Code | Description |
|---|---|---|
| Customer Master | XD01 | Created customer records with partner functions |
| Sales Order | VA01 | Accepted customer orders with ATP check |
| Outbound Delivery | VL01N | Prepared shipment for customer |
| Post Goods Issue | VL02N | Transferred ownership, reduced stock |
| Customer Invoice | VF01 | Generated billing document |
| Revenue Posting | Automatic | SD-FI integration: AR debit + Revenue credit |

---

## Process Flows

### Procure-to-Pay (P2P) Cycle

```
Purchase Requisition (ME51N)
        ↓
Purchase Order (ME21N)
        ↓
Goods Receipt (MIGO) → Stock ↑
        ↓
Invoice Verification (MIRO) → 3-way match
        ↓
Payment to Vendor (FI-AP)
```

### Order-to-Cash (O2C) Cycle

```
Sales Order (VA01) → ATP Check
        ↓
Outbound Delivery (VL01N)
        ↓
Post Goods Issue (VL02N) → Stock ↓
        ↓
Customer Invoice (VF01)
        ↓
Payment from Customer (FI-AR)
```

---

## Organizational Structure Configured

```
RetailCo (Company Code: RC01)
└── Plant: RC10 (Main Warehouse — Tunis)
    └── Storage Location: 0001 (Main Storage)
        ├── Purchasing Org: RC01 (Central Purchasing)
        └── Sales Org: RC01 / Channel: 10 / Division: 00
```

---

## Key Business Outcomes

- **Vendor Management** — Configured 2 vendor master records with full purchasing and payment data
- **Material Records** — Created 5 material masters extended across plant and sales views
- **Purchase Orders** — Raised and approved POs with release strategy simulation
- **3-Way Match** — Successfully matched PO quantity = GR quantity = Invoice quantity, preventing overpayment
- **Inventory Tracking** — Monitored real-time stock using MMBE and MB52 after each movement
- **Sales Fulfillment** — Processed 3 end-to-end sales orders from creation to billing
- **FI Integration** — Each billing document auto-generated accounting entries (AR + Revenue)

---

## Project Structure

```
SAP-S4HANA-Procurement-Sales/
│
├── docs/
│   ├── screenshots/          # SAP transaction screenshots (step by step)
│   └── process-flows/        # P2P and O2C flow diagrams
│
├── reports/                  # Exported SAP reports (Excel format)
│   ├── purchase-orders.xlsx
│   ├── stock-overview.xlsx
│   └── sales-orders.xlsx
│
├── sql/                      # Mock data scripts for demo purposes
│   ├── vendors.sql
│   ├── materials.sql
│   └── customers.sql
│
└── README.md
```

---

## Screenshots

> Full screenshots are available in [`docs/screenshots/`](./docs/screenshots/)

| Step | Screenshot |
|---|---|
| Vendor Master (XK01) | `docs/screenshots/01-vendor-master.png` |
| Material Master (MM01) | `docs/screenshots/02-material-master.png` |
| Purchase Order (ME21N) | `docs/screenshots/03-purchase-order.png` |
| Goods Receipt (MIGO) | `docs/screenshots/04-goods-receipt.png` |
| Invoice Verification (MIRO) | `docs/screenshots/05-invoice-verification.png` |
| Stock Overview (MMBE) | `docs/screenshots/06-stock-overview.png` |
| Sales Order (VA01) | `docs/screenshots/07-sales-order.png` |
| Outbound Delivery (VL01N) | `docs/screenshots/08-delivery.png` |
| Customer Invoice (VF01) | `docs/screenshots/09-customer-invoice.png` |

---

## SAP Skills Demonstrated

- SAP S/4HANA navigation (Fiori Launchpad & SAP GUI)
- Organizational structure configuration (Company Code, Plant, Sales Org)
- Master data management (Vendor, Customer, Material)
- Procurement cycle execution (PR → PO → GR → IV)
- Sales cycle execution (SO → Delivery → PGI → Billing)
- Inventory management and stock monitoring
- Cross-module integration (MM → FI, SD → FI)
- SAP reporting and data extraction

---

## Tools & Environment

| Tool | Details |
|---|---|
| SAP System | S/4HANA Cloud Public Edition (Trial) |
| Interface | SAP Fiori Launchpad |
| Reporting | SAP standard reports + Excel export |
| Documentation | Markdown + screenshots |
| Version Control | Git / GitHub |

---

## Author

**Nourchene**
- SAP S/4HANA — MM & SD Modules
- Connect on [LinkedIn](#) ← add your link here

---

*This project was built as a portfolio demonstration of SAP S/4HANA procurement and sales capabilities using a simulated retail company environment.*
