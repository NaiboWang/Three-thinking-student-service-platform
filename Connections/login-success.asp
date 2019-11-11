<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
' *** Logout the current user.
MM_Logout = CStr(Request.ServerVariables("URL")) & "?MM_Logoutnow=1"
If (CStr(Request("MM_Logoutnow")) = "1") Then
  Session.Contents.Remove("MM_Username")
  Session.Contents.Remove("MM_UserAuthorization")
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
<!--#include file="Connections/data.asp" -->
<!--#include file="Connections/tj.asp" -->
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_data_STRING
Recordset1_cmd.CommandText = "SELECT * FROM 身份信息（不可泄露）"
Recordset1_cmd.Prepared = true

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
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
Dim Recordset3
Dim Recordset3_cmd
Dim Recordset3_numRows

Set Recordset3_cmd = Server.CreateObject ("ADODB.Command")
Recordset3_cmd.ActiveConnection = MM_data_STRING
Recordset3_cmd.CommandText = "SELECT * FROM 身份信息（不可泄露） ORDER BY [学号] ASC" 
Recordset3_cmd.Prepared = true

Set Recordset3 = Recordset3_cmd.Execute
Recordset3_numRows = 0
%>
<%
Dim Recordset4
Dim Recordset4_cmd
Dim Recordset4_numRows

Set Recordset4_cmd = Server.CreateObject ("ADODB.Command")
Recordset4_cmd.ActiveConnection = MM_tj_STRING
Recordset4_cmd.CommandText = "SELECT * FROM 统计" 
Recordset4_cmd.Prepared = true

Set Recordset4 = Recordset4_cmd.Execute
Recordset4_numRows = 0
%>
<%
Dim Recordset5
Dim Recordset5_cmd
Dim Recordset5_numRows

Set Recordset5_cmd = Server.CreateObject ("ADODB.Command")
Recordset5_cmd.ActiveConnection = MM_tj_STRING
Recordset5_cmd.CommandText = "SELECT * FROM 留言" 
Recordset5_cmd.Prepared = true

Set Recordset5 = Recordset5_cmd.Execute
Recordset5_numRows = 0
%>
<%
Dim Recordset6
Dim Recordset6_cmd
Dim Recordset6_numRows

Set Recordset6_cmd = Server.CreateObject ("ADODB.Command")

Recordset6_cmd.ActiveConnection = MM_tj_STRING
Recordset6_cmd.CommandText = "SELECT * FROM 留言" 
Recordset6_cmd.Prepared = true
Set Recordset6 = Recordset6_cmd.Execute
Recordset6_numRows = 0

%>
<%
Dim R7
Dim R7_cmd
Dim R7_numRows

Set R7_cmd = Server.CreateObject ("ADODB.Command")

R7_cmd.ActiveConnection = MM_tj_STRING
R7_cmd.CommandText = "SELECT count(*) as num FROM 留言" 
R7_cmd.Prepared = true
Set R7 = R7_cmd.Execute
R7_numRows = 0

%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
Recordset3_numRows = Recordset3_numRows + Repeat1__numRows
%>
<%
Dim Repeat2__numRows
Dim Repeat2__index

Repeat2__numRows = -1
Repeat2__index = 0
Recordset6_numRows = Recordset6_numRows + Repeat2__numRows
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员操作</title>
</head>

<body>
<div align="center">
  <p>您好，管理员！ <a href="<%= MM_Logout %>">注销</a></p>
  <p align="left">共登录次数：<%=(Recordset2.Fields.Item("ID").Value)%>次</p>
  <p align="left">共访问次数：<%=(Recordset4.Fields.Item("ID").Value)%>次</p>
  <table width="400" border="1">
    <tr>
      <td>ID</td>
      <td>时间</td>
      <td>IP</td>
      <td>type</td>
    </tr>
  </table>
  <% Recordset6.move(R7.Fields.Item("num").Value-100)
While ((Repeat2__numRows <> 0) AND (NOT Recordset6.EOF)) 
%>
    <table width="400" border="1">
      <tr>
        <td nowrap="nowrap"><%=(Recordset6.Fields.Item("ID").Value)%></td>
        <td nowrap="nowrap"><%=(Recordset6.Fields.Item("时间").Value)%></td>
        <td nowrap="nowrap"><%=(Recordset6.Fields.Item("IP").Value)%></td>
        <td nowrap="nowrap"><%=(Recordset6.Fields.Item("类型").Value)%></td>
      </tr>
    </table>
    <% 
  Repeat2__index=Repeat2__index+1
  Repeat2__numRows=Repeat2__numRows-1
  Recordset6.Movenext()
  
Wend
%>
<p align="left">&nbsp;</p>
</div>
<table width="1189" border="1">
  <tr>
    <td width="139"><div align="center">学号</div></td>
    <td width="144"><div align="center">姓名</div></td>
    <td width="71"><div align="center">班级</div></td>
    <td width="117"><div align="center">培养方向</div></td>
    <td width="210"><div align="center">身份证号</div></td>
    <td width="329"><div align="center">地区</div></td>
    <td width="133"><div align="center">登录次数</div></td>
  </tr>
</table>
<% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset3.EOF)) 
%>
  <table width="1189" border="1">
    <tr>
      <td width="139"><div align="center"><%=(Recordset3.Fields.Item("学号").Value)%></div></td>
      <td width="144"><div align="center"><%=(Recordset3.Fields.Item("姓名").Value)%></div></td>
      <td width="71"><div align="center"><%=(Recordset3.Fields.Item("教学班").Value)%></div></td>
      <td width="117"><div align="center"><%=(Recordset3.Fields.Item("培养方向").Value)%></div></td>
      <td width="210"><div align="center"><%=(Recordset3.Fields.Item("身份证号").Value)%></div></td>
      <td width="329"><div align="center"><%=(Recordset3.Fields.Item("家庭联系地址").Value)%></div></td>
      <td width="133"><div align="center"><%=(Recordset3.Fields.Item("ID").Value)%></div></td>
    </tr>
  </table>
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset3.MoveNext()
Wend
%>
<p></p>
<p>&nbsp;</p>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
<%
Recordset2.Close()
Set Recordset2 = Nothing
%>
<%
Recordset3.Close()
Set Recordset3 = Nothing
%>
<%
Recordset4.Close()
Set Recordset4 = Nothing
%>
<%
Recordset5.Close()
Set Recordset5 = Nothing
%>
<%
Recordset6.Close()
Set Recordset6 = Nothing
%>
