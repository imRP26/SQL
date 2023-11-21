/*
 * https://leetcode.com/problems/movie-rating/
 */



/*
 * Okay sometimes I ain't that bad actually! 
 * But be careful about UNION vs UNION ALL...
 */ 
(select name as results from Users t1 join 
(select user_id, count(*) as num_movies_rated from MovieRating group by user_id) as t2 on 
t1.user_id = t2.user_id order by num_movies_rated desc, name limit 1)
union all 
(select title as results from Movies t3 join 
(select movie_id, avg(rating) as avg_rating from MovieRating where created_at >= '2020-02-01' and created_at <= '2020-02-29' group by movie_id) as t4 
on t3.movie_id = t4.movie_id order by avg_rating desc, title limit 1);



/*
 * Slight modification in the syntax!
 */
(select name as results from Users t1 join 
(select user_id, count(*) as num_movies_rated from MovieRating group by user_id) as t2 on 
t1.user_id = t2.user_id order by num_movies_rated desc, name limit 1)
union all 
(select title as results from Movies t3 join 
(select movie_id, avg(rating) as avg_rating from MovieRating where created_at like '2020-02%' 
group by movie_id) as t4 on t3.movie_id = t4.movie_id order by avg_rating desc, title limit 1);
