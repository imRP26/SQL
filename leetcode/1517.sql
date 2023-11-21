/*
 * https://leetcode.com/problems/find-users-with-valid-e-mails/
 */



/*
 * Approach from LC Official Editorial!
 */ 
select user_id, name, mail from Users where mail regexp '^[a-zA-Z][a-zA-Z0-9_.-]*\\@leetcode\\.com$';
