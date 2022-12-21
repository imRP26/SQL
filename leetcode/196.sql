/*
 * https://leetcode.com/problems/delete-duplicate-emails/
 */



-- Approach 1
delete p1 from Person p1, Person p2 where p1.email = p2.email and p1.id > p2.id;



-- Approach 2
delete from person where id not in 
(select * from 
(select min(id) from Person group by email) as p);
