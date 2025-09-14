-- Join
SELECT p.pat_id, p.pat_name, a.admission_date
FROM Patient p
INNER JOIN Admission a ON p.pat_id = a.pat_id
WHERE a.discharge_date IS NULL;


-- sub query
SELECT pat_id, pat_name, gender
FROM Patient
WHERE pat_id IN (
    SELECT pat_id 
    FROM Admission 
    WHERE discharge_date IS NULL
);

select * from patient;
select * from appointment;
select pat_name from patient where age < 30;
select pat_name,phone from patient where address='Hyderabad';

SELECT pat_name 
FROM Patient 
WHERE age = (SELECT MAX(age) FROM Patient);

select pat_id from patient where pat_id in (select pat_id
from appointment group by pat_id having count(app_id)>1);






select * from doctor;
select * from patient;
select * from appointment;
select * from department;

SELECT  p.pat_name
FROM Patient p
JOIN Appointment a ON p.pat_id = a.pat_id
JOIN Doctor d ON a.doc_id = d.doc_id
WHERE d.specialization = 'Cardiology';


/*Doctor and Department */
select * from doctor;
select * from department;

select count(doc_id) from doctor;

select d.doc_name,d.specialization,dt.dept_name from doctor d
left join department dt on d.dept_id=dt.dept_id;

select doc_name from doctor where dept_id in (select dept_id
from department where dept_name ='neurology' );

SELECT dept_id, COUNT(doc_id) AS doctor_count
FROM doctor
GROUP BY dept_id;

select * from appointment;
select * from doctor;

SELECT d.doc_name, COUNT(a.app_id) AS total_appointments
FROM doctor d
JOIN appointment a ON d.doc_id = a.doc_id
GROUP BY d.doc_id, d.doc_name
ORDER BY total_appointments DESC
LIMIT 1;

select doc_name from doctor where doc_id in( select doc_id from
 appointment where status='cancelled');
 
 select doc_name from doctor where specialization ='orthopedic';
 
 
 /* APPOINTMENT */
select  * from appointment;

select appointment_date from appointment 
where appointment_date > CURDATE();

select * from appointment
where status='Completed';

select count(appointment_date) from appointment
where count(appointment_date)>1 ;

select * from doctor;
select * from patient;

SELECT p.pat_name
FROM Patient p
JOIN Appointment a ON p.pat_id = a.pat_id
JOIN Doctor d ON a.doc_id = d.doc_id
WHERE d.specialization = 'Cardiologist';


 /*STAFF QUERIES*/
 
 SELECT staff_name, dept_id FROM Staff WHERE role = 'Nurse';

SELECT s.staff_name, s.role
FROM Staff s
JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Pediatrics';


/* Advanced queries */

-- 1. Department with the highest number of patients admitted

SELECT d.dept_name, COUNT(a.pat_id) AS total_patients
FROM Department d
JOIN Admission a ON d.dept_id = a.dept_id
GROUP BY d.dept_name
ORDER BY total_patients DESC
LIMIT 1;

-- 2. Average age of patients department-wise (admitted)
SELECT d.dept_name, AVG(p.age) AS avg_age
FROM Patient p
JOIN Admission a ON p.pat_id = a.pat_id
JOIN Department d ON a.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 3. Total appointments status summary
SELECT status, COUNT(*) AS total
FROM Appointment
GROUP BY status;

-- 4. Doctors who have not received any appointments
SELECT d.doc_name
FROM Doctor d
LEFT JOIN Appointment a ON d.doc_id = a.doc_id
WHERE a.app_id IS NULL;


-- 5. Patients who never had any appointments
SELECT p.pat_name
FROM Patient p
LEFT JOIN Appointment a ON p.pat_id = a.pat_id
WHERE a.app_id IS NULL;





























