/*
 * https://leetcode.com/problems/average-salary-departments-vs-company/
 */



/*
 * Approach using avg() and case... when... from LC Official Editorial!
 */
select department_salary.pay_month, department_id, 
case 
when department_avg > company_avg then 'higher' 
when department_avg < company_avg then 'lower' 
else 'same' 
end as comparison 
from 
(select department_id, avg(amount) as department_avg, 
date_format(pay_date, '%Y-%m') as pay_month from salary 
join employee on 
salary.employee_id = employee.employee_id group by 
department_id, pay_month) as department_salary 
join 
(select avg(amount) as company_avg, 
date_format(pay_date, '%Y-%m') as pay_month from salary 
group by date_format(pay_date, '%Y-%m')) as company_salary 
on department_salary.pay_month = company_salary.pay_month; 



/*
 * Approach of window function + JOIN from -> 
 * https://leetcode.com/problems/average-salary-departments-vs-company/solutions/1408291/why-distinct-6-lines-case-when-window-function-join/
 */
select distinct left(pay_date, 7) as pay_month, department_id, 
case 
when avg(amount) over (partition by department_id, month(pay_date)) < avg(amount) over 
(partition by month(pay_date)) then 'lower' 
when avg(amount) over (partition by department_id, month(pay_date)) > avg(amount) over 
(partition by month(pay_date)) then 'higher' 
else 'same' 
end as comparison 
from salary join employee using (employee_id);
