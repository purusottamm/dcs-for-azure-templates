--
-- Copyright (c) 2025 by Delphix. All rights reserved.
--

-- Test SQL file for GitHub Actions pre-commit validation
-- This file tests SQL formatting and validation hooks

-- Create a sample test table
CREATE TABLE test_table (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_date DATETIME DEFAULT GETDATE(),
    status BIT DEFAULT 1
);

-- Insert sample data
INSERT INTO test_table (id, name, status) 
VALUES 
    (1, 'Test Record 1', 1),
    (2, 'Test Record 2', 1),
    (3, 'Test Record 3', 0);

-- Sample query with formatting
SELECT 
    t.id,
    t.name,
    t.created_date,
    CASE 
        WHEN t.status = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS status_text
FROM test_table t
WHERE t.created_date >= DATEADD(day, -30, GETDATE())
ORDER BY t.created_date DESC;

-- Clean up
DROP TABLE test_table;