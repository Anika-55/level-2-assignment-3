# 🚗 Vehicle Rental System Database (PostgreSQL)

## 📌 Project Overview
The **Vehicle Rental System Database** is designed to manage a simple vehicle rental business.  
It handles users, vehicles, and bookings, ensuring proper relationships, data integrity, and efficient querying.

This project is built using **PostgreSQL** and follows **relational database design principles** including:
- Primary Keys (PK)
- Foreign Keys (FK)
- One-to-Many and Many-to-One relationships
- ENUM-based status fields

---

## 🗂️ Database Tables

### 1️⃣ Users
Stores information about system users (Admin and Customers).

**Key Fields**
- `id` (PK)
- `name`
- `email` (UNIQUE)
- `password`
- `phone`
- `role` (admin, customer)
- `created_at`

**Purpose**
- One user can create multiple bookings.

---

### 2️⃣ Vehicles
Stores information about vehicles available for rent.

**Key Fields**
- `id` (PK)
- `name`
- `model`
- `registration_number` (UNIQUE)
- `price_per_day`
- `type` (car, bike, truck)
- `status` (available, rented, maintenance)
- `created_at`

**Purpose**
- One vehicle can be booked multiple times over time.

---

### 3️⃣ Bookings
Stores rental booking details.

**Key Fields**
- `id` (PK)
- `user_id` (FK → users.id)
- `vehicle_id` (FK → vehicles.id)
- `start_date`
- `end_date`
- `status` (pending, confirmed, completed, cancelled)
- `total_cost`
- `created_at`

**Purpose**
- Connects users and vehicles.
- Each booking references exactly one user and one vehicle.

---

## 🔗 Entity Relationships

| Relationship | Description |
|-------------|------------|
| One-to-Many | One user can have many bookings |
| Many-to-One | Many bookings can belong to one vehicle |
| Logical One-to-One | Each booking links one user and one vehicle |

**ERD Structure**
ERD Link:https://drawsql.app/teams/anika-6/diagrams/new-diagram


---

## 📊 Status Fields
Status fields are used to represent real-world business states.

- **Vehicle Status**
  - available
  - rented
  - maintenance

- **Booking Status**
  - pending
  - confirmed
  - completed
  - cancelled

---

## 🧪 Queries & Practice
All required SQL queries are stored in the `queries.sql` file, including:
- JOIN queries
- EXISTS / NOT EXISTS
- WHERE filtering
- GROUP BY and HAVING

Each query is written with comments for easy understanding.

---

## 🛠️ Technologies Used
- PostgreSQL
- drawSQL (for ERD)
- SQL (DDL & DML)

---

## ✅ Conclusion
This database design follows proper normalization, maintains data integrity, and supports efficient querying for a real-world vehicle rental system.










