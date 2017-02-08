<%
dim sql,rs
sql="SELECT sort_id,sort_name FROM sort order by sort_id"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open sql,Conn
Tmp=Rs.GetRows()
For i=0 To ubound(tmp,2)  
response.write  "<li><a href='sort.asp?sort_id="&tmp(0,i)&"'>"&tmp(1,i)&"</a></li>"
Next  
%>