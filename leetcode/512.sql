/*
 * https://leetcode.com/problems/game-play-analysis-ii/
 */



/*
 * Approach 1 from 
 * https://leetcode.com/problems/game-play-analysis-ii/solutions/2763855/game-play-analysis-ii/
 */
select a1.player_id, a1.device_id from Activity a1 where (a1.player_id, a1.event_date) in 
(select a2.player_id, min(a2.event_date) from Activity a2 group by a2.player_id);



/*
 * Approach 2 from 
 * https://leetcode.com/problems/game-play-analysis-ii/solutions/2763855/game-play-analysis-ii/
 */
with min_data as 
(select a.player_id, min(a.event_date) as event_date from Activity a group by a.player_id) 
select a2.player_id, a2.device_id from Activity a2 
inner join min_data m on m.player_id = a2.player_id and m.event_date = a2.event_date;



/*
 * Approach 3 from 
 * https://leetcode.com/problems/game-play-analysis-ii/solutions/2763855/game-play-analysis-ii/
 */
with ranked_logins as 
(select a.player_id, a.device_id rank() over 
(partition by a.player_id order by a.event_date) as rnk from Activity a) 
select rl.player_id, rl.device_id from ranked_logins rl where rl.rank = 1;



/*
 * Approach 4 from 
 * https://leetcode.com/problems/game-play-analysis-ii/solutions/2763855/game-play-analysis-ii/
 */
select distinct a.player_id, first_value(a.device_id) over 
(partition by a.player_id order by a.event_date) as device_id from Activity a;



/*
 * Approach 5 from 
 * https://leetcode.com/problems/game-play-analysis-ii/solutions/2763855/game-play-analysis-ii/
 */
 select distinct a.plyer_id, last_value(a.device_id) over 
 (partition by a.player_id order by a.event_date desc range between unbounded preceding and 
 unbounded following) as device_id from Activity a;
