<%



Dim oConn,ConnString,DBPath
'数据库路径及文件名
DBPath = "users"
'数据库连接字符串
'ConnString = "Provider=Microsoft.ACE.OLEDB.15.0;Data Source=" & Server.MapPath(DBPath)
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("users.mdb")
'建立 Connection 对象的实例 oConn
Set Conn = Server.CreateObject("ADODB.Connection")
'调用 oConn 的 Open 方法打开连接
Conn.Open ConnStr
'检测是否出错
Dim ErrInfo
If Err Then
  Err.Clear '清空错误
  ErrInfo = "数据库连接出现错误，请联系管理员！<br>"
  ErrInfo = ErrInfo & "终止页面继续运行"
End If
%>

<%
Dim sql, RA
'sql = "DELETE FROM [运货商] WHERE [公司名称]='联邦货运'"
'Conn.Execute sql, RA
'RA返回的受影响的记录数，如果成功删除则显示 > 0
'Conn.Close
'Set oConn = Nothing
%>


<html>
<head>
<title>test</title>
</head>
<body>


<%
'Dim Rs
'sql = "SELECT * FROM users"
'Set Rs = Server.CreateObject("ADODB.Recordset")
'Rs.Open sql,Conn
%>
<h3>显示</h3>
<table border="1">
<tr>
  <th>编号</th>
  <th>产品名称</th>
  <th>单位数量</th>
  <th>单价</th>
</tr>
<%
'Dim num
'num = 1
'Do While NOT Rs.EOF '判断是否处于记录集的最末端
%>
<tr>
  <td><%'=num%></td>
  <td><%'=Rs("username")%></td>
  <td><%'=Rs("nick")%></td>
  <td><%'=Rs("userpass")%></td>
</tr>
<%
  'num = num + 1
  'Rs.MoveNext '下一条记录
'Loop '结束循环 Do While

'关闭连接、清空对象
'Rs.Close
'Set Rs = Nothing



'sql = "SELECT * FROM users"
'Set Rs = Server.CreateObject("ADODB.Recordset")
'Rs.Open sql, Conn, 1, 3  '这个3表示可修改
'调用 AddNew 准备插入记录
'Rs.AddNew()
'Rs("username") = "sdfaewf"
'Rs("nick") = 8
'RS("userpass") = 3 
'Rs.Update
'Rs.Close
'Set Rs = Nothing


sql = "INSERT INTO users (username,nick,userpass) values('sdfasdf11',545845,484848)"
Conn.Execute(sql)
Conn.Close
Set Conn = Nothing
%>
</table>

</body>
</html>