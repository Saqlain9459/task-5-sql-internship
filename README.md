

````markdown
# Task 5 - SQL Developer Internship  
## SQL Joins (INNER, LEFT, RIGHT, FULL)

### **Objective**  
The goal of this task is to practice SQL **joins** by combining data from multiple related tables.  
We have the following tables in the `data` database:  

1. **Customers** – Stores customer details.  
2. **Orders** – Stores order details with reference to customers.  
3. **Products** – Stores product details with reference to orders.  

---

## **Tables Structure**
### Customers
| Column        | Type          | Description                |
|---------------|--------------|----------------------------|
| CustomerID    | INT (PK)     | Unique customer ID         |
| CustomerName  | VARCHAR(50)  | Name of the customer       |
| City          | VARCHAR(50)  | City of the customer       |
| Email         | VARCHAR(100) | Email address              |

### Orders
| Column        | Type          | Description                |
|---------------|--------------|----------------------------|
| OrderID       | INT (PK)     | Unique order ID            |
| OrderDate     | DATE         | Date of the order          |
| Amount        | DECIMAL(10,2)| Total amount of the order  |
| CustomerID    | INT (FK)     | Linked to Customers table  |

### Products
| Column        | Type          | Description                |
|---------------|--------------|----------------------------|
| ProductID     | INT (PK)     | Unique product ID          |
| ProductName   | VARCHAR(50)  | Name of the product        |
| Price         | DECIMAL(10,2)| Price of the product       |
| OrderID       | INT (FK)     | Linked to Orders table     |

---

## **Example Queries**

### **1. INNER JOIN – Get customer name, order date, and amount for all orders**
```sql
SELECT c.CustomerName, o.OrderDate, o.Amount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;
````

<img width="214" height="175" alt="INNER JOIN Example" src="https://github.com/user-attachments/assets/97d781d1-44bc-493c-abf5-614af3f05c6c" />

---

### **2. INNER JOIN – Display product name, price, and customer who purchased it**

```sql
SELECT p.ProductName, p.Price, c.CustomerName
FROM Products p
INNER JOIN Orders o ON p.OrderID = o.OrderID
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;
```

<img width="248" height="170" alt="INNER JOIN Products" src="https://github.com/user-attachments/assets/5b2c6299-7219-4b4d-a7fd-d3faae5e99d3" />

---

### **3. LEFT JOIN – Get all customers and their orders (including those with no orders)**

```sql
SELECT c.CustomerName, o.OrderID, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
```

<img width="219" height="172" alt="LEFT JOIN Example" src="https://github.com/user-attachments/assets/f901845a-de05-4f5c-b0c8-15c4f23320fb" />

---

### **4. RIGHT JOIN – Show all orders and their customer details**

```sql
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
```

<img width="217" height="170" alt="RIGHT JOIN Example" src="https://github.com/user-attachments/assets/e30c9356-db2c-4e0d-916c-baaebfe51e07" />

---

### **5. FULL OUTER JOIN – Get all customers and orders (including unmatched)**

*(Simulated in MySQL using UNION of LEFT and RIGHT JOIN)*

```sql
SELECT c.CustomerName, o.OrderID, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerName, o.OrderID, o.Amount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
```

<img width="215" height="170" alt="FULL OUTER JOIN Example" src="https://github.com/user-attachments/assets/394a634f-a8a3-454e-9e0b-d27e0521b022" />

---

## **How to Run**

1. Create the database and tables using the provided SQL script.
2. Insert the given sample data.
3. Run the queries in MySQL Workbench or any SQL client.

---

## **Learning Outcome**

By completing this task, you will:

* Understand different types of joins (INNER, LEFT, RIGHT, FULL).
* Learn how to combine data from multiple tables.
* Practice writing queries that handle missing or unmatched data.

```

---


```
