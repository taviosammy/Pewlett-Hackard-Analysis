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