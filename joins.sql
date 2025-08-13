use healthcare_management;

-- INNER JOIN
select p.* ,a.* from Patient p Inner Join Appointment a 
on p.pat_id= a.pat_id;
select p.* ,a.* from Patient p left Join Appointment a 
on p.pat_id= a.pat_id;
select p.* ,a.* from Patient p Right Join Appointment a 
on p.pat_id= a.pat_id;

select * from appointment;
select * from patient;
select * from doctor;
select p.pat_name,d.doc_name from patient p Inner Join Doctor d On 
p.pat_id=d.doc_id;

SELECT 
    p.pat_name,
    a.appointment_date,
    a.status,
    d.doc_name
FROM Appointment a
INNER JOIN Patient p ON a.pat_id = p.pat_id
INNER JOIN Doctor d ON a.doc_id = d.doc_id;

SELECT 
    d.doc_name,
    dept.dept_name
FROM Doctor d
LEFT JOIN Department dept ON d.dept_id = dept.dept_id;

SELECT 
    s.staff_name,
    dept.dept_name
FROM Staff s
RIGHT JOIN Department dept ON s.dept_id = dept.dept_id;


SELECT 
    s.staff_name,
    s.staff_role,
    dept.dept_name
FROM Staff s
INNER JOIN Department dept ON s.dept_id = dept.dept_id
WHERE s.staff_role = 'Nurse';

SELECT 
    d.doc_name,
    a.appointment_date,
    a.status
FROM Doctor d
RIGHT JOIN Appointment a ON d.doc_id = a.doc_id;


SELECT 
    d.doc_name,
    a.appointment_date,
    a.status
FROM Doctor d
RIGHT JOIN Appointment a ON d.doc_id = a.doc_id;

