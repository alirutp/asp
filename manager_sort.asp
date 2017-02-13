<!--#include file="manager_core.asp" -->
<p id=w10><a>Sort</a></p>
<div id=sort_con>
<ul id="sort_ul">
<li id="sort_li">
<a id=a1>序号</a>
<a id=a2>名称</a>
<a id=a1>查看</a>
<a id=a1>文章</a>
<a id=a1>EDIT</a>
<a id=a1>DEL</a>
</li>
<%
tmp=ap_query("SELECT * FROM sort order by sort_id")
For i=0 To ubound(tmp,2)  
response.write  "<li id='sort_li'><a id=a1>"&tmp(1,i)&"</a><a id=a2>"&tmp(2,i)&"</a><a id=a1  href='default.asp?sort_id='"&tmp(1,i)&">查看</a><a id=a1>"&ap_getsql("SELECT count(*) as cnt FROM article where sort_id="&tmp(1,i),"cnt")&"</a><a id=a1 href='manager_sort_edit.asp?id="&tmp(2,i)&"'>编辑</a><a  id=a1 href='javascript:sort_del("&tmp(2,i)&")'>删除</a></li>"
Next  
%>

</ul>
</div>
<div id=sort_add>
<p><a href="javascript:sort_add()">添加栏目+</a></p>
</div>
<!--#include file="manager_foot.asp" -->

