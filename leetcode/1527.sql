/*
 * https://leetcode.com/problems/patients-with-a-condition/
 */



/*
 * https://leetcode.com/problems/patients-with-a-condition/solutions/756596/simple-mysql-solution-faster-than-100/?envType=study-plan&id=sql-i&orderBy=most_votes
 */
select * from Patients where conditions like '% DIAB1%' or conditions like 'DIAB1%';
