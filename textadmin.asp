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

Repeat2__numRows = -1
Repeat2__index = 0
Recordset1_numRows = Recordset1_numRows + Repeat2__numRows
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
Recordset2_numRows = Recordset2_numRows + Repeat1__numRows
%>
<!--#include file = "loginconfirmadmin.asp"-->
<!--#include file="Connections/data.asp" -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员·留言信息管理</title>


</head>


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



<!--#include file="Connections/text.asp" -->
<%
Dim Recordset60
Dim Recordset60_cmd
Dim Recordset60_numRows

Set Recordset60_cmd = Server.CreateObject ("ADODB.Command")
Recordset60_cmd.ActiveConnection = MM_text_STRING
Recordset60_cmd.CommandText = "SELECT * FROM content, [group] WHERE [group] in(select [groupno] from [group] where target = '"& session("MM_Admin") & "' and lookornot = 'unlook') and [group]=[groupno] order by ID desc"
Recordset60_cmd.Prepared = true

Set Recordset60 = Recordset60_cmd.Execute
Recordset60_numRows = 0
%>

<%
Dim Recordset61
Dim Recordset61_cmd
Dim Recordset61_numRows

Set Recordset61_cmd = Server.CreateObject ("ADODB.Command")
Recordset61_cmd.ActiveConnection = MM_text_STRING
Recordset61_cmd.CommandText = "SELECT * FROM content, [group] WHERE [group] in(select [groupno] from [group] where target = '"& session("MM_Admin") & "' and lookornot = 'look') and [group]=[groupno] order by ID desc"
Recordset61_cmd.Prepared = true

Set Recordset61 = Recordset61_cmd.Execute
Recordset61_numRows = 0
%>

<body>

<p align="center">&nbsp;</p>
<p align="center">您好，<%=(Recordset1.Fields.Item("名称").Value)%>！ <a href="<%= MM_Logout %>">注销</a></p>
<p align="center">————————————————————————</p>
<p align="center">注：下次打开此页面，未查看留言就自动变成了已查看留言，暂时开发到这里。</p>
<p align="center">————————————————————————</p>
<div align="center">
  <p align="center">未查看留言  </p>
  <div align="center" style="overflow:scroll; height:500px; width: 1000px;">
    <table width="400" border="1" align="center">
    <tr>
      <td align="center">ID</td>
      <td align="center">标题</td>
      <td align="center">内容</td>
      <td align="center">时间</td>
      <td align="center">留言人</td>
    </tr>
    <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset60.EOF)) 
%>
  <tr align="center">
    <td align="center" nowrap="nowrap"><%=(Recordset60.Fields.Item("ID").Value)%></td>
    <td align="center" nowrap="nowrap"><%=(Recordset60.Fields.Item("title").Value)%></td>
    <td align="center" nowrap="nowrap"><%=(Recordset60.Fields.Item("content").Value)%></td>
    <td  align="center" nowrap="nowrap"><%=(Recordset60.Fields.Item("time").Value)%></td>
    <%if Recordset60.Fields.Item("type").Value = "real" then%>
    <td align="center" nowrap="nowrap"><%=(Recordset60.Fields.Item("sno").Value)%></td>
    <%else%>
    <td align="center" nowrap="nowrap">匿名</td>
    <%end if%>
  </tr>
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset60.MoveNext()
Wend
%>
    </table>
</div>
  <p align="center">&nbsp;</p>
</div>
<div align="center">
  <p>已查看留言  </p>
  <div align="center" style="overflow:scroll; height:500px; width: 1000px;">
    <table width="400" border="1" align="center">
      <tr>
        <td align="center">ID</td>
        <td align="center">标题</td>
        <td align="center">内容</td>
        <td align="center">时间</td>
        <td align="center">留言人</td>
      </tr>
      <% 
While ((Repeat2__numRows <> 0) AND (NOT Recordset61.EOF)) 
%>
  <tr align="center">
    <td align="center" nowrap="nowrap"><%=(Recordset61.Fields.Item("ID").Value)%></td>
    <td align="center" nowrap="nowrap"><%=(Recordset61.Fields.Item("title").Value)%></td>
    <td align="center" nowrap="nowrap"><%=(Recordset61.Fields.Item("content").Value)%></td>
    <td  align="center" nowrap="nowrap"><%=(Recordset61.Fields.Item("time").Value)%></td>
    <%if Recordset61.Fields.Item("type").Value = "real" then%>
    <td align="center" nowrap="nowrap"><%=(Recordset61.Fields.Item("sno").Value)%></td>
    <%else%>
    <td align="center" nowrap="nowrap">匿名</td>
    <%end if%>
  </tr>
  <% 
  Repeat2__index=Repeat2__index+1
  Repeat2__numRows=Repeat2__numRows-1
  Recordset61.MoveNext()
Wend
%>
<%
Set Command112 = Server.CreateObject ("ADODB.Command")
Command112.ActiveConnection = MM_text_STRING
Command112.CommandText = "update content set lookornot = 'look' where [group] in (select  [groupno] from [group] where target = '"& session("MM_Admin") &"')"
Command112.CommandType = 1
Command112.CommandTimeout = 0
Command112.Prepared = true
Command112.Execute()
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
Recordset60.Close()
Set Recordset60 = Nothing
%><%
Recordset61.Close()
Set Recordset61 = Nothing
%>