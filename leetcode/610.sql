/*
 * https://leetcode.com/problems/triangle-judgement/
 */



/*
 * Approach of 'case...when...' from LC Official Editorial!
 */
select x, y, z, 
    case when x + y > z and y + z > x and z + x > y then 'Yes' 
    else 'No'
    end as triangle from Triangle;



/*
 * Approach of if() from -> 
 * https://leetcode.com/problems/triangle-judgement/solutions/104163/simple-answer-using-if-function/
 */
select *, if(x + y > z and y + z > x and z + x > y, "Yes", "No") as triangle from Triangle;
 