<!--#include file="manager_core.asp" -->
<p id=w10><a>Accounts</a></p>
<div id="accounts_info">
<ul id="article_ul">
<li>
<a id=a1>ID</a>
<a id=a2>用户名</a>
<a id=a2>昵称</a>
<a id=a1>级别</a>
<a id=a4>注册时间</a>
<a id=a4>最后登录时间</a>
<a id=a3>最后登录IP</a>
<a id=a1>Times</a>
<a id=a1>DEL</a>
</li>
<%
tmp=ap_query("SELECT * FROM users order by id")
For i=0 To ubound(tmp,2)  
response.write  "<li><a id=a1>"&tmp(0,i)&"</a><a id=a2>"&tmp(1,i)&"</a><a id=a2>"&tmp(4,i)&"</a><a id=a1>"&tmp(6,i)&"</a><a id=a4>"&tmp(7,i)&"</a><a id=a4>"&tmp(9,i)&"</a><a id=a3>"&tmp(8,i)&"</a><a id=a1>"&tmp(10,i)&"</a><a id=a1>DEL</a></li>"
Next  
%>
</ul>
</div>
<!--#include file="manager_foot.asp" -->