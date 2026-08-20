-- Select the database
USE gram_panchayat_db;
-- Display all tables available in the database
SHOW TABLES;


-- =========================================================================
-- Level 1 – Understanding
-- =========================================================================

-- Task-1: Display the names of citizens along with the certificate types they have applied for.
SELECT c.citizen_name, ct.certificate_name
FROM Citizen c
INNER JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id
INNER JOIN Certificate_Type ct ON ca.certificate_id = ct.certificate_id;

-- Task-2: Display the names of citizens along with the Panchayat Office where their applications were submitted.
SELECT c.citizen_name, po.office_name
FROM Citizen c
INNER JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id
INNER JOIN Panchayat_Office po ON ca.office_id = po.office_id;

-- Task-3: Display the Application ID, Citizen Name and Application Status for every certificate application.
SELECT ca.application_id, c.citizen_name, ca.application_status
FROM Citizen c
INNER JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id;

-- Task-4: Display the Citizen Name, Certificate Type and Application Date for every certificate application.
SELECT c.citizen_name, ct.certificate_name, ca.application_date
FROM Citizen c
INNER JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id
INNER JOIN Certificate_Type ct ON ca.certificate_id = ct.certificate_id;

-- Task-5: Display the complete details of every certificate application including Citizen Name, Certificate Type, Panchayat Office and Application Status.
SELECT ca.application_id, c.citizen_name, ct.certificate_name, po.office_name, ca.application_status
FROM Certificate_Application ca
INNER JOIN Citizen c ON ca.citizen_id = c.citizen_id
INNER JOIN Certificate_Type ct ON ca.certificate_id = ct.certificate_id
INNER JOIN Panchayat_Office po ON ca.office_id = po.office_id;


-- =========================================================================
-- Level 2 – Application
-- =========================================================================

-- Task-6: Display all citizens who have applied for an Income Certificate along with the Panchayat Office name.
SELECT c.citizen_name, po.office_name
FROM Citizen c
INNER JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id
INNER JOIN Certificate_Type ct ON ca.certificate_id = ct.certificate_id
INNER JOIN Panchayat_Office po ON ca.office_id = po.office_id
WHERE ct.certificate_name = 'Income Certificate';

-- Task-7: Display all certificate applications submitted to Nuzvid Panchayat Office together with citizen details.
SELECT ca.application_id, ca.application_status, ca.application_date, c.*
FROM Certificate_Application ca
INNER JOIN Citizen c ON ca.citizen_id = c.citizen_id
INNER JOIN Panchayat_Office po ON ca.office_id = po.office_id
WHERE po.office_name = 'Nuzvid';

-- Task-8: Display every certificate application together with the certificate description and application status.
SELECT ca.application_id, ct.description, ca.application_status
FROM Certificate_Application ca
INNER JOIN Certificate_Type ct ON ca.certificate_id = ct.certificate_id;

-- Task-9: Display the Citizen Name, Village, Certificate Type, Panchayat Office and Application Date for every application.
SELECT c.citizen_name, c.village, ct.certificate_name, po.office_name, ca.application_date
FROM Certificate_Application ca
INNER JOIN Citizen c ON ca.citizen_id = c.citizen_id
INNER JOIN Certificate_Type ct ON ca.certificate_id = ct.certificate_id
INNER JOIN Panchayat_Office po ON ca.office_id = po.office_id;

-- Task-10: Display a complete Gram Panchayat Certificate Application Report containing Citizen details, Certificate details, Panchayat Office details and Application information.
SELECT 
    c.citizen_id, c.citizen_name, c.village,
    ct.certificate_id, ct.certificate_name, ct.description,
    po.office_id, po.office_name,
    ca.application_id, ca.application_date, ca.application_status
FROM Certificate_Application ca
INNER JOIN Citizen c ON ca.citizen_id = c.citizen_id
INNER JOIN Certificate_Type ct ON ca.certificate_id = ct.certificate_id
INNER JOIN Panchayat_Office po ON ca.office_id = po.office_id;


-- =========================================================================
-- Level 3 – Advanced JOIN Operations
-- =========================================================================

-- Task-11: Display all citizens including those who have not submitted any certificate applications.
SELECT c.citizen_id, c.citizen_name, ca.application_id
FROM Citizen c
LEFT OUTER JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id;

-- Task-12: Display all certificate types including those that have never been requested by any citizen.
SELECT ca.application_id, ct.certificate_id, ct.certificate_name
FROM Certificate_Application ca
RIGHT OUTER JOIN Certificate_Type ct ON ca.certificate_id = ct.certificate_id;

-- Task-13: Display all citizens and all certificate applications, including unmatched records from both tables (Simulating FULL OUTER JOIN in MySQL).
SELECT c.citizen_id, c.citizen_name, ca.application_id
FROM Citizen c
LEFT JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id
UNION
SELECT c.citizen_id, c.citizen_name, ca.application_id
FROM Citizen c
RIGHT JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id;

-- Task-14: Generate every possible combination of Citizens and Certificate Types.
SELECT c.citizen_name, ct.certificate_name
FROM Citizen c
CROSS JOIN Certificate_Type ct;

-- Task-15: Display pairs of citizens belonging to the same village without displaying the same citizen twice.
SELECT A.citizen_name AS Citizen_1, B.citizen_name AS Citizen_2, A.village
FROM Citizen A
INNER JOIN Citizen B ON A.village = B.village
WHERE A.citizen_id < B.citizen_id;