/*
 * https://leetcode.com/problems/department-top-three-salaries/
 */



/*
 * Approach of DENSE_RANK
 */
select department, employee, salary from 
(select d.name as department, e.name as employee, salary, dense_rank() over 
(partition by e.departmentId order by salary desc) as dns_rnk from Employee e join Department d 
on e.departmentId = d.id) t where dns_rnk <= 3; 



/*
 * Same as above, but by using the With construct - from LC Official Editorial!
 */
with employee_department as 
(select d.id, d.name as Department, salary as Salary, e.name as Employee, dense_rank() over 
(partition by d.id order by salary desc) from Department d join Employee e on d.id = e.departmentId) 
select Department, Employee, Salary from employee_department where rnk <= 3;



/*
 * Approach of correlated subquery from LC Official Editorial!
 */
select d.name as Department, e1.name as Employee, e1.salary as Salary from Employee e1 join 
Department d on e1.departmentId = d.id where (select count(distinct e2.salary) from Employee e2 
where e2.salary > e1.salary and e1.departmentId = e2.departmentId) < 3;
