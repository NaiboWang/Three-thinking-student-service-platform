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
<%
Dim Repeat2__numRows
Dim Repeat2__index

Repeat2__numRows = 300
Repeat2__index = 0
Recordset9_numRows = Recordset9_numRows + Repeat2__numRows
%>
<!--#include file = "loginconfirmadmin.asp"-->
<!--#include file="Connections/data.asp" -->
<%
Dim Recordset5
Dim Recordset5_cmd
Dim Recordset5_numRows

Set Recordset5_cmd = Server.CreateObject ("ADODB.Command")
Recordset5_cmd.ActiveConnection = MM_data_STRING
Recordset5_cmd.CommandText = "SELECT 登陆次数 FROM 管理 WHERE 用户名 = '" & session("MM_Admin") &"'" 
Recordset5_cmd.Prepared = true

Set Recordset5 = Recordset5_cmd.Execute
Recordset5_numRows = 0
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员·学生信息管理</title>


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
Recordset2_cmd.ActiveConnection = MM_data_STRING
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
Recordset1_cmd.ActiveConnection = MM_data_STRING
Recordset1_cmd.CommandText = "SELECT * FROM 管理 WHERE 用户名 = ?" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 200, 1, 255, Recordset1__MMColParam) ' adVarChar

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<!--#include file="Connections/tj.asp" -->
<!--#include file="Connections/mysql.asp" -->
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
<%
Dim Recordset6
Dim Recordset6_cmd
Dim Recordset6_numRows

Set Recordset6_cmd = Server.CreateObject ("ADODB.Command")
Recordset6_cmd.ActiveConnection = MM_mysql_STRING
Recordset6_cmd.CommandText = "SELECT 100+count(*) as num FROM student.record" 
Recordset6_cmd.Prepared = true

Set Recordset6 = Recordset6_cmd.Execute
Recordset6_numRows = 0
%>
<%
Dim Recordset9
Dim Recordset9_cmd
Dim Recordset9_numRows

Set Recordset9_cmd = Server.CreateObject ("ADODB.Command")

Recordset9_cmd.ActiveConnection = MM_tj_STRING
Recordset9_cmd.CommandText = "SELECT * FROM 留言 order by ID desc" 
Recordset9_cmd.Prepared = true
Set Recordset9 = Recordset9_cmd.Execute
Recordset9_numRows = 0

%>


<%
Dim Recordset8
Dim Recordset8_cmd
Dim Recordset8_numRows

Set Recordset8_cmd = Server.CreateObject ("ADODB.Command")
Recordset8_cmd.ActiveConnection = MM_data_STRING
Recordset8_cmd.CommandText = "SELECT * FROM 身份信息（不可泄露） ORDER BY 学号 ASC" 
Recordset8_cmd.Prepared = true

Set Recordset8 = Recordset8_cmd.Execute
Recordset8_numRows = 0
%>



<body>

<p align="center">&nbsp;</p>
<p align="center">您好，<%=(Recordset1.Fields.Item("名称").Value)%>！ <a href="<%= MM_Logout %>">注销</a></p>
<p align="center">————————————————————————</p>
<p align="center">学生总登陆次数：<%=(Recordset2.Fields.Item("ID").Value)%>次</p>
<p align="center">通过三思访问预约成绩单页面次数：<%=(Recordset4.Fields.Item("cjdnum").Value)%>次</p>
<p align="center">成绩证明下载次数：<%=(Recordset6.Fields.Item("num").Value)%>次</p>
<p align="center">————————————————————————</p>
<p align="center">最近300次学生登陆行为</p>
<p align="center">
<div align="center">
<div align="center" style="overflow:scroll; height:500px; width: 700px;">
  
    <table width="400" border="1" align="center">
      <tr>
        <td align="center">ID</td>
        <td align="center">帐号</td>
        <td align="center">时间</td>
        <td align="center">IP</td>
        <td align="center">类型</td>
      </tr>
    
    <% 
While ((Repeat2__numRows <> 0) AND (NOT Recordset9.EOF)) 
%>
    <tr align="center">
      <td align="center" nowrap="nowrap"><%=(Recordset9.Fields.Item("ID").Value)%></td>
      <td align="center" nowrap="nowrap"><%=(Recordset9.Fields.Item("账号").Value)%></td>
      <td align="center" nowrap="nowrap"><%=(Recordset9.Fields.Item("时间").Value)%></td>
      <td  align="center" nowrap="nowrap"><%=(Recordset9.Fields.Item("IP").Value)%></td>
      <td align="center" nowrap="nowrap"><%=(Recordset9.Fields.Item("类型").Value)%></td>
      </tr>

  <% 
  Repeat2__index=Repeat2__index+1
  Repeat2__numRows=Repeat2__numRows-1
  Recordset9.MoveNext()
Wend
%>
</table>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
Recordset8_numRows = Recordset8_numRows + Repeat1__numRows
%>
  </div>
</div>
<div align="center">
  </p>
  <p>学生基本信息</p>
  <div align="center" style="overflow:scroll; height:1000px">
  <table width="1189" border="1">
    <tr>
      <td width="139"><div align="center">学号</div></td>
      <td width="144"><div align="center">姓名</div></td>
      <td width="117"><div align="center">培养方向</div></td>
      <td width="210"><div align="center">身份证号</div></td>
      <td width="210"><div align="center">密码</div></td>
      <td width="133"><div align="center">登录次数</div></td>
    </tr>
  <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset8.EOF)) 
%>

    <tr>
      <td width="139"><div align="center"><%=(Recordset8.Fields.Item("学号").Value)%></div></td>
      <td width="144"><div align="center"><%=(Recordset8.Fields.Item("姓名").Value)%></div></td>
      <td width="117"><div align="center"><%=(Recordset8.Fields.Item("培养方向").Value)%></div></td>
      <td width="210"><div align="center"><%=(Recordset8.Fields.Item("身份证号").Value)%></div></td>
       <td width="210"><div align="center"><%=(Recordset8.Fields.Item("密码").Value)%></div></td>
      <td width="133"><div align="center"><%=(Recordset8.Fields.Item("ID").Value)%></div></td>
    </tr>
 
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset8.MoveNext()
Wend
%>
 </table>
</div>
  <p>&nbsp;</p>
</div>
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
Recordset6.Close()
Set Recordset6 = Nothing
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
<%
Recordset9.Close()
Set Recordset9 = Nothing
%>



