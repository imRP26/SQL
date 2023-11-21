/*
 * https://leetcode.com/problems/restaurant-growth/
 */



/*
 * Approach from -> 
 * https://leetcode.com/problems/restaurant-growth/solutions/3931306/most-voted-solution-doesn-t-work-for-new-testcases-reason-updated-query/
 */
select t1.visited_on as visited_on, sum(t2.day_sum) as amount, round(sum(t2.day_sum) / 7, 2) as 
average_amount from 
(select visited_on, sum(amount) as day_sum from Customer group by visited_on) as t1, 
(select visited_on, sum(amount) as day_sum from Customer group by visited_on) as t2 
where datediff(t1.visited_on, t2.visited_on) between 0 and 6 group by t1.visited_on having 
t1.visited_on >= 6 + (select min(visited_on) from Customer) order by t1.visited_on; 
