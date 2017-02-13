<!--#include file="conn.asp" -->
<!--#include file="Function.asp" -->
<!--#include file="md5.asp" -->
<html>
<link type="text/css" href="css.css" rel="stylesheet" />
<meta http-equiv=Content-Type content="text/html;charset=gb-2312">
<title>Sign in - Admin Accounts</title>
<body>
<div id=login>
<div id=login-box>
<%
if Request.QueryString("action")="logout" then
session("username")=null
session("user_id")=null
response.redirect("index.asp")
end if
%>
<form name="put" method="post">
Username: 
<input type="text" name="username" />
<br />
Userpass: 
<input type="password" name="userpass" />
<br />
<input type="submit" value="Submit" />
</form>

<%
dim username,user_id,userpass,login_times,last_login_ip
username=Request.Form("username")
userpass=md5(Request.Form("userpass")&"ehruh^%&%*2314SUHFUAG")
if IsNull(username) then
response.end
else
tmp=ap_query("select * from users where username='"&username&"' and userpass='"&userpass&"'")

if IsNull(tmp) then
response.write "失败"
response.end
else
SESSION("user_id")=tmp(0,0)
SESSION("username")=username
SESSION("user_nick")=tmp(4,0)
login_times=tmp(10,0)
	login_times=login_times+1
    last_login_ip=Request.ServerVariables("REMOTE_ADDR")
    last_login_time=now()
	response.redirect("manager.asp")
   end if
    end if

%>



</div>
</div>
</body>
</html>