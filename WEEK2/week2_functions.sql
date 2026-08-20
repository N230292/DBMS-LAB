SHOW DATABASES;
DROP DATABASE gram_panchayat_db;

CREATE DATABASE gram_panchayat_db;
USE gram_panchayat_db;
CREATE TABLE citizen(
 citizen_id INT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 date_of_birth DATE NOT NULL,
 gender VARCHAR(10) NOT NULL,
 mobile_number VARCHAR(15) UNIQUE NOT NULL,
 occupation VARCHAR(50),
 village_name VARCHAR(50) NOT NULL,
 is_active BOOLEAN NOT NULL);
 
 INSERT INTO citizen
(citizen_id,name,date_of_birth,gender,mobile_number,
 occupation,village_name,is_active)
 VALUES
 
 (2,'kutty','2000-08-12','female','8308656859','engineer','kasibugga',TRUE),
 (3,'chitti','1989-08-13','male','9876543210','teacher','nuzvid',TRUE),
 (4,'Cutie','2007-12-12','female','8309784880','nurse','heerapuram',FALSE),
 (5,'potti','2011-11-11','female','7654321890','doctor','srikakalam',FALSE)
 (107,'ramesh','1999-05-20','male','9000549402','fruitseller','palasa',TRUE);

UPDATE citizen
 SET occupation='electrical technician' WHERE citizen_id=5;
 DELETE FROM citizen WHERE citizen_id=107;
 
 ALTER TABLE citizen
 ADD address VARCHAR(200);
 
 SELECT upper(name) AS name FROM citizen;
 SELECT LOWER(village_name) AS village_name FROM citizen;
 SELECT name,length(name) AS name_length FROM citizen;

 SELECT CONCAT(name,'-',village_name) AS details FROM citizen;
SELECT CONCAT('citizen:',name,'\n village:', village_name) AS details FROM citizen;
SELECT round(application_fee) AS application_fee FROM certificate;
SELECT abs(processing_days-10) AS difference FROM certificate;
SELECT power(processing_days,2) AS square FROM certificate;
SELECT mod(processing_days,3) AS remainder FROM certificate;

SELECT * FROM citizen;
 
 CREATE TABLE certificate(
		certificate_type_id INT PRIMARY KEY,
		certificate_name VARCHAR(100) UNIQUE NOT NULL,
		description VARCHAR(200) NOT NULL,
		processing_days INT NOT NULL,
		application_fee DECIMAL(8,2) NOT NULL,
		is_available BOOLEAN NOT NULL );

INSERT INTO certificate
(certificate_type_id,certificate_name,description,processing_days,application_fee,is_available)
VALUES
(1,'residence_certificate','certifies the declared place of residence',7,'30.00',TRUE),
(2,'birth record request','request for a locally maintainedd birth record',5,'20.00',TRUE),
(3,'death record request','request for a locally maintained death record',5,'40.00',FALSE),
(4,'family member certificate','records declared family mem',10,'50.00',TRUE),
(5,'property certificate','certifies related to locally maintained property records',7,'30.00',TRUE),
(6,'No-dues certificate','indicates applicable local dues status',8,'25.00',TRUE),
(7,'income certificate','certifies annual income',7,'35.00',TRUE);

UPDATE certificate
SET processing_days=12 WHERE certificate_type_id=5;

UPDATE certificate
SET is_available=FALSE WHERE certificate_type_id=6;

DELETE FROM citizen WHERE citizen_id=7;

 SELECT REPLACE (certificate_name,'certificate','cert.') AS certificate_name FROM certificate;
 SELECT TRIM(certificate_name) AS certificate_name FROM certificate;
SELECT round(application_fee,1) AS application_fee FROM certificate;
SELECT ceil(application_fee) AS ceiling,floor(application_fee) AS floor FROM certificate;
SELECT floor(rand() * 100)+1 AS random_number;
SELECT sqrt(processing_days) AS square_root FROM certificate;
SELECT processing_days * 2 AS doubled_days FROM certificate;

-- SELECT application_date,date_add(application_date,interval processing_days day)AS issue_date FROM certificate;	

SELECT cast(application_fee AS signed)AS application_fee FROM certificate;
SELECT cast(application_fee AS char)AS application_fee FROM certificate;

SELECT cast(processing_days AS char)AS processing_days FROM certificate;
SELECT cast(processing_days AS decimal(5,2))AS processing_days FROM certificate;
SELECT cast(application_fee AS decimal(10,2))+100 AS total_fee FROM certificate;


SELECT * FROM certificate;
 
 
 
CREATE TABLE certificate_application
(application_id INT PRIMARY KEY,
citizen_id INT NOT NULL,
certificate_name VARCHAR(100) NOT NULL,
application_date DATE NOT NULL,
purpose VARCHAR(200) NOT NULL,
application_status VARCHAR(30) NOT NULL,
free_paid DECIMAL(8,2) NOT NULL,
reference_number VARCHAR(30) UNIQUE NOT NULL);

INSERT INTO certificate_application
(application_id,citizen_id,certificate_name,application_date,purpose,
application_status,free_paid,reference_number)
VALUES
(1,101,'residence certificate','2026-07-01','bank account documentation','submitted','30.00','GP20260001'),
(2,102,'family member certificate','2026-07-02','welfare scheme application','under review','20.00','GP20260002'),
(3,103,'property certificate','2026-07-03','property documentation','submitted','40.00','GP20260003'),
(4,104,'residence certificate','2026-07-04','college admission ','approved','30.00','GP20260004'),
(5,105,'no-dues certificate','2026-07-05','local service requirement','submitted','20.00','GP20260005'),
(6,106,'birth record request','2026-07-06','personal documentation','rejected','40.00','GP20260006');

UPDATE certificate_application
SET application_status='under review' WHERE application_id=1;
UPDATE certificate_application
SET application_status='approved' WHERE application_id=2;

ALTER TABLE certificate_application
ADD issued_date DATE;

ALTER TABLE certificate_application
ADD issued_date DATE;

ALTER TABLE certificate_application
MODIFY purpose VARCHAR(200);

SELECT curdate();
SELECT now();
SELECT year(application_date) AS year FROM certificate_application;	
SELECT month(application_date) AS month FROM certificate_application;	
SELECT day(application_date) AS day FROM certificate_application;


SELECT date_add(application_date,interval 30 day) AS new_date FROM certificate_application;
SELECT date_sub(application_date,interval 7 day) AS previous_date FROM certificate_application;
SELECT datediff(curdate(),application_date)AS days_difference FROM certificate_application;

SELECT cast(application_date AS datetime)AS application_date FROM certificate_application;


 SELECT LEFT(reference_number,4) FROM certificate_application;
 SELECT * FROM certificate_application WHERE reference_number LIKE 'GP2026%'; 
 SELECT * FROM certificate_application;

CREATE TABLE panchayat_office(
office_id INT PRIMARY KEY,
office_name VARCHAR(100) NOT NULL,
village_name VARCHAR(50) NOT NULL,
pincode VARCHAR(6) NOT NULL,
contact_number VARCHAR(15) unique,
office_email VARCHAR(100) UNIQUE,
opening_time TIME NOT NULL,
is_opertional BOOLEAN NOT NULL);

INSERT INTO panchayat_office
(office_id,office_name,village_name,pincode,contact_number,office_email,opening_time,is_opertional)
VALUES
(1,'ramapuram gram panchayat','ramapuram','521101','0866000001','ramapuram@p.example','09:00:00',TRUE),
(2,'seethampeta gram panchayat','seethampeta','521102','0866000002','seethampeta@p.example','09:30:00',TRUE),
(3,'lakshmipuram gram panchayat','lakshmipuram','521103','0866000003','lakshmipurampuram@p.example','09:00:00',TRUE),
(4,'krishnapuram gram panchayat','krishnapuram','521104','0866000004','krishnapurampuram@p.example','09:30:00',TRUE),
(5,'venkatapuram gram panchayat','venkatapuram','521105','0866000005','venkatapuram@p.example','09:00:00',TRUE),
(6,'gopalapuram gram panchayat','gopalapuram','521106','0866000006','gopalapuram@p.example','09:00:00',TRUE);


ALTER TABLE panchayat_office
ADD closing_time TIME;
ALTER TABLE panchayat_office
ADD closing_time TIME;

ALTER TABLE panchayat_office DROP is_opertaional;
TRUNCATE TABLE panchayat_office;
SELECT curdate();
SELECT * FROM panchayat_office;
