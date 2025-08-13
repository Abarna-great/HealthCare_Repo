use healthcare_management;

-- scalar subquery
SELECT pat_name, pat_age
FROM Patient
WHERE pat_age = (
    SELECT MAX(pat_age)
    FROM Patient
); 


SELECT dept_name, location
FROM Department
WHERE LENGTH(dept_name) = (
    SELECT MAX(LENGTH(dept_name))
    FROM Department
);

SELECT doc_name, dept_id
FROM Doctor
WHERE dept_id = (
    SELECT MIN(dept_id)
    FROM Doctor
);

SELECT staff_name, staff_role
FROM Staff
WHERE LENGTH(staff_name) = (
    SELECT MAX(LENGTH(staff_name))
    FROM Staff
);

SELECT dept_id, dept_name
FROM Department
WHERE dept_id = (
    SELECT ROUND(AVG(dept_id))
    FROM Department
);

SELECT staff_name, dept_id
FROM Staff
WHERE dept_id = (
    SELECT dept_id
    FROM Staff
    GROUP BY dept_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

SELECT appointment_id, appointment_date
FROM Appointment
WHERE YEAR(appointment_date) = (
    SELECT MAX(YEAR(appointment_date))
    FROM Appointment
);

SELECT p1.pat_name, p1.pat_gender, p1.pat_age
FROM Patient p1
WHERE p1.pat_age > (
    SELECT AVG(p2.pat_age)
    FROM Patient p2
    WHERE p2.pat_gender = p1.pat_gender
);

SELECT doc_name
FROM Doctor
WHERE doc_id IN (
    SELECT doc_id
    FROM Appointment
);

SELECT pat_name
FROM Patient p
WHERE EXISTS (
    SELECT 1
    FROM Admission a
    WHERE a.pat_id = p.pat_id
);

SELECT doc_name
FROM Doctor
WHERE doc_id = (
    SELECT doc_id
    FROM Appointment
    ORDER BY appointment_date ASC
    LIMIT 1
);
SELECT p1.pat_name, p1.pat_gender, p1.pat_age
FROM Patient p1
WHERE p1.pat_age > (
    SELECT AVG(p2.pat_age)
    FROM Patient p2
    WHERE p2.pat_gender = p1.pat_gender
);
