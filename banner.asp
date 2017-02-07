<div class="head" >
<div id=top>
<div id=top-left>
<h1><a href="index.php">
<%=ap_getsql("SELECT * FROM setting where keyname='site_name'","keyvalue")%>
</a></h1>
<h3>by alirutp</h3>
</div>
<div id=top-right>
<p>
<?php
if(!isset($_SESSION['username']))
{   
    echo  '<a href="login.php" target="_blank">Login|</a>';
    echo  '<a href="reg.php" target=_blank">Reg</a>';
}
else
{       
    echo  '<a>Welcome!'.$_SESSION['username'].'</a>';
    echo  '<a href="manager.php">|Manager|</a>';
    echo  '<a href="login.php?action=logout">Logout</a>';
}
?>
</p>
</div>
</div>
<div id=ban></div>
<div id=nav>
<ul id=bar>
<?php
@$query_type=mysqli_query($conn,"SELECT * FROM sort order by sort_id"); 
while(@$row=mysqli_fetch_array($query_type))
{ 
echo  '<li><a href="sort.php?sort_id='.@$row[sort_id].'">'.@$row[sort_name].'</a></li>';
}
?>
</ul>
</div>
</div>