/*
 * https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
 */



/*
 * Concept of Self-Join from -> 
 * https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/solutions/1923203/simple-mysql-solution-using-self-join/
 */
select mgr.employee_id, mgr.name, count(emp.employee_id) as reports_count, round(avg(emp.age)) as 
average_age from employees emp join employees mgr on emp.reports_to = mgr.employee_id group by 
employee_id order by employee_id; 
 