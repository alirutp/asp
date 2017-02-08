<html>
<?php include 'head.php';?>
<body>
<?php
$sort_id=$_GET["sort_id"];
?>
<?php include 'banner.php';?>
<div id=content>
<div id=view>
<div id=view-left>
<?php
$pagenum=ap_getsql('SELECT * FROM setting where keyname="pagenum"',$conn,'keyvalue');
$total=ap_getsql("select count(*) from article where sort_id='$sort_id'",$conn,'count(*)');  
@$totalpage = ceil($total/$pagenum);   
if(!isset($_GET["page"])||!intval($_GET["page"])||$_GET["page"]>$totalpage)//page可能的四种状态    
{    
    $page=1; 
}    
else    
{    
    $page=$_GET["page"];//如果不满足以上四种情况，则page的值为$_GET['page']    
}    
$startnum = ($page-1)*$pagenum;//开始条数   


$sql="SELECT * FROM article where sort_id='$sort_id' and status_id=1 order by id desc LIMIT $startnum,$pagenum";
@$query=mysqli_query($conn,$sql); 
if (@mysqli_num_rows($query) < 1)
{
	echo '<p>暂无内容</p>';
}
while(@$row=mysqli_fetch_array($query))
{ 
?>
<div id=box>
<div id=box-title>
<p><a href="read.php?id=<?php echo @$row[id];?>"  target=_blank><?php echo @$row[title];?></a></p>
</div>
<div id=box-content>
<p><?php echo mb_substr(@$row[content],0, 155, 'utf-8');?></p></div>
<div id=box-user>
<p><?php echo @$row[name];?></p>
</div>
</div>
<?php 
} 
?> 

<div id=view-left-foot> 
<?php 
$per = $page - 1;//上一页    
$next = $page + 1;//下一页    
echo "<p>";    
if($page != 1&&$row[content])    
{    
echo "<a href='".$_SERVER['PHP_SELF'].'?sort_id='.$sort_id."'>首页</a>";    
echo "<a href='".$_SERVER['PHP_SELF'].'?sort_id='.$sort_id.'&page='.$per."'> 上一页</a>";    
}    
if($page != $totalpage&&$row[content])    
{    
echo "<a href='".$_SERVER['PHP_SELF'].'?sort_id='.$sort_id.'&page='.$next."'> 下一页</a>";    
echo "<a href='".$_SERVER['PHP_SELF'].'?sort_id='.$sort_id.'&page='.$totalpage."'> 尾页</a></p>";    
}        
?> 
</div>
</div>
<?php include "view_right.php";?>
</div>
</div>
<?php include 'foot.php';?>
</body>
</html>