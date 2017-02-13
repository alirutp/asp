<html>
<link type="text/css" href="css.css" rel="stylesheet" />
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<title>REG</title>
<body>
<?php
include "conn.php";
include "function.php";
?>
<div class=reg>
<div class=reg_title>
<p>用户注册</p>

<form name="put" method="post">
<div class=reg_form>
<label>
<span class=reg_text>Username:</span>
<span><input type="text" name="username"  /></span>
</label>
</div>
<div class=reg_form>
<label>
<span class=reg_text>Userpass:</span>
<span><input type="password" name="userpass"  /></span>
</label>
</div>
<div class=reg_form>
<label>
<span class=reg_text>Nick:</span>
<span><input type="text" name="nick"  /></span>
</label>
</div>

<div>

<input type="submit" value="Submit" />
</form>
</div>
</div>
<?php
#$sql1="select * from users limit 5"
#@$sq2="update users set username='$_POST[username]',userpass='$_POST[userpass]' where id=1";
@$userpass=md5($_POST[userpass].'ehruh^%&%*2314SUHFUAG');
$regtime=date('Y-m-d H:i:s',time());
$last_login_ip=$_SERVER["REMOTE_ADDR"];
@$sql="insert into users (id,username,userpass,nick,regtime,last_login_ip) values ('','$_POST[username]','$userpass','$_POST[nick]','$regtime','$last_login_ip')";
if (@$_POST[username])
{
if (@mysqli_query($conn,$sql))
echo "注册成功!";
else 
echo "注册失败";
}
?>
</body>
</html>