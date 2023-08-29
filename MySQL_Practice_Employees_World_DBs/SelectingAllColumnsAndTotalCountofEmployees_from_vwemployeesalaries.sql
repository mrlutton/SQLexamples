/*
SELECT sub.*, COUNT(emp_no)
FROM (
    SELECT *
    FROM vwemployeesalaries
) AS sub
GROUP BY full_name, emp_no, gender, hire_date -- List all non-aggregated columns here
;
*/

SELECT *, (SELECT COUNT(emp_no) FROM vwemployeesalaries) AS total_employee_count
FROM vwemployeesalaries;