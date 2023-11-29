/*
 * https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/
 */



/*
 * Easy question, easy solution!
 */
select teacher_id, count(distinct subject_id) as cnt from Teacher group by teacher_id;
