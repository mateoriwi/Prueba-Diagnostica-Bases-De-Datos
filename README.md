# EcoMarket Riwi S.A.S. - Database Project

## Project description
This project focuses on normalizing the data infrastructure of EcoMarket Riwi S.A.S., a supermarket distribution company. The operational data was originally managed via a flat, inconsistent, and highly redundant Excel file. 

The Excel file was very disorganized; there was repeated data, inconsistent names, and many orders had unprofessional names.

All of this was discovered within the first hour of opening the file; there was no standardization in place at that point.

## Development process
The Excel file was very disorganized; there was repeated data, inconsistent names, and many orders had unprofessional names.

All of this was discovered within the first hour of opening the file; there was no standardization in place at that point.

The first thing I did was create a new Excel file from the original, with four sheets, each with its respective categories, such as Customers, Products, Distribution Centers, and Orders. I then removed all the duplicate data and combined everything into a single file, which would receive all the information from the rest of the system. This file would be called "Order," and that was the result: a clean Excel file with four categorized sheets and a final sheet containing the order data.

Once the Excel file was finished, it was converted into four CSV files: "eco_products.csv", "eco_orders.csv", "eco_distribution_centers_id.csv", and "eco_customers.csv".

I used MySQL Workbench to import the data. I uploaded the files using the "import wizard" method, and once the tables were extracted and read by the databases, I exported each CSV file again. Then, I created the SQL code to generate the DDL and DML.

## Technologies
* **Database Engine:** MySQL Server
* **Management Tool:** MySQL Workbench
* **Data Modeling:** dbdiagram.io & Git Source Control

## Database engine
The project implements a local MySQL Server instance. MySQL was selected for its high performance handling relational structures, robust implementation of relational constraints, and widespread enterprise adoption for transactional workloads.

## Normalization process
1. **First Normal Form (1FN):** Removed multi-valued attributes and established strict data atomicity. Plural product names and abbreviated or mistyped city variables were standardized.
2. **Second Normal Form (2FN):** Segregated the monolithic flat table into distinct logical entities with their own custom, non-overlapping Primary Keys (`PK`), isolating core business entities.
3. **Third Normal Form (3FN):** Extracted transitive dependencies. Operational fields such as `eco_unit_price` and `eco_stock` were mapped to the product dimension table. Distribution centers were isolated into their own entity (`eco_distribution_centers`) to prevent data repetition anomalies inside the orders ledger.

## Database schema
The system utilizes a 1-to-Many (1:N) relationship model pointing from dimension tables to the core transactional entity:
* `eco_customers` (1) -> `eco_orders` (N)
* `eco_products` (1) -> `eco_orders` (N)
* `eco_distribution_centers` (1) -> `eco_orders` (N)

## Entity Relationship Diagram
Please check the attached `Diagrama.pdf` inside the root folder to inspect the detailed visual Entity Relationship Diagram.

## Database creation instructions
1. Open **MySQL Workbench** and open a clean query tab (`Ctrl + T`).
2. Run the `Script_DDL.sql` file to generate the complete schema.
3. After that just do any code you want to try with the database

## Data loading instructions
The data was loaded directly from the processed CSV files using MySQL Workbench visual **Table Data Import Wizard** following this precise logical hierarchy:
1. `eco_customers.csv`
2. `eco_products.csv`
3. `eco_distribution_centers_id.csv`
4. `eco_orders.csv`

## SQL query explanation
The analytics suite features 6 highly optimized queries running via `JOIN`, `SUM`, `COUNT`, and `GROUP BY` operations:
* **Query 1:** Evaluates product stock to plan acquisitions.
* **Query 2:** Ranks purchase volumes by individual client cities.
* **Query 3:** Computes total gross financial revenue broken down by food categories.
* **Query 4:** Filters low-running stock items (Stock < 50) for immediate replenishment.
* **Query 5:** Extracts the top 5 highest-frequency commercial buyers (VIP Accounts).
* **Query 6:** Calculates the monetary capital locked inside inventory across all distribution centers.

## Developer information
* **Name:** Mateo Hernández
* **Clan:** Puerta de Oro, Clan 9 Cohorte 5
* **Repository URL:** https://github.com/mateoriwi/Prueba-Diagnostica-Bases-De-Datos.git