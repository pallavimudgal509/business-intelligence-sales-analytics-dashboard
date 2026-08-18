-- ============================================================
-- Business Intelligence & Sales Analytics Dashboard
-- Data Validation & Cleaning
-- Database: PostgreSQL
-- ============================================================

-- 1. Check the products table structure
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'products'
ORDER BY ordinal_position;


-- 2. Check the number of products
SELECT COUNT(*)
FROM products;


-- 3. Preview the products table
SELECT *
FROM products
LIMIT 10;


-- 4. Create a corrected products table
CREATE TABLE products_correct (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100)
);


-- 5. Verify the corrected product data
SELECT *
FROM products_correct
ORDER BY product_id;


-- 6. Confirm the corrected table contains 50 products
SELECT COUNT(*)
FROM products_correct;


-- 7. Update the existing products table
-- Product names and categories are corrected using
-- the validated products_correct table.

UPDATE products p
SET
    product_name = pc.product_name,
    category = pc.category
FROM products_correct pc
WHERE p.product_id = pc.product_id;


-- 8. Verify the updated products table
SELECT *
FROM products
ORDER BY product_id
LIMIT 50;


-- 9. Confirm the final product count
SELECT COUNT(*)
FROM products;