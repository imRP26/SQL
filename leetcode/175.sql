/*
 * https://leetcode.com/problems/combine-two-tables/
 */



/*
 * Easy-Peasy Left Join
 */ 
select firstName, lastName, city, state from Person p left join Address a on 
p.personId = a.personId;



/*
 * Left Join + Using
 */
select firstName, lastName, city, state from Person left join Address using (personId);



/*
 * Natural Left Join
 */
select firstName, lastName, city, state from Person natural left join Address;
