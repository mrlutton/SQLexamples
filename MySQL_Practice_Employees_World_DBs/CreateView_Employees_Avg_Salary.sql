--CREATE OR
ALTER VIEW vwEmployeeSalaries 
AS
SELECT 
	CONCAT(first_name,' ', last_name) as full_name,
    emp_no,
    gender,
    hire_date,
    avg(salary)
    FROM employees e
    LEFT JOIN salaries USING (emp_no)
    GROUP BY full_name, emp_no, gender, hire_date;