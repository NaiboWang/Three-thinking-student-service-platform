<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/mysql.asp" -->
<!--#include file="Connections/tj.asp" -->
<%
If Session("user_is_admin")<>"true" Then
    Session("user_is_admin")="true"
Set Command111 = Server.CreateObject ("ADODB.Command")
Command111.ActiveConnection = MM_tj_STRING
Command111.CommandText = "INSERT INTO 留言 (账号,IP, 类型, 时间)  VALUES ('guest',' "  & request.servervariables("remote_addr")  & "','adminlogin','" & year(Now) & "-" & Month(Now) & "-" & day(Now) & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now) & "' ) "
Command111.CommandType = 1
Command111.CommandTimeout = 0
Command111.Prepared = true
Command111.Execute()
%>
<%
Set Command112 = Server.CreateObject ("ADODB.Command")
Command112.ActiveConnection = MM_tj_STRING
Command112.CommandText = "update 统计 set  管理员 = 管理员+1 "
Command112.CommandType = 1
Command112.CommandTimeout = 0
Command112.Prepared = true
Command112.Execute()
end if
%>

<%
' *** Validate request to log in to this site.
MM_LoginAction = Request.ServerVariables("URL")
If Request.QueryString <> "" Then MM_LoginAction = MM_LoginAction + "?" + Server.HTMLEncode(Request.QueryString)
MM_valUsername = CStr(Request.Form("xh22"))
If MM_valUsername <> "" Then
  Dim MM_fldUserAuthorization
  Dim MM_redirectLoginSuccess
  Dim MM_redirectLoginFailed
  Dim MM_loginSQL
  Dim MM_rsUser
  Dim MM_rsUser_cmd
  
  MM_fldUserAuthorization = ""
  MM_redirectLoginSuccess = "admin.asp"
  MM_redirectLoginFailed = "login-lose.asp?type=2"

  MM_loginSQL = "SELECT 用户名, 密码"
  If MM_fldUserAuthorization <> "" Then MM_loginSQL = MM_loginSQL & "," & MM_fldUserAuthorization
  MM_loginSQL = MM_loginSQL & " FROM 管理 WHERE 用户名 = ? AND 密码 = ?"
  Set MM_rsUser_cmd = Server.CreateObject ("ADODB.Command")
  MM_rsUser_cmd.ActiveConnection = MM_mysql_STRING
  MM_rsUser_cmd.CommandText = MM_loginSQL
  MM_rsUser_cmd.Parameters.Append MM_rsUser_cmd.CreateParameter("param1", 200, 1, 255, MM_valUsername) ' adVarChar
  MM_rsUser_cmd.Parameters.Append MM_rsUser_cmd.CreateParameter("param2", 200, 1, 255, Request.Form("pswd2")) ' adVarChar
  MM_rsUser_cmd.Prepared = true
  Set MM_rsUser = MM_rsUser_cmd.Execute

  If Not MM_rsUser.EOF Or Not MM_rsUser.BOF Then 
    ' username and password match - this is a valid user
    Session("MM_Admin") = MM_valUsername
    If (MM_fldUserAuthorization <> "") Then
      Session("MM_AdminAuthorization") = CStr(MM_rsUser.Fields.Item(MM_fldUserAuthorization).Value)
    Else
      Session("MM_AdminAuthorization") = ""
    End If
    if CStr(Request.QueryString("accessdenied")) <> "" And false Then
      MM_redirectLoginSuccess = Request.QueryString("accessdenied")
    End If
    MM_rsUser.Close
	Set Command2 = Server.CreateObject ("ADODB.Command")
	Command2.ActiveConnection = MM_mysql_STRING
	Command2.CommandText = "UPDATE 管理 SET 登陆次数 = 登陆次数+1 where 用户名='" & Session("MM_Admin") &"'"
	Command2.CommandType = 1
	Command2.CommandTimeout = 0
	Command2.Prepared = true
	Command2.Execute()
    Response.Redirect(MM_redirectLoginSuccess)
	
	
  End If
  MM_rsUser.Close
  Response.Redirect(MM_redirectLoginFailed)
End If
%>
<!DOCTYPE HTML>
<html>
<head>
<title>三思-管理员登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style2.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!----webfonts--->
<link href='css/fonts2.css' rel='stylesheet' type='text/css'>
<!---//webfonts--->  
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script> 
</head>
<body id="login2">
  <div class="login-logo" >
    <a href="http://www.xidian.edu.cn/" target="_blank"><img src="images/scorelogo2.png"   width="450" height="116" alt=""/></a>
  </div>
  <h2 class="form-heading" style="font-family:'华文行楷'; font-size:24px" >&nbsp;</h2>
  <h2 class="form-heading" style="font-family:'华文行楷'; font-size:24px" >管理员登录</h2>
  <div class="app-cam">
    <form action = "<%=MM_LoginAction%>" id="form22" name="form22" method="POST" >
    <input type="text" class="text"  id = "xh" name="xh22" value="帐号" onfocus="if (this.value == '帐号') {this.value = '';}" onblur="if (this.value == '') {this.value = '帐号';}">
	  <input type="password" value="password" name = "pswd2" id = "pswd2" onfocus="if (this.value == 'password') {this.value = '';}" onblur="if (this.value == '') {this.value = 'password';}">
	  <div class="submit"><input type="submit" value="登录" >  <input type="reset"  value="重置"></div>
	</form>
  </div>
<p>
  
   </p>
<p>&nbsp;</p>
</body>
</html>