<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/data.asp" -->
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "1"
If (Session("xuehao") <> "") Then 
  Recordset1__MMColParam = Session("xuehao")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_data_STRING
Recordset1_cmd.CommandText = "SELECT [身份证号], [学号] FROM 身份信息（不可泄露） WHERE [学号] = ?" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 200, 1, 255, Recordset1__MMColParam) ' adVarChar

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>正在跳转……</title>
</head>

<body onload="form1.submit()">
<form id="form1" name="form1" method="post" action="wssuccess.php">
  <label for="xh"></label>
  <input type="hidden" name="xh" id="xh" value = "<%=(Recordset1.Fields.Item("身份证号").Value)&Session("xuehao") %>"
  />
  正在提交数据库，请稍候……
</form>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
