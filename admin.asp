<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
' *** Logout the current user.
MM_Logout = CStr(Request.ServerVariables("URL")) & "?MM_Logoutnow=1"
If (CStr(Request("MM_Logoutnow")) = "1") Then
  Session.Contents.Remove("MM_Admin")
  Session.Contents.Remove("MM_AdminAuthorization")
  MM_logoutRedirectPage = "login.asp"
  ' redirect with URL parameters (remove the "MM_Logoutnow" query param).
  if (MM_logoutRedirectPage = "") Then MM_logoutRedirectPage = CStr(Request.ServerVariables("URL"))
  If (InStr(1, UC_redirectPage, "?", vbTextCompare) = 0 And Request.QueryString <> "") Then
    MM_newQS = "?"
    For Each Item In Request.QueryString
      If (Item <> "MM_Logoutnow") Then
        If (Len(MM_newQS) > 1) Then MM_newQS = MM_newQS & "&"
        MM_newQS = MM_newQS & Item & "=" & Server.URLencode(Request.QueryString(Item))
      End If
    Next
    if (Len(MM_newQS) > 1) Then MM_logoutRedirectPage = MM_logoutRedirectPage & MM_newQS
  End If
  Response.Redirect(MM_logoutRedirectPage)
End If
%>
<!--#include file="Connections/text.asp" -->
<%
Dim Recordset60
Dim Recordset60_cmd
Dim Recordset60_numRows

Set Recordset60_cmd = Server.CreateObject ("ADODB.Command")
Recordset60_cmd.ActiveConnection = MM_text_STRING
Recordset60_cmd.CommandText = "SELECT count(*) as numm FROM content WHERE [group] in(select [groupno] from [group] where target = '"&session("MM_Admin")&"')and lookornot = 'unlook'" 
Recordset60_cmd.Prepared = true

Set Recordset60 = Recordset60_cmd.Execute
Recordset60_numRows = 0
%>
<!--#include file = "loginconfirmadmin.asp"-->
<!--#include file="Connections/mysql.asp" -->
<%
Dim Recordset5
Dim Recordset5_cmd
Dim Recordset5_numRows

Set Recordset5_cmd = Server.CreateObject ("ADODB.Command")
Recordset5_cmd.ActiveConnection = MM_mysql_STRING
Recordset5_cmd.CommandText = "SELECT 登陆次数 FROM 管理 WHERE 用户名 = '" & session("MM_Admin") &"'" 
Recordset5_cmd.Prepared = true

Set Recordset5 = Recordset5_cmd.Execute
Recordset5_numRows = 0
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
.btn251 {	width:200px;
	height:49px;
	line-height:24px;
	font-size:24px;
	background:url("images/button/bg25.jpg") no-repeat left top;
	color:#FFF;
	cursor:pointer;
	padding-left:24px;
}

</style>
<head>
  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员·欢迎使用</title>
<link href="css/button.css" rel="stylesheet" type="text/css" />
<style> 
<!--
.pbtn1
{	
	border:solid 2px #dcdcdc;
	padding:4px 14px 4px 34px;
	color:#959595;
}
.btn1
{
	background:url("images/button/ok.gif") no-repeat 8px center;
	background-color:#f9f9f9;
}
.btn11
{
	width:143px;
	height:40px;
	background:url("images/button/bg11.jpg") no-repeat left top;
	color:#FFF;
	cursor:pointer;
}
.btn12
{
	width:143px;
	height:40px;
	background:url("images/button/bg12.jpg") no-repeat left top;
	color:#FFF;
	cursor:pointer;
}
.btn26
{
	width:140px;
	height:36px;
	line-height:18px;
	font-size:18px;
	background:url("images/button/bg26.jpg") no-repeat left top;
	color:#FFF;
	padding-bottom:4px;
	cursor:pointer;
}
.btn25
{
	width:200px;
	height:49px;
	line-height:24px;
	font-size:24px;
	background:url("images/button/bg25.jpg") no-repeat left top;
	color:#FFF;
	cursor:pointer;
	padding-left:24px;
}
.btn27
{
	width:144px;
	height:49px;
	line-height:18px;
	font-size:18px;
	background:url("images/button/bg27.jpg") no-repeat left top;
	color:#FFF;
	padding-left:14px;
	cursor:pointer;
}
.btn28
{
	width:145px;
	height:40px;
	line-height:18px;
	font-size:18px;
	background:url("images/button/bg28.jpg") no-repeat left top;
	color:#FFF;
	padding:0px 0px 2px 16px;
	cursor:pointer;
}
.btn29
{
	width:143px;
	height:43px;
	line-height:18px;
	font-size:18px;
	background:url("images/button/bg29.jpg") no-repeat left top;
	color:#FFF;
	cursor:pointer;
}
.btn45
{
	width:152px;
	height:60px;
	background:url("images/button/bg45.jpg") repeat-x left top;	
	color:#ffafaf;
	padding-bottom:18px;
	padding-left:14px;
}
-->
</style>
</head>

<%
' *** Logout the current user.
MM_Logout = CStr(Request.ServerVariables("URL")) & "?MM_Logoutnow=1"
If (CStr(Request("MM_Admin")) = "1") Then
  Session.Contents.Remove("MM_Admin")
  Session.Contents.Remove("MM_AdminAuthorization")
  MM_logoutRedirectPage = "login.asp"
  ' redirect with URL parameters (remove the "MM_Logoutnow" query param).
  if (MM_logoutRedirectPage = "") Then MM_logoutRedirectPage = CStr(Request.ServerVariables("URL"))
  If (InStr(1, UC_redirectPage, "?", vbTextCompare) = 0 And Request.QueryString <> "") Then
    MM_newQS = "?"
    For Each Item In Request.QueryString
      If (Item <> "MM_Logoutnow") Then
        If (Len(MM_newQS) > 1) Then MM_newQS = MM_newQS & "&"
        MM_newQS = MM_newQS & Item & "=" & Server.URLencode(Request.QueryString(Item))
      End If
    Next
    if (Len(MM_newQS) > 1) Then MM_logoutRedirectPage = MM_logoutRedirectPage & MM_newQS
  End If
  Response.Redirect(MM_logoutRedirectPage)
End If
%>
<%
Dim Recordset2
Dim Recordset2_cmd
Dim Recordset2_numRows

Set Recordset2_cmd = Server.CreateObject ("ADODB.Command")
Recordset2_cmd.ActiveConnection = MM_mysql_STRING
Recordset2_cmd.CommandText = "SELECT * FROM 统计" 
Recordset2_cmd.Prepared = true

Set Recordset2 = Recordset2_cmd.Execute
Recordset2_numRows = 0
%>
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "1"
If (Session("MM_Admin") <> "") Then 
  Recordset1__MMColParam = Session("MM_Admin")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_mysql_STRING
Recordset1_cmd.CommandText = "SELECT * FROM 管理 WHERE 用户名 = ?" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 200, 1, 255, Recordset1__MMColParam) ' adVarChar

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<!--#include file="Connections/tj.asp" -->
<%
Dim Recordset4
Dim Recordset4_cmd
Dim Recordset4_numRows

Set Recordset4_cmd = Server.CreateObject ("ADODB.Command")
Recordset4_cmd.ActiveConnection = MM_tj_STRING
Recordset4_cmd.CommandText = "SELECT 1700+count(*) as cjdnum FROM 留言 where 类型 = 'swgl'" 
Recordset4_cmd.Prepared = true

Set Recordset4 = Recordset4_cmd.Execute
Recordset4_numRows = 0
%>
<%
Dim Recordset3
Dim Recordset3_cmd
Dim Recordset3_numRows

Set Recordset3_cmd = Server.CreateObject ("ADODB.Command")
Recordset3_cmd.ActiveConnection = MM_tj_STRING
Recordset3_cmd.CommandText = "SELECT * FROM 统计" 
Recordset3_cmd.Prepared = true

Set Recordset3 = Recordset3_cmd.Execute
Recordset3_numRows = 0
%>

<body>

<p align="center">&nbsp;</p>
<p align="center">您好，<%=(Recordset1.Fields.Item("名称").Value)%>！ <a href="<%= MM_Logout %>">注销</a></p>
<p align="center">———————————————————————— </p>
<p align="center">这是您第<%=(Recordset5.Fields.Item("登陆次数").Value)%>次登陆，欢迎使用。</p>
<p align="center">三思网站总访问量：<%=(Recordset3.Fields.Item("ID").Value)%>次</p>
<p align="center">三思系统总登陆次数：<%=(Recordset2.Fields.Item("ID").Value)%>次</p>
<p align="center">通过三思访问预约成绩单页面次数：<%=(Recordset4.Fields.Item("cjdnum").Value)%>次</p>
<p align="center">————————————————————————</p>
<% if Recordset60.Fields.Item("numm").Value >0  then %>
<p align="center" style="color:#009">有学生给您留言，总共<%=(Recordset60.Fields.Item("numm").Value)%>条，点击下方<strong>留言模块</strong>查看具体内容。</p>
<p align="center">————————————————————————</p>
<% end if %>
<p align="center">请在下方点击相应链接进行操作</p>
<p align="center">
<form  action="scorecaptcha.php" method="post" target="_blank">
  <input type="submit" class="btn26" value="信息/成绩管理" onMouseOver="this.style.backgroundPosition='left -36px'" onMouseOut="this.style.backgroundPosition='left top'" />
<input type="hidden" id="pswd" name="pswd" value="0103@1144.com" />
</form>
</p>
<p align="center">  <span class="d1">
  <input type="button" class="btn12" onMouseOver="this.style.backgroundPosition='left -40px'" onMouseOut="this.style.backgroundPosition='left top'" onClick="window.open('informationadmin.asp');" value="通知信息相关" />
</span></p>
<p align="center">
  <input type="button" class="btn11" onMouseOver="this.style.backgroundPosition='left -40px'" onMouseOut="this.style.backgroundPosition='left top'"  onclick="window.open('studentadmin.asp');" value="学生信息相关" />
</p>
<p align="center"><span class="d2">
  <input type="button" class="btn26" value="统计相关" onMouseOver="this.style.backgroundPosition='left -36px'" onClick="window.open('countadmin.asp');" onMouseOut="this.style.backgroundPosition='left top'" />
</span></p>
<p align="center">
  <input type="button" class="btn11" onMouseOver="this.style.backgroundPosition='left -40px'" onMouseOut="this.style.backgroundPosition='left top'"  onclick="window.open('addpush.php');" value="推免相关" />
</p>
<p align="center">
  <input type="button" class="btn12" onMouseOver="this.style.backgroundPosition='left -40px'" onMouseOut="this.style.backgroundPosition='left top'" onClick="window.open('applydeal.asp');" value="就业预约管理" />
</p>

<form   action="addxly.php" method="post" target="_blank">
  <input type="submit" class="btn29" value="夏令营相关" onMouseOver="this.style.backgroundPosition='left -43px'" onMouseOut="this.style.backgroundPosition='left top'" />
  <input type="hidden" id="adminname" name="adminname" value="<%=(Recordset1.Fields.Item("名称").Value)%>" />
<input type="hidden" id="pass" name="pass" value="xlyfbxg" />
</form>
<form  action="teacheradmin.php" method="post" target="_blank">
  <input type="submit" class="btn26" value="导师信息相关" onMouseOver="this.style.backgroundPosition='left -36px'" onMouseOut="this.style.backgroundPosition='left top'" />
<input type="hidden" id="adminname" name="adminname" value="<%=(Recordset1.Fields.Item("名称").Value)%>" />
<input type="hidden" id="pass" name="pass" value="dsxxfbxg" />
</form>
<p align="center">
  <input type="button" class="btn251" value="留言模块" onMouseOver="this.style.backgroundPosition='left -49px'" onMouseOut="this.style.backgroundPosition='left top'" onClick="window.open('textadmin.asp');" />
</p>
<p align="center">&nbsp;</p>

  

<p>&nbsp;</p>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
<%
Recordset3.Close()
Set Recordset3 = Nothing
%>
<%
Recordset60.Close()
Set Recordset60 = Nothing
%>
<%
Recordset5.Close()
Set Recordset5 = Nothing
%>
<%
Recordset4.Close()
Set Recordset4 = Nothing
%>
<%
Recordset2.Close()
Set Recordset2 = Nothing
%>
