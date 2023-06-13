/*
 * https://leetcode.com/problems/reformat-department-table/
 */



/*
 * Approach 1 from -> https://leetcode.com/problems/reformat-department-table/editorial/
 */
select id, 
    sum(if(month = 'Jan', revenue, null)) as Jan_Revenue, 
    sum(if(month = 'Feb', revenue, null)) as Feb_Revenue, 
    sum(if(month = 'Mar', revenue, null)) as Mar_Revenue, 
    sum(if(month = 'Apr', revenue, null)) as Apr_Revenue, 
    sum(if(month = 'May', revenue, null)) as May_Revenue, 
    sum(if(month = 'Jun', revenue, null)) as Jun_Revenue, 
    sum(if(month = 'Jul', revenue, null)) as Jul_Revenue, 
    sum(if(month = 'Aug', revenue, null)) as Aug_Revenue, 
    sum(if(month = 'Sep', revenue, null)) as Sep_Revenue, 
    sum(if(month = 'Oct', revenue, null)) as Oct_Revenue, 
    sum(if(month = 'Nov', revenue, null)) as Nov_Revenue, 
    sum(if(month = 'Dec', revenue, null)) as Dec_Revenue 
from Department group by id;



/*
 * Approach 2 from  -> https://leetcode.com/problems/reformat-department-table/editorial/
 */
select ids.id, January.revenue as Jan_Revenue, February.revenue as Feb_Revenue, 
March.revenue as Mar_Revenue, April.revenue as Apr_Revenue, May.revenue as May_Revenue, 
June.revenue as Jun_Revenue, July.revenue as Jul_Revenue, August.revenue as Aug_Revenue, 
September.revenue as Sep_Revenue, October.revenue as Oct_Revenue, November.revenue as Nov_Revenue, 
December.revenue as Dec_Revenue from 
(select distinct id from department) as ids 
left join department as January on 
(ids.id = January.id and January.month = 'Jan') 
left join department as February on 
(ids.id = February.id and February.month = 'Feb') 
left join department as March on 
(ids.id = March.id and March.month = 'Mar') 
left join department as April on 
(ids.id = April.id and April.month = 'Apr') 
left join department as May on 
(ids.id = May.id and May.month = 'May') 
left join department as June on 
(ids.id = June.id and June.month = 'Jun') 
left join department as July on 
(ids.id = July.id and July.month = 'Jul') 
left join department as August on 
(ids.id = August.id and August.month = 'Aug') 
left join department as September on 
(ids.id = September.id and September.month = 'Sep') 
left join department as October on 
(ids.id = October.id and October.month = 'Oct') 
left join department as November on 
(ids.id = November.id and November.month = 'Nov') 
left join department as December on 
(ids.id = December.id and December.month = 'Dec');
