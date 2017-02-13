<!--#include file="head.asp" -->
<div id=content>
<!--#include file="banner.asp" -->
<%
id=Request("id")
tmp=ap_query("SELECT * FROM article where id="&id)
%>
<div id=view>
<div id=view-left>
<div id=box>
<div id=box-title>
<p><%=tmp(2,0)%></a></p>
</div>
<div id=box-user>
<p><%=tmp(1,0)&"写于"&tmp(4,0)%></p>
</div>
<div id=box-content>
<p><%=tmp(3,0)%></p>
<p>Tag:
<%
dim stu
tmp=ap_query("select * from tag where article_id like '%%"&id&"%%'")
For i=0 To ubound(tmp,2)  
stu=tmp(1,i)&","&stu
next
response.write stu
%>
</p></div></div>
<div id=comment>
<!--#include file="comment.asp" -->
</div>
</div>
<!--#include file="view_right.asp" -->
</div>
<!--#include file="foot.asp" -->
</div>
</body>
</html>