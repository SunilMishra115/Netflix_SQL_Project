# Netflix_SQL_Project

# 🎬 Netflix Data Analysis using SQL

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange)
![Dataset](https://img.shields.io/badge/Dataset-Netflix-red)
![Project](https://img.shields.io/badge/Project-Data%20Analysis-success)

---

# 📖 Project Overview

This project analyzes the **Netflix Movies and TV Shows Dataset** using **MySQL 8.0**. It demonstrates how SQL can be used to clean, transform, analyze, and extract business insights from real-world data.

The project contains **15 real-world business problems** ranging from beginner to advanced SQL concepts, making it an excellent portfolio project for **Data Analysts**, **Business Analysts**, and **Data Engineers**.

---

# 🎯 Project Objectives

- Design and create a relational database.
- Import and manage a real-world Netflix dataset.
- Solve business problems using SQL.
- Practice analytical SQL queries.
- Learn Recursive Common Table Expressions (Recursive CTEs).
- Perform string manipulation and data transformation.
- Generate meaningful business insights.

---

# 📂 Dataset Information

The dataset contains information about Netflix content, including:

- Movies
- TV Shows
- Directors
- Cast Members
- Countries
- Ratings
- Genres
- Release Year
- Date Added
- Duration
- Description

**Total Records:** **8,807**

---

# 🗄 Database Schema

### Database

```
netflix_db1
```

### Table

```
netflix
```

| Column | Description |
|----------|-------------|
| show_id | Unique Content ID |
| type_show | Movie / TV Show |
| title | Content Title |
| director | Director Name |
| cast_members | Cast Members |
| country | Country of Production |
| date_added | Date Added to Netflix |
| release_year | Release Year |
| rating | Content Rating |
| duration | Movie Duration / TV Seasons |
| listed_in | Genre |
| description | Content Description |

---

# 🚀 Business Problems Solved

## Basic SQL

✔ Count Movies vs TV Shows

✔ Find Movies Released in a Specific Year

✔ Identify the Longest Movie

✔ Find Content Added in the Last 5 Years

✔ Find Content by a Specific Director

✔ List TV Shows with More Than 5 Seasons

✔ List Movies Categorized as Documentaries

✔ Find Content Without a Director

---

## Intermediate SQL

✔ Find the Most Common Rating for Movies and TV Shows

✔ Find Top 5 Countries with the Most Netflix Content

✔ Count Content Available in Each Genre

✔ Calculate Year-wise Average Content Added in India

✔ Find Movies Featuring Salman Khan

✔ Find the Top 10 Most Featured Actors

✔ Categorize Content as Good or Bad Based on Description

---

# 🔥 Advanced SQL Concepts Used

This project demonstrates several advanced SQL concepts commonly used in industry.

### ✅ Common Table Expressions (CTE)

Used to simplify complex SQL queries and improve readability.

---

### ✅ Recursive CTE

Implemented Recursive CTEs to split comma-separated values into multiple rows.

Used for:

- Country Analysis
- Genre Analysis
- Cast Member Analysis

---

### ✅ Window Functions

Used:

- `RANK()`

to determine the most common ratings for Movies and TV Shows.

---

### ✅ Aggregate Functions

- COUNT()
- MAX()
- ROUND()

---

### ✅ String Functions

- SUBSTRING()
- SUBSTRING_INDEX()
- TRIM()
- LENGTH()
- LIKE()

---

### ✅ Conditional Logic

- CASE WHEN
- NULL Handling

---

### ✅ Date Functions

- CURRENT_DATE()
- INTERVAL
- YEAR()

---

### ✅ Filtering & Sorting

- WHERE
- ORDER BY
- LIMIT

---

### ✅ Grouping

- GROUP BY

---

# 📊 Key Business Insights

This project answers important business questions such as:

- What percentage of Netflix content is Movies vs TV Shows?
- Which rating is most common?
- Which countries produce the most Netflix content?
- Which genres dominate Netflix?
- Which actors appear most frequently?
- Which directors have the most titles?
- Which content has no assigned director?
- How has Netflix content grown in India?
- Which TV Shows have the highest number of seasons?
- Which content contains violent keywords?

---

# 📁 Repository Structure

```
Netflix-SQL-Data-Analysis/
│
├── README.md
├── netflix_analysis.sql
├── netflix_titles.csv
└── Dataset_Information.pdf (Optional)
```

---

# 💻 Technologies Used

- MySQL 8.0
- SQL
- Relational Database
- MySQL Workbench

---

# 🎓 Skills Demonstrated

This project showcases practical SQL skills including:

- Database Creation
- Table Design
- Data Import
- Data Cleaning
- String Manipulation
- Recursive SQL
- Window Functions
- Business Analysis
- Query Optimization
- Analytical Thinking

---

# 📚 SQL Concepts Covered

- CREATE DATABASE
- CREATE TABLE
- SELECT
- WHERE
- GROUP BY
- ORDER BY
- LIMIT
- DISTINCT
- CASE WHEN
- LIKE
- Aggregate Functions
- Window Functions
- Common Table Expressions (CTE)
- Recursive CTE
- String Functions
- Date Functions

---

# 🌟 Why This Project?

Unlike basic SQL tutorials, this project demonstrates how SQL is used to solve **real-world business problems**.

The implementation of **Recursive CTEs** for splitting comma-separated values (Countries, Genres, and Cast Members) is an advanced SQL technique frequently used in production environments.

This project is an excellent addition to a portfolio for:

- Data Analyst
- Business Analyst
- Data Engineer
- SQL Developer
- Database Administrator

---

# 🚀 Future Enhancements

- SQL Views
- Stored Procedures
- Indexing
- Triggers
- Query Optimization
- Power BI Dashboard
- Tableau Dashboard
- Python Data Analysis
- Interactive Reporting

---

# 👨‍💻 Author

Sunil Mishra

MS in Data Science

Data Analyst | SQL | Python | Excel | Tableau | Power BI

If you found this project helpful, don't forget to ⭐ **Star the repository**.
