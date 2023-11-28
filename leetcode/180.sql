/*
 * https://leetcode.com/problems/consecutive-numbers/
 */



/*
 * Approach from -> 
 * https://leetcode.com/problems/consecutive-numbers/solutions/321205/runtime-299-ms-faster-than-94-39/
 */
select distinct num as ConsecutiveNums from Logs where 
(id + 1, num) in (select * from Logs) and (id + 2, num) in (select * from Logs);



/*
 * Approach of Window-Function from -> 
 * https://leetcode.com/problems/consecutive-numbers/solutions/321205/runtime-299-ms-faster-than-94-39/comments/1514645
 */
select distinct num as ConsecutiveNums from 
(select id, lag(num) over (order by id) as prev_num, num, lead(num) over (order by id) as next_num 
from Logs) as t where num = prev_num and num = next_num;
