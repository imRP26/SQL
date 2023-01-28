/*
 * https://leetcode.com/problems/game-play-analysis-i/
 */



/*
 * Approach 1 using group by and min from 
 * https://leetcode.com/problems/game-play-analysis-i/solutions/2763815/game-play-analysis-i/?orderBy=most_votes
 */
select player_id, min(event_date) as first_login from activity group by player_id;



/*
 * Approach using window functions from 
 * https://leetcode.com/problems/game-play-analysis-i/solutions/2763815/game-play-analysis-i/?orderBy=most_votes
 */
select x.player_id, x.even_date as first_login from 
(select a.player_id, a.event_date, rank() over (partition by a.player_id order by a.even_date) 
as rnk from Activity a) x where x.rnk = 1;



/*
 * Approach using window functions from 
 * https://leetcode.com/problems/game-play-analysis-i/solutions/2763815/game-play-analysis-i/?orderBy=most_votes
 */
select distinct player_id, first_value(event_date) over (partition by player_id order by event_date) 
as first_login from Activity;



/*
 * Approach using window functions from 
 * https://leetcode.com/problems/game-play-analysis-i/solutions/2763815/game-play-analysis-i/?orderBy=most_votes
 */
select distinct player_id, last_value(event_date) over 
(partition by player_id order by event_date desc range between unbounded preceding and unbounded following) 
as first_login from Activity;
