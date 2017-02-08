<div id=view>
<div id=view-left>

<%
tmp=ap_query("SELECT * FROM article where status_id=1 order by id desc")
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
</div>
</div>
<!--#include file="view_right.asp" -->
</div>