<!--#include file="manager_core.asp" -->
<p id=w10><a>File</a></p>
<div id="file">
<ul>	
<li>
<a id=a6>Filename
</a>
<a id=a2>filetype
</a>
<a id=a5>size
</a>
<a id=a3>uploadtime
</a>
<a id=a2>DEL
</a>
</li>
<?php
  
function getfiles($path){ 
foreach(scandir($path) as $afile)
{
if($afile=='.'||$afile=='..') continue; 

echo '<li><a id=a6>'.$afile.'</a></li><a id=a2>'.filetype("img/$afile").'</a><a id=a5>'.ceil(filesize("img/$afile")/1024).'kb</a><a id=a3>'.date("y-m-d",filectime("img/$afile")).'</a><a id=a2>DEL</a></li>';  
} 
}
getfiles(img);  

?>
</ul>
</div>
<div  id="upload">
<form name="file" method="post" enctype="multipart/form-data">
<p><input type="file" name="file" /></p>
<p><input type="submit" name="submit" value="上传" /></p>
</form>

<?php
  
if (@$_FILES['file']['error'] > 0)
  {
  echo '<p>Error: ' . $_FILES["file"]["error"] . '</p>';
  }
else
  {
  echo '<p>Upload:'.@$_FILES["file"]["name"] . '</p>';
  echo '<p>Type:'.@$_FILES["file"]["type"] . '</p>';
  echo '<p>Size:'.(@$_FILES["file"]["size"] / 1024).'Kb</p>';
  }
   if (file_exists("upload/" . @$_FILES["file"]["name"]))
      {
      echo '<p>'.@$_FILES["file"]["name"] . ' already exists</p>';
      }
    else
      {
	  $name = iconv('utf-8','gb2312',$_FILES["file"]["name"]); //防止上传乱码
      move_uploaded_file($_FILES["file"]["tmp_name"],"upload/" . $name);
      echo '<p>Stored in:upload/'. $_FILES["file"]["name"].'</p>';
      }
	  ?>
</div>
<!--#include file="manager_foot.asp" -->