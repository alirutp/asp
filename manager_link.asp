<!--#include file="manager_core.asp" -->
<p id=w10><a>Link</a></p>
<div id=sort_con>
<ul id="sort_ul">
<li id="sort_li">
<a id=a2>序号</a>
<a id=a4>名称</a>
<a id=a2>状态</a>
<a id=a2>描述</a>
<a id=a2>删除</a>
</li>
<%
tmp=ap_query("SELECT * FROM link order by link_id")
For i=0 To ubound(tmp,2)  
response.write  "<li id='sort_li'><a id=a2>"&tmp(0,i)&"</a><a id=a4 href="&tmp(0,i)&">"&tmp(1,i)&"</a><a id=a2>"&tmp(2,i)&"</a><a id=a2>"&tmp(3,i)&"</a><a  id=a2 href='javascript:link_del("&tmp(0,i)&")'>D</a></li>"
Next  
%>
</ul>
</div>
<div id="link_add">
<p><a href="javascript:link_add()">添加链接+</a></p>
</div>
<!--#include file="manager_foot.asp" -->
