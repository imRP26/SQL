/*
 * https://leetcode.com/problems/exchange-seats/
 */



/*
 * Approach of 'Case When' from -> 
 * https://leetcode.com/problems/exchange-seats/solutions/104698/4-line-solution-using-if-statement/comments/107415
 */ 
select 
    case 
        when seat.id % 2 != 0 and seat.id = (select count(*) from Seat) then seat.id 
        when seat.id % 2 = 0 then seat.id - 1 
        else seat.id + 1
    end 
as id, student from Seat order by id;
