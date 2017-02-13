<!--#include file="manager_core.asp" -->
<p id=w10><a>Write</a></p>
<form name="write" method="post">
<div id=w1>
<p id=w10><input type="text" name="title" id=w12 value=请输入标题  onFocus="inputtextreplaceonfocus(this,'w12')"
onBlur="inputtextreplaceonBlur(this,'w12')"/></p>
<p id=w10><input type="text" name="author" id=w21 value=文章作者  onFocus="inputtextreplaceonfocus(this,'w21')"
onBlur="inputtextreplaceonBlur(this,'w21')"/></p>
</div>
<div id=w2>
<textarea type="text" name="content"><?php echo $content;?></textarea> 
<script type="text/javascript">CKEDITOR.replace('content')</script>
</div>
<div id=w1>
<p id=w11>
<input type="text" name="tagnote" id=w13 value=文章标签，逗号或空格分隔，过多的标签会影响系统运行效率  onFocus="inputtextreplaceonfocus(this,'w13')"
onBlur="inputtextreplaceonBlur(this,'w13')"/></p>

<p id=w11>
<select name="sort_id">
<option>选择文章分类..</option>
<?php
$query=mysqli_query($conn,"SELECT * FROM sort order by sort_id"); 
while($row=mysqli_fetch_array($query))
{ 
echo  "<option value=".@$row[sort_id].">".@$row[sort_name]."</option>";
}
?>
</select> 
<select name="status_id">
<option>选择发布类型..</option>
<option value="1">立即发布</option>
<option value="2">保存草稿</option>
</select>
<input type="text" name="date" id=w14 value="<?php echo date('Y-m-d H:i:s',time()); ?>"/>
</p>
</div>
<p>
<input type="submit" value="保存" name="post" id=w15 />
</p>
</form>

<?php
$user_id=$_SESSION['user_id'];
if($_POST['tagnote']=='文章标签，逗号或空格分隔，过多的标签会影响系统运行效率')
{
	$_POST['tagnote']=null;
}
$str=$_POST['tagnote'];
if (@$_POST[title])
{

		@$sql="insert into article (id,title,author,content,add_time,sort_id,user_id,status_id) values (null,'$_POST[title]','$_POST[author]','$_POST[content]','$_POST[date]',$_POST[sort_id],$user_id,$_POST[status_id])";
		mysqli_query($conn,$sql);
		$id=mysqli_insert_id($conn);
		echo '成功';
	while($str)
         { 
            if(strpos($str,','))
                 {
                    $stra=substr( $str ,0, strpos($str,','));//strpos($str,','))查找第一次出现的位置,substr截取数组
                    $str=substr( $str , strpos($str,',')+1 , strlen($str)-strpos($str,',')-1);
                 }
              else
                 {
	   	            $stra=$str;
		            $str='';
                 }
				 
				 @$sql="select * from tag where tag_name='$stra'";
				 //$article_id=mysql_insert_id();
				 $article_id=$id;
				 $query=mysqli_query($conn,$sql);
				 if(@$row=mysqli_fetch_array($query))
				 {
					$ttm=$row[article_id];
					$ttm=substr( $ttm , 1 , strpos($ttm,',',1)-1);
					if($article_id!=$ttm)
					 {
					$article_id=$row[article_id]."$article_id".',';
					$tag_id=$row[tag_id];
					$sql="update tag set article_id='$article_id' where tag_id=$tag_id";
			         mysqli_query($conn,$sql);
					 }
				 }
				  else
				  {  
			         $article_id=','.$article_id.',';
					 $sql="insert into tag (tag_id,tag_name,article_id)  values (null,'$stra','$article_id')";
			         mysqli_query($conn,$sql);
				  }
         }
	
}
<!--#include file="manager_foot.asp" -->