--List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1-1-1986' AND '12-31-1986'

----List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT departments.dept_no, departments.dept_name, dept_man.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN department_manager AS dept_man
ON departments.dept_no = dept_man.dept_no
JOIN employees
ON dept_man.emp_no = employees.emp_no;
select * from department_manager
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM department_employees AS dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no 

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN
	(SELECT emp_no 
	FROM department_employees AS dept_emp
	WHERE dept_no = 'd007')

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW "create_1" AS
SELECT department_employees.emp_no,
employees.last_name, employees.first_name,
departments.dept_name
FROM department_employees
JOIN employees
ON department_employees.emp_no = employees.emp_no
JOIN departments
ON department_employees.dept_no = departments.dept_no;


SELECT emp_no, first_name, last_name, dept_name
FROM create_1
WHERE emp_no IN
	(SELECT emp_no
	FROM department_employees
	WHERE dept_no = 'd007' OR dept_no = 'd005');
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(*)
FROM employees
GROUP By last_name
ORDER BY
COUNT(last_name) DESC;


