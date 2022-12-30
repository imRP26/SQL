/*
 * https://leetcode.com/problems/fix-names-in-a-table/
 */



/*
 * Approach 1 from here 
 * https://leetcode.com/problems/fix-names-in-a-table/solutions/1963494/detailed-explanation-of-query-and-functions-that-are-required-to-solve-this/?orderBy=most_votes
 */
select user_id, concat(upper(substr(name, 1, 1)), lower(substr(name, 2))) as 
name from Users order by user_id;



/*
 * Approach 2 from here
 * https://leetcode.com/problems/fix-names-in-a-table/solutions/2238892/2-approaches-simple-with-comments/?orderBy=most_votes
 */
select user_id, concat(upper(left(name, 1)), lower(right(name, length(name) - 1))) 
as name from Users order by user_id;
