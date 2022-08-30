--(1)List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salary.salary
FROM employees
JOIN salaries AS salary
ON salary.emp_no = employees.emp_no

--(2)List first name, last name, and hire date for employees who were hired in 1986.


--(3)List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, manager.emp_no, employee.last_name, employee.first_name
FROM departments
JOIN dept_manager AS manager
ON departments.dept_no = manager.dept_no
JOIN employees AS employee
ON manager.emp_no = employee.emp_no

--(4)List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT employees.emp_no,employees.last_name,employees.first_name, department.dept_name
FROM employees
JOIN dept_emp AS dept
ON dept.emp_no = employees.emp_no
JOIN departments AS department
ON department.dept_no = dept.dept_no

--(5)List first name, last name, and sex
--for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'

--(6)List all employees in the Sales department,
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no,employees.last_name,employees.first_name, department.dept_name
FROM employees
JOIN dept_emp AS dept
ON dept.emp_no = employees.emp_no
JOIN departments AS department
ON department.dept_no = dept.dept_no
WHERE department.dept_name = 'Sales'

--(7)List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no,employees.last_name,employees.first_name, department.dept_name
FROM employees
JOIN dept_emp AS dept
ON dept.emp_no = employees.emp_no
JOIN departments AS department
ON department.dept_no = dept.dept_no
WHERE department.dept_name = 'Sales' OR department.dept_name = 'Development'

--(8)List the frequency count of employee last names
--(i.e., how many employees share each last name) in descending order.
SELECT employees.last_name,
	COUNT(employees.last_name) AS "Count"
FROM employees
GROUP BY employees.last_name
ORDER BY employees.last_name