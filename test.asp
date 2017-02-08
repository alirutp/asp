

<%=FormatdateTime('dd',now)%>

select format(add_time, 'yyyy-mm') as add_time1, count(*) as cnt from article where status_id=1 group by format(add_time, 'yyyy-mm')

select format(add_time, 'yyyy-mm') as add_time1, count(*) as cnt from article where status_id=1

