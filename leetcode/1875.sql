/*
 * https://leetcode.com/problems/group-employees-of-the-same-salary/
 */



/*
 * Approach of DENSE_RANK() from -> 
 * https://leetcode.com/problems/group-employees-of-the-same-salary/solutions/1246182/mysql-dense-rank/
 */
select *, dense_rank() over (order by salary) team_id from Employees where salary not in 
(select salary from Employees group by salary having count(*) = 1) order by team_id, employee_id;



/*
 * Approach of ROW_NUMBER() from -> 
 * https://leetcode.com/problems/group-employees-of-the-same-salary/solutions/1239571/mysql-group-by-having-row-number/
 */
select e1.*, e2.team_id from Employees e1 join 
(select salary, row_number() over (order by salary asc) as team_id from Employees group by salary 
having count(employee_id) >= 2) e2 on e1.salary = e2.salary order by 4, 1; 
