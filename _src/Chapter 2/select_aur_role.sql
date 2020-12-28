select null link
,      role label
,      count(id) value 
from   app_users
group by role
