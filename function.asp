<%
Function ap_getsql(sql,keyname)
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open sql,Conn
ap_getsql=Rs(keyname)
End Function

Function ap_query(sql)
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open sql,Conn
if not rs.eof then
ap_query=Rs.GetRows()
end if
End Function

Function ap_Exec(sql)
Conn.Execute(sql)
End Function

Function getoption(opt)
dim sql
sql="SELECT keyvalue FROM setting where keyname="&opt
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open sql,Conn
response.write Rs.GetString
End Function


Function ap_test()
dim a,b
a=1
a=b+1
ap_test=a
End Function
%>