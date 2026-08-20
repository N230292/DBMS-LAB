USE gram_panchayat_db;
SHOW TABLES;

ALTER TABLE certificate_application
DROP COLUMN certificate_name;

ALTER TABLE certificate_application
DROP COLUMN office_name;

ALTER TABLE certificate_application
ADD COLUMN certificate_id INT;

ALTER TABLE certificate_application
ADD COLUMN office_id INT;



ALTER TABLE certificate_application
ADD CONSTRAINT fk_citizen
FOREIGN KEY (citizen_id)
REFERENCES citizen(citizen_id);

ALTER TABLE certificate_application
ADD CONSTRAINT  fk_certificate
FOREIGN KEY(certificate_id)
REFERENCES certificate(certificate_type_id);

ALTER TABLE certificate_application
ADD CONSTRAINT fk_office
FOREIGN KEY (office_id)
REFERENCES panchayat_office(office_id);

SHOW CREATE TABLE certificate_application;
DESCRIBE certificate_application; 

INSERT INTO certificate_application(application_id,citizen_id,certificate_id,office_id)
VALUES(101,999,1,1);  
INSERT INTO certificate_application(application_id,citizen_id,certificate_id,office_id)
VALUES(102,1,999,1);
DELETE FROM citizenbbp
WHERE citizen_id=1;
DELETE FROM certificate_type
WHERE certificate_id=1;

SELECT * FROM citizen;
SELECT * FROM certificate_application;
SELECT name FROM citizen ORDER BY name ASC;
SELECT DISTINCT village_name FROM citizen;
SELECT DISTINCT certificate_name FROM certificate_type;
SELECT DISTINCT office_name FROM panchayat_office;
SELECT * FROM certificate_application WHERE application_status='pending';
SELECT * FROM citizen WHERE village='ramapuram';
SELECT * FROM certificate_application WHERE YEAR(application_date)=2026;
SELECT * FROM certificate_application ORDER BY application_date DESC;
SELECT * FROM certificate_application WHERE office_id=(SELECT office_id FROM panchayat_office
 WHERE office_name='seethampeta gram panchayat');

 SELECT name FROM citizen 
 JOIN certificate_application ON citizen.citizen_id=certificate_application.citizen_id
 JOIN certificate  ON certificate_application.citizen_id=certificate.certificate_type_id
 WHERE certificate_name='income certificate';

SELECT name FROM citizen JOIN certificate_application  ON citizen.citizen_id=certificate_application.citizen_id
JOIN certificate  ON certificate_application.citizen_id=certificate.certificate_type_id WHERE certificate_name='income certificate'
UNION
SELECT name FROM citizen JOIN certificate_application  ON citizen.citizen_id=certificate_application.citizen_id
JOIN certificate  ON certificate_application.citizen_id=certificate.certificate_type_id WHERE certificate_name='residence_certificate';

SELECT * FROM certificate_application WHERE MONTH(application_date)=1
UNION
SELECT * FROM certificate_application WHERE MONTH(application_date)=2;

SELECT * FROM citizen WHERE village_name='ramapuram'
UNION 
SELECT * FROM citizen WHERE village_name='lakshmipuram';