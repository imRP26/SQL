/*
 * https://leetcode.com/problems/duplicate-emails/
 */



/*
 * Approach 1 from https://leetcode.com/problems/duplicate-emails/editorial/
 */
select email from (select email, count(email) as num from Person group by email) 
as duplicates where num > 1;



/*
 * Approach 2 from https://leetcode.com/problems/duplicate-emails/editorial/
 */
select email from Person group by email having count(email) > 1;



/*
 * Little bit of an inefficient solution :-
 * https://leetcode.com/problems/duplicate-emails/editorial/comments/130237
 */
select distinct p1.email from Person p1, Person p2 where p1.email = p2.email and p1.id != p2.id;
