select 	e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date,ti.to_date
from employees as e
join titles as ti
	on e.emp_no = ti.emp_no
where (e.birth_date between '1952-01-01' and '12-31-1955')
order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

--number of employees about to retire by title

select count (title), title
into retiring_titles
from unique_titles
group by title
order by (count (title)) desc;

--2nd Deliverable; Mentorship eligibility table  
select 	Distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date,	ti.title 
into mentorship_eligibilty
from employees as e
join dept_employee as de 
	on e.emp_no = de.emp_no
join titles as ti
	on e.emp_no = ti.emp_no
where (e.birth_date between '1965-01-01' and '12-31-1965')
	and (de.to_date = '9999-01-01')
order by e.emp_no;

