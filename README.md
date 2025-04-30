# ✈️ Flight Booking System (MySQL)

A comprehensive **Flight Booking System** developed using **MySQL**, designed to simulate real-world airline booking operations. This project manages flights, passengers, bookings, schedules, and airports using a structured relational database. Ideal for students, backend developers, and database learners to explore SQL design, normalization, and query execution.

---

## 📌 Features

- 🧾 Passenger Registration and Booking
- 🛫 Flight Management (CRUD)
- 🗓️ Schedule Management (Date, Time, Route)
- 🏙️ Airport Information Management
- 🔍 Search Flights by Date, Route, or Flight ID
- 📄 Sample Data and Query Examples Included

---

## 🛠️ Tech Stack

| Technology | Version |
|------------|---------|
| MySQL      | 8.0+    |
| SQL        | DDL, DML, Joins, Views, Indexes |
| ER Design  | Normalized to 3NF |

---

## 🧱 Database Schema Overview

```plaintext
┌─────────────┐       ┌────────────┐      ┌─────────────┐
│  Passengers │──────▶│  Bookings  │◀────▶│   Flights   │
└─────────────┘       └────────────┘      └─────────────┘
                           ▲
                           │
                     ┌─────────────┐
                     │  Schedules  │
                     └─────────────┘
                           ▲
                           │
                     ┌─────────────┐
                     │  Airports   │
                     └─────────────┘
