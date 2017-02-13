<div id=view-right>
<div id=view-right-box1>
<p><span>Archives</span></p>
<div id=tag_con>
<ul>
<%
tmp=ap_query("select format(add_time, 'yyyy/m') as add_time1, count(*) as cnt from article where status_id=1 group by format(add_time, 'yyyy/m')")
For i=0 To ubound(tmp,2)  
response.write  "<li><a href='index.asp?record="&tmp(0,i)&"'>"&tmp(0,i)&"("&tmp(1,i)&")</a></li>"
Next  
%>
</ul>
</div>
</div>
<div id=view-right-box1>
<p><span>Comment</span></p>
<div id=tag_con>
<ul>
<%
tmp=ap_query("SELECT top 5 * from (SELECT comment.comment_content,comment.id,users.username,users.nick,article.title,article.id FROM comment,article,users where comment.article_id=article.id and comment.user_id=users.id order by comment.id desc)")
For i=0 To ubound(tmp,2)  
response.write  "<li><span>"&tmp(3,i)&"的评论：<span><a href='read.asp?id="&tmp(5,i)&"'>"&tmp(0,i)&"</a></li>"
Next  
%>
</ul>
</div>
</div>
<div id=view-right-box1>
<p><span>Link</span></p>
<div id=tag_con>
<ul>
<%
tmp=ap_query("SELECT * FROM link where status=1 order by link_id")
For i=0 To ubound(tmp,2)  
response.write  "<li><a href='"&tmp(1,i)&"'>"&tmp(3,i)&"</a></li>"
Next  
%>
</ul>
</div>
</div>
<div id=view-right-box1>
<p><span>Search</span></p>
<div id=search_con>
<form name="searchform" method="get" action="index.asp">
<input type="text" name="keyword" id=w25 value=请输入关键词  onFocus="inputtextreplaceonfocus(this,'w25')"
onBlur="inputtextreplaceonBlur(this,'w25')"/>
</form>
</div>
</div>
<div id=view-right-box1>
<p><span>Calender</span></p>
<div id="cal">
<%
dim y,m,d,firstDay,daysInMonth,tempDays,weeksInMonth,i,j,counter
y = Year(now())
m = month(now())
d = day(now())
firstDay = Weekday(DateSerial(y,m,1),3)
daysInMonth = DateDiff("d",DateSerial(y,m,1),DateSerial(y,m+1,1))
tempDays = firstDay + daysInMonth
weeksInMonth = abs ( int ( -tempDays / 7 ) )

dim week(5,7) 
counter=0

for j = 1 to weeksInMonth
    for i = 1 to 7
	 counter=counter+1
        week(j,i) = counter
        week(j,i) = week(j,i) -firstDay 
        if week(j,i)<1 or week(j,i)>daysInMonth then
            week(j,i) = ""
        end if
	Next
Next
%>
<ul>
<li>


<%="<a href='javascript:cal()'></a>"&m&"<a href='javascript:cal()'></a><a href='javascript:cal()'></a>??<a href='javascript:cal()'></a>"%>
</li>
<li>
<span>Mon</span><span>Tue</span><span>Wed</span><span>Thu</span><span>Fri</span><span>Sat</span><span>Sun</span>
</li>
<%
for j = 1 to weeksInMonth
    response.write "<li>"
    for i = 1 to 7
	response.write "<span>"&week(j,i)&"</span>"
	Next
    response.write "</li>"
Next
%>
</ul>
</div>
</div>
<%
if not Isempty(SESSION("user_id")) then
response.write "<div id=view-right-box1><p><span>About Me</span></p><div id=tag_con>"
response.write "<a>Welcome!"&SESSION("user_nick")&",上次登录"&SESSION("user_nick")&"</a>"
response.write "</div></div>" 
end if
%>
<div id=view-right-box1>
<p><span>Tag</span></p>
<div id=tag_con>
<%
tmp=ap_query("SELECT * FROM tag")
For i=0 To ubound(tmp,2)  
response.write  "<a href=index.php?tag_id="&tmp(0,i)&">"&tmp(1,i)&"</a>,"
Next  
%>

</div>
</div>
<div id=view-right-box1>
<p><span>Sort</span></p>
<div id=tag_con>
<%
tmp=ap_query("SELECT * FROM Sort")
For i=0 To ubound(tmp,2)  
response.write  "<li><a href=index.php?sort_id="&tmp(1,i)&">"&tmp(2,i)&"</a></li>"
Next  
%>
</div>
</div>
<div id=view-right-box1>
<p><span>New Article</span></p>
<div id=tag_con>
<ul>
<%
tmp=ap_query("SELECT top 5 * from (SELECT * FROM article where status_id=1 order by id desc)")
For i=0 To ubound(tmp,2)  
response.write  "<li><a href=read.asp?id="&tmp(0,i)&">"&tmp(2,i)&"</a></li>"
Next  
%>
</ul>
</div>
</div>
<div id=view-right-box1>
<p><span>Popular Article</span></p>
<div id=tag_con>
<ul>
<%
tmp=ap_query("SELECT top 5 * from (SELECT * FROM article where status_id=1 order by read_num desc)")
For i=0 To ubound(tmp,2)  
response.write  "<li><a href=read.asp?id="&tmp(0,i)&">"&tmp(2,i)&"</a></li>"
Next  
%>
</ul>
</div>
</div>
<div id=view-right-box1>
<p><span>Random Article</span></p>
<div id=tag_con>
<ul>
<%
tmp=ap_query("SELECT top 5 * from (select * from article order by rnd(id))")
For i=0 To ubound(tmp,2)  
response.write  "<li><a href=read.asp?id="&tmp(0,i)&">"&tmp(2,i)&"</a></li>"
Next  
%>
</ul>
</div>
</div>
</div>

