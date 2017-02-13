function test11()
{   
    alert('fuckme');
}

function comment_add(comment_content,article_id)
{
xmlHttp=new XMLHttpRequest();
var url="comment_add.asp";
url=url+"?q="+comment_content+"&id="+article_id;
//url=url+"&sid="+Math.random()
xmlHttp.onreadystatechange=callback_comment_add;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
} 

function callback_comment_add() 
{ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
    var tmp=document.getElementById("comment");
		tmp.innerHTML=xmlHttp.responseText;	 
 } 
}

function callback_comment_add_bak() 
{ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 

 var tmp1 = document.createElement("div");  
 var tmp2=document.getElementById("comment_total");	
     //tmp2.innerHTML=parseInt(tmp2.innerHTML)+1;
	 comment_view.appendChild(tmp1); 
	 tmp1.id = "comment_inside";  
     tmp1.innerHTML=xmlHttp.responseText ;
	 put.comment_content.value="";
	 if(xmlHttp.responseText)
	 {
		 tmp2.innerHTML=parseInt(tmp2.innerHTML)+1;
	 }
		 
 } 
}

function logout_view_right()
{   

	xmlHttp=new XMLHttpRequest();
    var url="login.php?action=logout";
    xmlHttp.onreadystatechange=callback_logout_view_right
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}
function callback_logout_view_right() 
{ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	
 { 
     var tmp=document.getElementById("view-right-box1");
         tmp.innerHTML='有账号？那请先 <a href="login.php" target="_blank">登录！</a> <br />没账号？那请先 <a href="reg.php" target=_blank>注册！</a> <br />';    

 } 
}

function sort_del(sort_id)
{
xmlHttp=new XMLHttpRequest();
var url="manager_sort_del.php";
url=url+"?id="+sort_id;
xmlHttp.onreadystatechange=callback_sort_del;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

} 

function callback_sort_del() 
{ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 {   
	
    var tmp=document.getElementById("sort_con");
		tmp.innerHTML=xmlHttp.responseText;
			
	
 } 
}

function inputtextreplaceonfocus(txt,Elementid) 
{ 
if(txt.value==txt.defaultValue)
{
	txt.value='';
	document.getElementById(Elementid).style.color = "black";
}

}

function inputtextreplaceonBlur(txt,Elementid) 
{
	if(!txt.value)
	{
		txt.value=txt.defaultValue;
		document.getElementById(Elementid).style.color = "#BBBBBB";
	}
}

function sort_add() 
{   
       document.getElementById("sort_add").innerHTML="<div id=sort_add><p><a href='javascript:sort_addp()'>添加栏目-</a></p><form name='sort_add_form'><input type='text' name='sort_add_id' id='w14' value='栏目ID' onFocus='inputtextreplaceonfocus(this,\"w14\")' onBlur='inputtextreplaceonBlur(this,\"w14\")'/><input type='text' name='sort_add' id='w20' value='栏目名称' onFocus='inputtextreplaceonfocus(this,\"w20\")' onBlur='inputtextreplaceonBlur(this,\"w20\")'/><p><a id=sort_add href='javascript:sort_addn(sort_add_form.sort_add_id.value,sort_add_form.sort_add.value)'>提交</a></p></form></div>";
}

function sort_addp() 
{   
       document.getElementById("sort_add").innerHTML="<div id=sort_add><p><a href='javascript:sort_add()'>添加栏目+</a></p></div>";
}

function sort_addn(sort_add_id,sort_add)
{

xmlHttp=new XMLHttpRequest();
var url="manager_sort_add.php";
url=url+"?sort_add_id="+sort_add_id+"&sort_add="+sort_add;
xmlHttp.onreadystatechange=callback_sort_addn;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
} 

function callback_sort_addn() 
{ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 {   
	
    var tmp=document.getElementById("sort_con");
		tmp.innerHTML=xmlHttp.responseText;
			
	
 } 
}

function article_del(id,s)
{

xmlHttp=new XMLHttpRequest();
var url="manager_article_del.php";
url=url+"?id="+id+"&s="+s;
xmlHttp.onreadystatechange=callback_article_del;//注意，函数后面没有括号哦~不能用callback_article_del();
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

} 

function callback_article_del() 
{ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 {   
	
    var tmp=document.getElementById("articlee_ul");
		tmp.innerHTML=xmlHttp.responseText;

			
	
 } 
}


function link_add() 
{   
       document.getElementById("link_add").innerHTML="<div id=link_add><p><a href='javascript:link_addp()'>添加链接-</a></p><form name='link_add_form'><input type='text' name='link_id' id='w14' value='ID' onFocus='inputtextreplaceonfocus(this,\"w14\")' onBlur='inputtextreplaceonBlur(this,\"w14\")'/><input type='text' name='link' id='w14' value='Link' onFocus='inputtextreplaceonfocus(this,\"w14\")' onBlur='inputtextreplaceonBlur(this,\"w14\")'/><input type='text' name='status' id='w14' value='状态' onFocus='inputtextreplaceonfocus(this,\"w14\")' onBlur='inputtextreplaceonBlur(this,\"w14\")'/><input type='text' name='note' id='w14' value='描述' onFocus='inputtextreplaceonfocus(this,\"w14\")' onBlur='inputtextreplaceonBlur(this,\"w14\")'/><p><a id=link_add href='javascript:link_addn(link_add_form.link_id.value,link_add_form.link.value,link_add_form.status.value,link_add_form.note.value)'>提交</a></p></form></div>";
}
//<form name='link_add_form'><input type='text' name='link_add_id' id='w14' value='栏目ID' onFocus='inputtextreplaceonfocus(this,\"w14\")' onBlur='inputtextreplaceonBlur(this,\"w14\")'/><input type='text' name='link_add' id='w20' value='栏目名称' onFocus='inputtextreplaceonfocus(this,\"w20\")' onBlur='inputtextreplaceonBlur(this,\"w20\")'/><p><a id=link_add href='javascript:link_addn(sort_add_form.sort_add_id.value,sort_add_form.sort_add.value)'>提交</a></p></form>

function link_addp() 
{   
       document.getElementById("link_add").innerHTML="<div id=link_add><p><a href='javascript:link_add()'>添加栏目+</a></p></div>";
}

function link_addn(link_id,link,status,note)
{

xmlHttp=new XMLHttpRequest();
var url="manager_link_add.php";
url=url+"?link_id="+link_id+"&link="+link+"&status="+status+"&note="+note;
xmlHttp.onreadystatechange=callback_link_addn;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
} 

function callback_link_addn() 
{ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 {   
	
    var tmp=document.getElementById("sort_ul");
		tmp.innerHTML=xmlHttp.responseText;
			
	
 } 
}

function link_del(link_id)
{
xmlHttp=new XMLHttpRequest();
var url="manager_link_del.php";
url=url+"?id="+link_id;
xmlHttp.onreadystatechange=callback_link_del;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

} 

function callback_link_del() 
{ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 {   
	
    var tmp=document.getElementById("sort_con");
		tmp.innerHTML=xmlHttp.responseText;
			
	
 } 
}

function cal(m,y)
{
xmlHttp=new XMLHttpRequest();
var url="cal.php";
url=url+"?m="+m+"&y="+y;
xmlHttp.onreadystatechange=callback_cal;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

} 

function callback_cal() 
{ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 {   
	
    var tmp=document.getElementById("cal");
		tmp.innerHTML=xmlHttp.responseText;
			
	
 } 
}

function comm_del(id)
{
xmlHttp=new XMLHttpRequest();
var url="manager_comm_del.php";
url=url+"?id="+id;
xmlHttp.onreadystatechange=callback_comm_del;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

} 

function callback_comm_del() 
{ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 {   
	
    var tmp=document.getElementById("article_ul");
		tmp.innerHTML=xmlHttp.responseText;
			
	
 } 
}




