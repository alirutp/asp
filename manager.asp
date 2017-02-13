<!--#include file="manager_core.asp" -->
<p>根目录：<%=server.mappath("/")%></p>
<p>服务器签名：<%=Request.ServerVariables("SERVER_SOFTWARE")%></p>
<p>服务器：<%=Request.ServerVariables("SERVER_NAME")%></p>
<p>共有<%=ap_getsql("SELECT count(*) as cnt FROM article","cnt")%>篇文章</p>
<p>共有<%=ap_getsql("SELECT count(*) as cnt FROM comment INNER join article on comment.article_id=article.id","cnt")%>条评论</p>
<!--#include file="manager_foot.asp" -->




