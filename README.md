# 📊 Sales Data ETL Pipeline using Azure Data Factory

## 📌 Overview
This project demonstrates an end-to-end ETL (Extract, Transform, Load) pipeline built using Azure Data Factory. The pipeline processes raw sales data stored in CSV format, applies data cleaning and transformation rules, and outputs a standardized dataset to Azure Blob Storage.

---

## 🏗️ Architecture
- **Source:** CSV file stored in Azure Blob Storage
- **Processing:** Azure Data Factory (Mapping Data Flow)
- **Sink:** Cleaned data stored in Azure Blob Storage container

---

## ⚙️ Steps Implemented

### 1. Azure Setup
- Created a Resource Group
- Created a Storage Account
- Created a container
- Uploaded `sales.csv`
- Created Azure Data Factory instance

---

### 2. Data Flow Design
- Built a Mapping Data Flow
- Connected source dataset (CSV file)
- Applied multiple Derived Column transformations
- Loaded processed data into sink container

---

## 🔄 Data Transformations

### ✔️ Data Cleaning & Standardization

| Column | Transformation |
|--------|---------------|
| **order_id** | Replace NULL with -1 and convert to integer |
| **order_date** | Replace NULL with 'Null' |
| **customer_id** | Replace NULL with 'Null' and convert to uppercase |
| **product** | Replace NULL with 'Null' |
| **category** | Standardized all values to 'Electronics' |
| **quantity** | Replace NULL with 0 and convert negative values to positive |
| **unit_price** | Replace NULL with 0 and convert negative values to positive |
| **total_amount** | Replace NULL with 0 and convert negative values to positive |

---

## 🧠 Example Transformation Logic

```sql
iif(isNull(quantity), 0, abs(toInteger(quantity)))
