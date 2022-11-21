
SELECT 
  e.emp_no
, e.first_name
, e.last_name
, t.title
, t.from_date
, t.to_date
INTO retirement
FROM employees as e
	 LEFT JOIN titles as t
	 ON t.emp_no = e.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

SELECT * FROM retirement;

SELECT DISTINCT ON (emp_no)
  emp_no
, first_name
, last_name
, title
INTO recent_title
FROM retirement
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM recent_title;


SELECT COUNT(emp_no) AS "count"
, title
INTO retiring_titles
from recent_title
GROUP BY title
ORDER BY "count" DESC

SELECT * FROM retiring_titles

SELECT DISTINCT ON (emp_no)
 e.emp_no
,e.first_name
,e.last_name
,e.birth_date
,d.from_date
,d.to_date
,t.title
INTO mentorship_eligibilty
FROM employees as e
LEFT JOIN dept_employees as d
ON e.emp_no = d.emp_no
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE T.to_date = '9999-01-01'
AND 
e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;

SELECT COUNT(emp_no) AS "count"
, title
INTO mentorship_eligibilty_tb
from mentorship_eligibilty
GROUP BY title
ORDER BY "count" DESC