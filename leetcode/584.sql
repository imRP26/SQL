/*
 * https://leetcode.com/problems/find-customer-referee/
 */



-- Approach 1
select name from Customer where referee_id != 2 or referee_id is null;



/*
 * MySQL uses three-valued logic -- TRUE, FALSE and UNKNOWN. 
 * Anything compared to NULL evaluates to the third value: UNKNOWN. 
 * That “anything” includes NULL itself! That’s why MySQL provides the IS NULL 
 * and IS NOT NULL operators to specifically check for NULL.
 */
