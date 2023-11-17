/*
 * https://leetcode.com/problems/find-interview-candidates/
 */



/*
 * Approach of LAG() from -> 
 * https://leetcode.com/problems/find-interview-candidates/solutions/1144024/mysql-short-sweet-using-lag-function/
 */
with cte as 
(select user_id, name, mail, contest_id, user_id = gold_medal as gold, user_id = silver_medal as silver, 
user_id = bronze_medal as bronze, 
lag(contest_id, 2) over (partition by user_id order by contest_id) as prev_to_prev_contest_id 
from Users left join Contests on user_id = gold_medal or user_id = silver_medal or user_id = bronze_medal) 
select name, mail from cte group by user_id having 
sum(gold) >= 3 or sum(contest_id - prev_to_prev = 2) >= 1;
