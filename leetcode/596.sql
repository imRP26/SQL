/*
 * https://leetcode.com/problems/classes-more-than-5-students/
 */



/*
 * My naive yet efficient Query
 */
select class from Courses group by class having count(*) >= 5;
