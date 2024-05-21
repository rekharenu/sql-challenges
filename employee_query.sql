-- employee number, last name, first name, sex, and salary
SELECT employee.emp_no,
 employee.last_name,
 employee.first_name,
 employee.sex, 
 salaries.salary
 employee.hire_data
FROM employees 
JOIN salaries 
ON employee.emp_no = salaries.emp_no;

-- first name, last name, and hire date for employees hired in 1986
SELECT first_name, 
last_name, 
hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-1-1' and '1986-12-31'
ORDER BY hire_date ASC;

-- managers in each department 
SELECT dept_mang.dept_no, 
dept_mang.dept_name, 
dept_mang.emp_no, 
employee.last_name, 
employee.first_name 
FROM dept_manager dept_mang
JOIN employees employee
ON dept_mang.emp_no = employee.emp_no
JOIN departments dept
ON dept_mang.dept_no = dept.dept_no
ORDER BY dept.dept_name ASC;

-- department of each employee 
SELECT employee.emp_no, 
employee.last_name, 
employee.first_name, 
dept.dept_name
FROM employees employee
JOIN dept_emp de 
ON employee.emp_no = de.emp_no
JOIN departments dept
ON dept.dept_no = de.dept_no
ORDER BY dept.dept_name ASC;


SELECT first_name, 
last_name, 
sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC;

-- employees in Sales 
SELECT employee.emp_no, 
employee.last_name, 
employee.first_name, 
dept.dept_name
FROM employees employee
JOIN dept_emp de 
ON employee.emp_no = de.emp_no
JOIN departments dept
ON dept.dept_no = de.dept_no
WHERE dept.dept_name = 'Sales';

-- employees in Sales and Development departments 
SELECT employee.emp_no, 
employee.last_name, 
employee.first_name, 
dept.dept_name
FROM employees employee
JOIN dept_emp de 
ON employee.emp_no = de.emp_no
JOIN departments dept
ON dept.dept_no = de.dept_no
WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development'
ORDER BY dept.dept_name ASC;

--  count of employee last names
SELECT last_name, count(emp_no) as num_employees_with_same_last_name
FROM employees
GROUP BY last_name
ORDER BY num_employees_with_same_last_name DESC;

-- create view for bonus bar chard of avg salary by title
CREATE VIEW avg_salaries_by_title AS
SELECT round(avg(salary.salary)) as avg_salary, t.title
FROM titles t
JOIN employees employee
ON t.title_id = employee.emp_title_id
JOIN salaries salary
ON employee.emp_no = salary.emp_no
GROUP BY t.title;