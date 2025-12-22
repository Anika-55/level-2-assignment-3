-- Query 1: JOIN
-- Retrieve booking information along with customer name and vehicle name

SELECT 
    b.id AS booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status,
    b.total_cost
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN vehicles v ON b.vehicle_id = v.id;


-- Query 2: NOT EXISTS
-- Find all vehicles that have never been booked

SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.id
);

-- Query 3: WHERE
-- Retrieve all available vehicles of a specific type (e.g., cars)
SELECT *
FROM vehicles
WHERE type = 'car' AND status = 'available';

-- Query 4: GROUP BY and HAVING
-- Find the total number of bookings for each vehicle and display only those with more than 2 bookings
SELECT 
    v.name AS vehicle_name,
    COUNT(b.id) AS total_bookings
FROM vehicles v
JOIN bookings b ON v.id = b.vehicle_id
GROUP BY v.id, v.name
HAVING COUNT(b.id) > 2;
