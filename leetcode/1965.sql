/*
 * https://leetcode.com/problems/employees-with-missing-information/
 */



/*
 * ORDER BY 1 ASC simply means sorting the view or table by 1st column of 
 * query's result in ascending order
 * https://leetcode.com/problems/employees-with-missing-information/solutions/1391540/union-where-not-in/
 */
select employee_id from Employees where employee_id not in 
(select employee_id from Salaries) 
union 
select employee_id from Salaries where employee_id not in 
(select employee_id from Employees) 
order by 1;



/*
 * https://leetcode.com/problems/employees-with-missing-information/solutions/2496406/two-methods-by-using-joins-and-union-full-outer-join-mysql/
 */
select e.employee_id from Employees e left join Salaries s on 
e.employee_id = s.employee_id where s.salary is null 
union 
select s.employee_id from Salaries s left join Employees e on 
s.employee_id = e.employee_id where e.name is null 
order by employee_id;
