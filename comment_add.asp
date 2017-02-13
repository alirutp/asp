<!--#include file="conn.asp" -->
<!--#include file="Function.asp" -->
<%
dim comment_content
comment_content=Request.QueryString("q")
id=Request.QueryString("id")
user_id=SESSION("user_id")
nick=SESSION("nick")
comment_date=now()
sql_comment="insert into comment (id,user_id,article_id,comment_content,comment_date) values ('',"&user_id&","&id&",'"&comment_content&"','"&comment_date&"')"
if not Isempty(comment_content) then
      if not Isempty(user_id) then
	  ap_exec(sql)
	  end if
	end if
%>  

<%
dim total
total=ap_getsql("SELECT count(*) as cnt FROM comment WHERE article_id="&id,"cnt")
if total>0 then
response.write "<p>共有<span id='comment_total'>"&total&"</span>条评论</p>"

%>
<div id=comment_view>

<%
tmp=ap_query("SELECT * FROM comment,users where comment.article_id="&id&" and comment.user_id=users.id ORDER BY comment.id")
For i=0 To ubound(tmp,2)  
%>
<div id=comment_inside>
<div id=comment_title >
<p><%=tmp(9,i)%></p>
<p>于<%=tmp(4,i)%>评论：</p>
</div>
<div id=comment_content>
<p><%=tmp(3,i)%></p>
</div>
</br>
</div><%Next%></div>
<%
else
	response.write "<p>暂无评论</p>"
	end if
	%>
<div id=add_comment >
<form name="put">
<p>新的评论</p>
<textarea type="text" name="comment_content" value=""></textarea> 
<INPUT TYPE="button" id=CommentSubmit value="提交" onclick="comment_add(put.comment_content.value,<%=id%>)">
</form>
</div>
