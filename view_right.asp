<div id=view-right>
<div id=view-right-box1>
<p><span>Archives</span></p>
<div id=tag_con>
<ul>
<%
tmp=ap_query("select format(add_time, 'yyyy-mm') as add_time1, count(*) as cnt from article where status_id=1 group by format(add_time, 'yyyy-mm')")
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
<?php 
$year = date ( 'Y' );   //获得年份, 例如： 2006  
$month = date ( 'n' );  //获得月份, 例如： 04  
$day = date ( 'j' );    //获得日期, 例如： 3  
$firstDay = date ( "w", mktime ( 0, 0, 0, $month, 1, $year ) )-1;  //获得1号是星期几 
$daysInMonth = date ( "t", mktime ( 0, 0, 0, $month, 1, $year ) );  
                                        //获得当月的总天数  
$tempDays = $firstDay + $daysInMonth;   //计算数组中的日历表格数  
$weeksInMonth = ceil ( $tempDays/7 );   //算出该月一共有几周（即表格的行数）  
//创建一个二维数组

for($j = 0; $j < $weeksInMonth; $j ++) {  
    for($i = 0; $i < 7; $i ++) {  
	 $counter ++;  
        $week [$j] [$i] = $counter;  
        //offset the days  
        $week [$j] [$i] -= $firstDay;  
        if (($week [$j] [$i] < 1) || ($week [$j] [$i] > $daysInMonth)) {  
            $week [$j] [$i] = "";  
        }  
    }  
}  
?> 
<ul>
<li>
<?php
 
echo '<a href="javascript:cal('.($month-1).','.$year.')"><<</a>'.date( 'M', mktime ( 0, 0, 0, $month, 1, $year ) ).'<a href="javascript:cal('.($month+1).','.$year.')">>></a><a href="javascript:cal('.$month.','.($year-1).')"><<</a>'.$year.'<a href="javascript:cal('.$month.','.($year+1).')">>></a>';

//echo date( 'M', mktime ( 0, 0, 0, $month-1, 1, $year ) ).date( 'Y', mktime ( 0, 0, 0, 0, 1, $year) );

?></li>
<li>
<span>Mon</span><span>Tue</span><span>Wed</span><span>Thu</span><span>Fri</span><span>Sat</span><span>Sun</span>
</li>
<?php 
foreach ( $week as $key => $val ) {  
    echo "<li>";  
    for($i = 0; $i < 7; $i ++) {  
	    @$add_time=date("Y-m-d",mktime(0,0,0,$month,$val [$i],$year));	
		$sql="select * from article where add_time like '%$add_time%' and status_id=1";
		$query=mysqli_query($conn,$sql);
		if (@mysqli_num_rows($query) < 1)
        {
            echo "<span>" . $val [$i] . "</span>"; 		
        }
        else
            echo '<span><a href="index.php?record='.$add_time.'">'. $val [$i] . '</a></span>'; 		

    }  
    echo "</li>";  
}  
?> 
</ul>
</div>
</div>

<?php
@$query=mysqli_query($conn,"SELECT * FROM users where id=$_SESSION[user_id]"); 
@$row=mysqli_fetch_array($query);
if(!empty($row))
{
echo   '<div id=view-right-box1>';
echo   '<p><span>About Me</span></p>';
echo   '<div id=tag_con>';
echo   '<a>Welcome!'.@$row[nick].',上次登录'.@$row[last_login_time].'</a>';	
echo   '</div>';
echo   '</div>';
} 

?>

<div id=view-right-box1>
<p><span>Tag</span></p>
<div id=tag_con>
<?php
@$query=mysqli_query($conn,"SELECT * FROM tag"); 
while(@$row=mysqli_fetch_array($query))
{    
   echo  '<a href=index.php?tag_id='.$row[tag_id].'>'.@$row[tag_name].'</a>,';
}
?>
</div>
</div>
<div id=view-right-box1>
<p><span>Sort</span></p>
<div id=tag_con>
<?php
@$query=mysqli_query($conn,"SELECT * FROM tag"); 
while(@$row=mysqli_fetch_array($query))
{    
   echo  '<a href=index.php?tag_id='.$row[tag_id].'>'.@$row[tag_name].'</a>,';
}
?>
</div>
</div>
<div id=view-right-box1>
<p><span>New Article</span></p>
<div id=tag_con>
<ul>
<?php
@$query=mysqli_query($conn,"SELECT * FROM article where status_id=1 order by id desc limit 5"); 
while(@$row=mysqli_fetch_array($query))
{    
   echo  '<li><a href=read.php?id='.$row[id].'>'.@$row[title].'</a></li>';
}
?>
</ul>
</div>
</div>
<div id=view-right-box1>
<p><span>Popular Article</span></p>
<div id=tag_con>
<ul>
<?php
@$query=mysqli_query($conn,"SELECT * FROM article where status_id=1 order by read_num desc limit 5"); 
while(@$row=mysqli_fetch_array($query))
{    
   echo  '<li><a href=read.php?id='.$row[id].'>'.@$row[title].'</a></li>';
}
?>
</ul>
</div>
</div>
<div id=view-right-box1>
<p><span>Random Article</span></p>
<div id=tag_con>
<ul>
<?php
@$query=mysqli_query($conn,"SELECT * FROM article where status_id=1 order by rand() limit 5"); 
while(@$row=mysqli_fetch_array($query))
{    
   echo  '<li><a href=read.php?id='.$row[id].'>'.@$row[title].'</a></li>';
}
?>
</ul>
</div>
</div>
</div>

