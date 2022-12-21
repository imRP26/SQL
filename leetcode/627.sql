/*
 * https://leetcode.com/problems/swap-salary/
 */



-- Approach 1
update Salary set sex = case sex when 'm' then 'f' else 'm' end;



/*
 * Approach 2
 * REPLACE(string, old_string, new_string)
 * string = 'fm'
 * row-1 = 'f'. So, sex = 'f'. We'll now find 'f' in 'fm' and will replace it with ''. 
 * So, the result is 'm'.
 * row-2 = 'm'. So, sex = 'm'. We'll now find 'm' in 'fm' and will replace it with ''. 
 * So, the result is 'f'.
 */
update Salary set sex = replace('fm', sex, '');



-- Approach 3
update Salary set sex = char(ascii('f') ^ ascii('m') ^ ascii(sex));



-- Approach 4
update Salary set sex = char(ascii('f') + ascii('m') - ascii(sex));



/*
 * Approach 5
 * if (condition, value_if_true, value_if_false)
 */
update Salary set sex = if(sex = 'm', 'f', 'm');
