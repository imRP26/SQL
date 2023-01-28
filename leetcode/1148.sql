/*
 * https://leetcode.com/problems/article-views-i/
 */



/*
 * My simple, naive solution! 
 */
select distinct author_id as id from Views where author_id = viewer_id order by id;



/*
 * Approach 1 from 
 * https://leetcode.com/problems/article-views-i/solutions/688022/two-mysql-solutions-with-and-without-distinct/?orderBy=most_votes
 */
select author_id as id from Views group by author_id 
having sum(case when author_id = viewer_id then 1 else 0 end) > 0 order by id;
