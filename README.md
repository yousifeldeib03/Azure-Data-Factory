# 📊 Sales Data ETL Pipeline using Azure Data Factory

## 📌 Overview
This project demonstrates an end-to-end ETL pipeline using Azure Data Factory to clean and process raw sales data stored in CSV format.

---

## 🏗️ Architecture
- Source: CSV file in Azure Blob Storage  
- Processing: Azure Data Factory (Mapping Data Flow)  
- Output: Cleaned data stored in Blob Storage  

---

## ⚙️ Steps
1. Created Resource Group  
2. Created Storage Account  
3. Created container and uploaded `sales.csv`  
4. Created Azure Data Factory  
5. Built Data Flow  
6. Applied transformations using Derived Column  
7. Stored output in container  

---

## 🔄 Transformations

- `order_id` → NULL → -1  
- `order_date` → NULL → 'Null'  
- `customer_id` → NULL → 'Null', converted to uppercase  
- `product` → NULL → 'Null'  
- `category` → standardized to 'Electronics'  
- `quantity` → NULL → 0, negative → positive  
- `unit_price` → NULL → 0, negative → positive  
- `total_amount` → NULL → 0, negative → positive  

---

## 💻 Example Logic

```sql
iif(isNull(quantity), 0, abs(toInteger(quantity)))
