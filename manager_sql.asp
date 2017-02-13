<!--#include file="manager_core.asp" -->
<div id=content_manager_left>
<form name="sql" method="post">
SQL: 
<input type="text" name="sql" />
<input type="reset"  value="重写" />
<input type="submit" value="提交" name="post"/>
</form>
</div>
@$sql=$_POST['sql'];
if (empty($_POST['sql'])==0)	
{
if (mysql_query($sql,$conn))
{
	echo 'success!';
}
else
	echo 'fail';
}
unset($_SESSION['sql']);
<!--#include file="manager_foot.asp" -->