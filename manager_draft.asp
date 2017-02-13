<!--#include file="manager_core.asp" -->
<p id=w10><a>Draft</a></p>
<div id=articlee_ul>
<ul id="article_ul">
<li>
<a id=a5>标题</a>
<a id=a1>编辑</a>
<a id=a1>删除</a>
<a id=a2>作者</a>
<a id=a2>分类</a>
<a id=a4>时间</a>
<a id=a1>阅读</a>
</li>
<%
tmp=ap_query("SELECT article.id,article.title,article.author,sort.sort_name,article.add_time,article.read_num FROM article,sort where article.sort_id=sort.sort_id  and article.status_id=2 ORDER BY article.id")
For i=0 To ubound(tmp,2)  
response.write "<li><a id=a5 href='read.asp?id="&tmp(0,i)&"'>"&tmp(1,i)&"</a><a id=a1 href='manager_write_edit.php?id="&tmp(0,i)&"'>E</a><a id=a1 href='javascript:article_del("&tmp(0,i)&",1)'>D</a><a id=a2>"&tmp(2,i)&"</a><a id=a2>"&tmp(3,i)&"</a><a id=a4>"&tmp(4,i)&"</a><a id=a1>"&tmp(5,i)&"</a></li>"
Next  
%>
</ul>
</div>
<!--#include file="manager_foot.asp" -->