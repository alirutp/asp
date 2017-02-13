<div id=view>
<div id=view-left>
<%
dim totalpage
page=ap_getsql("select count(*) as cnt from article where status_id=1","cnt")
totalpage=abs ( int ( -page / 5 ) ) 
if isEmpty(Request.QueryString("page")) or Request.QueryString("page")=1 then
page=1
sql="SELECT TOP 5 * FROM article where status_id=1 order by id desc"
else
page=Request.QueryString("page")
sql="SELECT * FROM (SELECT TOP "&(page-1)*5&" * FROM (SELECT top "&page*5&" * FROM article where status_id=1 order by id desc)  ORDER BY id asc) ORDER by id desc"
end if


 

if not isEmpty(Request.QueryString("sort_id")) then
sql="SELECT * FROM article where status_id=1 and sort_id="&Request.QueryString("sort_id")&" order by id desc"
end if

if not isEmpty(Request.QueryString("record")) then
sql="SELECT * FROM article where status_id=1 and add_time like '%%"&Request.QueryString("record")&"%%' order by id desc"
end if

if not isEmpty(Request.QueryString("keyword")) then
sql="SELECT * FROM article where status_id=1 and title like '%%"&Request.QueryString("keyword")&"%%' order by id desc"
end if
%>
<%
tmp=ap_query(sql)
For i=0 To ubound(tmp,2)
%>
<div id=box>
<div id=box-title>
<p><a href="read.asp?id=<%=tmp(0,i)%>"  target=_blank><%=tmp(2,i)%></a></p>
</div>
<div id=box-user>
<p><%=tmp(1,i)&"写于"&tmp(4,i)%></p>
</div>
<div id=box-content>
<p><%=left(tmp(3,i),300)%></p></div>
</div>
<%
Next 
%>
<div id=view-left-foot> 
<p>
<%
perpage = page - 1
nextpage = page + 1 
if perpage<1 then 
response.write "<a href='"&Request.ServerVariables("SCRIPT_NAME")&"?page="&nextpage&"'>下一页</a>"    
elseif nextpage>totalpage then
response.write "<a href='"&Request.ServerVariables("SCRIPT_NAME")&"?page="&perpage&"'> 上一页</a>"  
else
response.write "<a href='"&Request.ServerVariables("SCRIPT_NAME")&"?page="&nextpage&"'>下一页</a>" 
response.write "<a href='"&Request.ServerVariables("SCRIPT_NAME")&"?page="&perpage&"'> 上一页</a>"   
end if       
%>
</div>
</div>
<!--#include file="view_right.asp" -->
</div>