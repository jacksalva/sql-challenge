--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary, e.hire_date
FROM employees as e
LEFT JOIN salaries as s on e.emp_no = s.emp_no;

--List employees who were hired in 1986.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary, e.hire_date
FROM employees as e
LEFT JOIN salaries as s on e.emp_no = s.emp_no
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: 
	--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM "Departments" as d
LEFT JOIN dept_manager as m on d.dept_no = m.dept_no
LEFT JOIN employees as e on e.emp_no = m.emp_no
WHERE m.to_date = '9999-01-01';

--List the department of each employee with the following information:
	--employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
LEFT JOIN dept_emp as x on e.emp_no = x.emp_no
LEFT JOIN "Departments" as d on x.dept_no = d.dept_no
ORDER BY e.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name
From employees as e
where e.first_name = 'Hercules'
	and e.last_name Like 'B%';
	
--List all employees in the Sales department
--including their employee number, last name, first name, and department name.
SELECT *
FROM (SELECT e.emp_no as employeeNumber, e.last_name as lastName, e.first_name as firstName, d.dept_name as departmentName
	  FROM employees as e
	  LEFT JOIN dept_emp as x on e.emp_no = x.emp_no
	  LEFT JOIN "Departments" as d on x.dept_no = d.dept_no
	  ORDER BY employeeNumber) as emp_query
WHERE emp_query.departmentName = 'Sales';

--List all employees in the Sales and Development departments
--including their employee number, last name, first name, and department name.
SELECT *
FROM (SELECT e.emp_no as employeeNumber, e.last_name as lastName, e.first_name as firstName, d.dept_name as departmentName
	  FROM employees as e
	  LEFT JOIN dept_emp as x on e.emp_no = x.emp_no
	  LEFT JOIN "Departments" as d on x.dept_no = d.dept_no
	  ORDER BY employeeNumber) as emp_query
WHERE emp_query.departmentName = 'Sales' OR emp_query.departmentName = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

