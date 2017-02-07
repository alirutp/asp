<%
Function ap_getsql(sql,keyname)
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open sql,Conn
ap_getsql=Rs(keyname)
End Function

Function ap_test()
dim a,b
a=1
a=b+1
ap_test=a
End Function
%>