<!--#include file="manager_core.asp" -->
<p id=w10><a>Tag</a></p>
<div id=articlee_ul>
<ul id="article_ul">
<%
tmp=ap_query("SELECT * FROM tag")
For i=0 To ubound(tmp,2)  
response.write "<a href=index.php?tag_id="&tmp(0,i)&">"&tmp(1,i)&"</a>(<a href=manager_tag.php?del="&tmp(0,i)&">删除</a>)"

Next  
%>

</ul>
</div>
<!--#include file="manager_foot.asp" -->