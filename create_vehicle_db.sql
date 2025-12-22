CREATE DATABASE vehicle_rental_db;


-- User roles
CREATE TYPE user_role AS ENUM ('admin', 'customer');

-- Vehicle types
CREATE TYPE vehicle_type AS ENUM ('car', 'bike', 'truck');

-- Vehicle status
CREATE TYPE vehicle_status AS ENUM ('available', 'rented', 'maintenance');

-- Booking status
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'completed', 'cancelled');

-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    role user_role NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Create vehicles table
CREATE TABLE vehicles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type vehicle_type NOT NULL,
    model VARCHAR(50),
    registration_number VARCHAR(50) NOT NULL UNIQUE,
    price_per_day NUMERIC(10,2) NOT NULL,
    status vehicle_status DEFAULT 'available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create bookings table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    vehicle_id INT NOT NULL REFERENCES vehicles(id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status booking_status DEFAULT 'pending',
    total_cost NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Users
INSERT INTO users (role, name, email, password, phone) VALUES
('admin', 'Alice Admin', 'alice@admin.com', 'pass123', '01710000001'),
('customer', 'Bob Customer', 'bob@gmail.com', 'pass123', '01710000002'),
('customer', 'Charlie Customer', 'charlie@gmail.com', 'pass123', '01710000003'),
('customer', 'Diana Customer', 'diana@gmail.com', 'pass123', '01710000004');

-- Insert Vehicles
INSERT INTO vehicles (name, type, model, registration_number, price_per_day, status) VALUES
('Toyota Corolla', 'car', '2022', 'CAR001', 50.00, 'available'),
('Honda Civic', 'car', '2021', 'CAR002', 45.00, 'available'),
('Yamaha FZ', 'bike', '2020', 'BIKE001', 20.00, 'available'),
('Suzuki GSX', 'bike', '2021', 'BIKE002', 25.00, 'rented'),
('Ford Ranger', 'truck', '2023', 'TRUCK001', 80.00, 'maintenance'),
('Isuzu D-Max', 'truck', '2022', 'TRUCK002', 75.00, 'available');

-- Insert Bookings
INSERT INTO bookings (user_id, vehicle_id, start_date, end_date, status, total_cost) VALUES
(2, 1, '2025-12-01', '2025-12-05', 'completed', 250.00),
(3, 2, '2025-12-10', '2025-12-12', 'confirmed', 90.00),
(4, 3, '2025-12-15', '2025-12-17', 'pending', 40.00),
(2, 4, '2025-12-20', '2025-12-22', 'completed', 50.00),
(3, 1, '2025-12-25', '2025-12-28', 'pending', 200.00);
