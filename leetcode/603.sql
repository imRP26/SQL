/*
 * https://leetcode.com/problems/consecutive-available-seats/
 */



/*
 * Approach from -> https://leetcode.com/problems/consecutive-available-seats/editorial/
 */
select distinct c1.seat_id from Cinema c1 join Cinema c2 on abs(c1.seat_id - c2.seat_id) = 1 and 
c1.free = true and c2.free = true order by c1.seat_id;



/*
 * Approach from -> https://leetcode.com/problems/consecutive-available-seats/editorial/comments/129652
 */
select distinct seat_id from Cinema where free = 1 and (seat_id - 1 in (select seat_id from Cinema 
where free = 1) or seat_id + 1 in (select seat_id from Cinema where free = 1)) order by seat_id;



/*
 * Approach from -> https://leetcode.com/problems/consecutive-available-seats/editorial/comments/191179
 */
select distinct c1.seat_id from Cinema c1 join Cinema c2 on c1.seat_id = c2.seat_id + 1 or 
c1.seat_id = c2.seat_id - 1 where c1.free = 1 and c2.free = 1 order by c1.seat_id;
