-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp,
rt.first_name,
rt.last_name,
rt.title

INTO uni_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;


-- Employee count by department number
SELECT COUNT(ut.title), ut.title
INTO title_count
FROM uni_titles AS ut
Group BY ut.title
ORDER BY COUNT(ut.title) DESC


--Mentorship Program eligibility
SELECT DISTINCT ON(e.emp_no) e.emp_no,
        e.first_name,
        e.last_name,
        e.birth_date,
        de.from_date,
		de.to_date,
        ti.title
INTO mentor_eligibility
FROM employees AS e
LEFT JOIN  dept_emp AS de
    ON e.emp_no = de.emp_no
LEFT JOIN titles AS ti
    ON e.emp_no = ti.emp_no
WHERE (de.to_date = '9999-01-01') AND 
(e.birth_date BETWEEN '1965-01-01' AND '1965-01-31')
ORDER BY e.emp_no
