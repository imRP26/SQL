/*
 * https://leetcode.com/problems/game-play-analysis-iv/
 */



/*
 * Approach from -> 
 * https://leetcode.com/problems/game-play-analysis-iv/solutions/315626/very-simple-mysql-solution/comments/1919070
 */
select round(count(t2.player_id) / count(t1.player_id), 2) as fraction from 
(select player_id, min(event_date) as first_login from Activity group by player_id) t1 left join 
Activity t2 on t1.player_id = t2.player_id and datediff(t2.event_date, t1.first_login) = 1;
