/*
 * https://leetcode.com/problems/count-salary-categories/
 */



/*
 * Approach of CASE + UNION from LC Official Editorial!
 */
select 'Low Salary' as category, sum(case when income < 20000 then 1 else 0 end) as accounts_count 
from Accounts 
union 
select 'Average Salary' as category, sum(case when income >= 20000 and income <= 50000 then 1 else 0 end) 
as accounts_count from Accounts 
union 
select 'High Salary' as category, sum(case when income > 50000 then 1 else 0 end) as accounts_count 
from Accounts;



/*
 * Approach of CASE from -> 
 * https://leetcode.com/problems/count-salary-categories/solutions/1303611/mysql-case-vs-nuion-be-careful-with-0/
 */
with cte1 as 
(select account_id, 
    case
        when income < 20000 then 'Low Salary' 
        when income > 50000 then 'High Salary' 
        else 'Average Salary'
    end as category
from Accounts), 
cte2 as 
(select 'Low Salary' as category 
union 
select 'Average Salary' as category 
union 
select 'High Salary' as category)
select cte1.category, count(account_id) as accounts_count from cte1 join cte2 on 
cte1.category = cte2.category group by cte1.category;
