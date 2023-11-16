/*
 * https://leetcode.com/problems/rank-scores/
 */



/*
 * Approach of window function from LC Official Editorial!
 */
select s.score, dense_rank() over (order by s.score desc) as 'rank' from Scores s;



/*
 * Approach of correlated subquery with count(distnct...) from LC Official Editorial!
 */
select s1.score, (select count(distinct s2.score) from scores s2 where s2.score >= s1.score) as 'rank' 
from scores s1 order by s1.score desc;



/*
 * Approach of inner join with count(distinct...) from LC Official Editorial!
 */
select s.score, count(distinct t.score) as 'rank' from Scores s inner join Scores t on 
s.score <= t.score group by s.id, s.score order by s.score desc;
