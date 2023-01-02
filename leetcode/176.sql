/*
 * https://leetcode.com/problems/second-highest-salary/
 */



/*
 * Approach from 
 * https://leetcode.com/problems/second-highest-salary/solutions/127754/second-highest-salary/
 */
select (select distinct salary from Employee order by salary desc limit 1 offset 1) 
as SecondHighestSalary;



/*
 * Approach 1 from 
 * https://leetcode.com/problems/second-highest-salary/solutions/1168444/summary-five-ways-to-solve-the-top-n-nth-problems/
 */
select distinct max(salary) as SecondHighestSalary from Employee e1 where salary < 
(select max(salary) from Employee e2 where e2.salary > e1.salary);



/*
 * Approach 2 from 
 * https://leetcode.com/problems/second-highest-salary/solutions/1168444/summary-five-ways-to-solve-the-top-n-nth-problems/
 */
with cte as 
(select salary, dense_rank() over (order by salary desc) as desc_rank from Employee) 
select max(salary) as SecondHighestSalary from cte where desc_rank = 2;



/*
 * Approach 3 from 
 * https://leetcode.com/problems/second-highest-salary/solutions/1168444/summary-five-ways-to-solve-the-top-n-nth-problems/
 */
select ifnull((select distinct salary from Employee order by salary desc limit 1, 1), null) 
as SecondHighestSalary;
