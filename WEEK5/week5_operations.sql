USE gram_panchayat_db;
SHOW TABLES;
SELECT * FROM Citizen;
SELECT * FROM Certificate_Type;
SELECT * FROM Panchayat_Office;
SELECT * FROM Certificate_Application;
SELECT COUNT(*) AS total_applications
FROM Certificate_Application;
SELECT COUNT(*) AS total_citizens
FROM Citizen;

SELECT COUNT(DISTINCT certificate_id) AS total_certificate_types
FROM Certificate_Application;

SELECT MIN(application_date) AS earliest_application_date
FROM Certificate_Application;

SELECT MAX(application_date) AS latest_application_date
FROM Certificate_Application;

SELECT application_status, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY application_status;

SELECT certificate_id, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_id;

SELECT office_id, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY office_id;

SELECT village, COUNT(*) AS total_citizens
FROM Citizen
GROUP BY village;

SELECT application_date, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY application_date;

SELECT certificate_id, office_id, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_id, office_id;

SELECT C.certificate_name, COUNT(*) AS total_applications
FROM Certificate_Application A
JOIN Certificate_Type C
ON A.certificate_id = C.certificate_id
GROUP BY C.certificate_name;

SELECT application_status, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY application_status;


-- Task 2: Number of applications for each certificate type

SELECT certificate_id, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_id;

SELECT office_id, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY office_id;

SELECT village, COUNT(*) AS total_citizens
FROM Citizen
GROUP BY village;

SELECT application_date, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY application_date;


-- Task 6: Number of applications for each certificate type
-- at each Panchayat Office

SELECT certificate_id, office_id, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_id, office_id;

SELECT C.certificate_name, COUNT(*) AS total_applications
FROM Certificate_Application A
JOIN Certificate_Type C
ON A.certificate_id = C.certificate_id
GROUP BY C.certificate_name;

SELECT P.office_name, COUNT(*) AS total_applications
FROM Certificate_Application A
JOIN Panchayat_Office P
ON A.office_id = P.office_id
GROUP BY P.office_name;
