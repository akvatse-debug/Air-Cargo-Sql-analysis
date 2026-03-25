# ✈️ Air Cargo Database Analysis — SQL Project

## Project Overview
This project involves end-to-end SQL analysis of an airline cargo database (`Aircargo`). The goal was to extract business insights related to passengers, ticket revenue, flight routes, and customer behavior using structured queries across multiple related tables.

---

## Database Schema
The database consists of the following tables:
- **customer** — Customer personal details
- **ticket_details** — Ticket bookings, pricing, class, and airline brand
- **passengers_on_flights** — Passenger-route mapping with class info
- **routes** — Flight route details including distance in miles

---

## Key SQL Concepts Demonstrated

| Concept | Description |
|---|---|
| `JOIN` | Combining customer and ticket data across tables |
| `CTE` (Common Table Expressions) | Modular query structuring for readability |
| `Window Functions` | `MAX() OVER (PARTITION BY)` for per-class price analysis |
| `Subqueries` | Filtering customers by travel class |
| `ROLLUP` | Aggregating total ticket prices across aircraft IDs |
| `Stored Procedure` | Reusable procedure to extract long-distance routes |
| `Views` | Creating a filtered view for business class passengers |
| `Indexes` | Optimizing query performance on `route_id` |
| `EXPLAIN` | Viewing query execution plans |
| `IF clause` | Conditional revenue threshold check |
| `User Management` | Creating users and granting database privileges |

---

## Business Questions Solved

1. Display all passengers who traveled on routes 01–25
2. Count passengers and total revenue in Business class
3. Display full customer names using string functions
4. Find customers who registered and booked tickets
5. Identify customers who flew with Emirates
6. Find customers who traveled in Economy Plus class
7. Check if total revenue has crossed ₹10,000
8. Find maximum ticket price per class using window functions
9. Optimize route-based queries using indexing
10. Calculate total ticket spend per customer per aircraft (with ROLLUP)
11. Create a view for Business class customers
12. Build a stored procedure for routes over 2000 miles
13. Analyze total tickets and spend per customer
14. Calculate average passengers per flight route

---

## Tools Used
- **MySQL Workbench**
- **SQL** (DDL, DML, DCL, TCL)

---

## Certification
This project was completed as part of the **Data Acquisition and Manipulation using SQL** certification by **Simplilearn / IHFC DA** (Feb 2026).

---

## Author
**Akash Kumar Vatse**  
📧 ak.vatse@gmail.com  
📍 Lucknow, Uttar Pradesh
