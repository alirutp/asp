<!--#include file="manager_core.asp" -->
<p id=w10><a>Comment</a></p>
<ul id="article_ul">
<li>
<p>
<a id=a5>内容</a>
<a id=a5>评论人</a>
<a id=a5>所属文章</a>
<a id=a2>删除</a>
</p>
</li>
<%
tmp=ap_query("SELECT comment.comment_content,comment.id,users.username,article.title FROM comment,article,users where comment.article_id=article.id and comment.user_id=users.id")
For i=0 To ubound(tmp,2)  
response.write  "<li><p><a id=a5>"&tmp(0,i)&"</a><a id=a5>"&tmp(2,i)&"</a><a id=a5>"&tmp(3,i)&"</a><a id=a2 href='javascript:comm_del("&tmp(2,i)&")'>D</a></p></li>"
Next  
%>

</ul>
<!--#include file="manager_foot.asp" -->