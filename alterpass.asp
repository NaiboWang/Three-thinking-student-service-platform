<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/mysql.asp" -->
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "1"
If (Session("MM_username") <> "") Then 
  Recordset1__MMColParam = Session("MM_username")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_mysql_STRING
Recordset1_cmd.CommandText = "SELECT * FROM 身份信息（不可泄露） WHERE 学号 = ? and 密码 = '"& request.Form("oldpass") &"'" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 200, 1, 255, Recordset1__MMColParam) ' adVarChar

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<%

Set Command1 = Server.CreateObject ("ADODB.Command")
Command1.ActiveConnection = MM_mysql_STRING
Command1.CommandText = "UPDATE 身份信息（不可泄露）  SET 密码 = '"& request.Form("newpass") &"' WHERE 学号='"&session("MM_username")&"'"
Command1.CommandType = 1
Command1.CommandTimeout = 0
Command1.Prepared = true


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<% If Recordset1.EOF And Recordset1.BOF Then %>
  <script>
  alert("原密码输入错误！");
  window.history.back(-1); 

  </script>
  
  <% 
  response.End()
 else ' end Recordset1.EOF And Recordset1.BOF %>
<script>alert("修改成功！")
    
    </script>
      
    <% 
  Session.Contents.Remove("MM_Username")
  Session.Contents.Remove("MM_UserAuthorization")	
	Command1.Execute()%>
    <script>
	
   window.location.href="scorelogin.asp"
    
    </script>
    
	
	<%
	End If
	
	%>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
