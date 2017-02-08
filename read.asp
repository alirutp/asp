<!--#include file="head.asp" -->
<div id=content>
<!--#include file="banner.asp" -->
<%
id=Request("id")
tmp=ap_query("SELECT * FROM article where id="&id)
%>
<div id=view>
<div id=view-left>
<div id=box>
<div id=box-title>
<p><%=tmp(2,0)%></a></p>
</div>
<div id=box-user>
<p><%=tmp(1,0)&"写于"&tmp(4,0)%></p>
</div>
<div id=box-content>
<p><%=tmp(3,0)%></p>
<p>Tag:<?php
$sql="select * from tag where article_id like '%$id%'";
@$query=mysqli_query($conn,$sql); 
//echo var_dump($query).'mmm';
while(@$row=mysqli_fetch_array($query))
{
	if($stu)
	{
		$stu=$stu.','.$row[tag_name];
	}
	else
		$stu=$row[tag_name];
}
echo $stu;

?></p></div></div>
<div id=comment>
<?php include "comment.php";?>
</div>
</div>
<!--#include file="view_right.asp" -->
</div>
<!--#include file="foot.asp" -->
</div>
</body>
</html>