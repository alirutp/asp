<div class="head" >
<div id=top>
<div id=top-left>
<h1><a href="index.asp">
<%=ap_getsql("SELECT * FROM setting where keyname='site_name'","keyvalue")%>
</a></h1>
<h3>by alirutp</h3>
</div>
<div id=top-right>
<p>
<%
if Isempty(SESSION("user_id")) then
 response.write "<a href='login.asp' target='_blank'>Login|</a>"
 response.write "<a href='reg.asp' target='_blank'>Reg</a>"
else
    response.write "<a>Welcome!"&SESSION("username")&"</a>"
    response.write "<a href='manager.asp'>|Manager|</a>"
    response.write "<a href='login.asp?action=logout'>Logout</a>"

end if
%>
</p>
</div>
</div>
<div id=ban></div>
<div id=nav>
<ul id=bar>
<%
dim tmp
tmp=ap_query("SELECT sort_id,sort_name FROM sort order by sort_id")
For i=0 To ubound(tmp,2)  
response.write  "<li><a href='index.asp?sort_id="&tmp(0,i)&"'>"&tmp(1,i)&"</a></li>"
Next  
%>
</ul>
</div>
</div>
