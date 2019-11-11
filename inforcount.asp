<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/data.asp" -->
<!--#include file="Connections/mysql.asp" -->
<%
Dim Recordset2__MMColParam
Recordset2__MMColParam = "1"
If (Request.Form("ID") <> "") Then 
  Recordset2__MMColParam = Request.Form("ID")
End If
%>
<%
Dim Recordset2
Dim Recordset2_cmd
Dim Recordset2_numRows

Set Recordset2_cmd = Server.CreateObject ("ADODB.Command")
Recordset2_cmd.ActiveConnection = MM_mysql_STRING
Recordset2_cmd.CommandText = "SELECT * FROM student.countinfor WHERE ID = ?" 
Recordset2_cmd.Prepared = true
Recordset2_cmd.Parameters.Append Recordset2_cmd.CreateParameter("param1", 5, 1, -1, Recordset2__MMColParam) ' adDouble

Set Recordset2 = Recordset2_cmd.Execute
Recordset2_numRows = 0
%>
<%
Dim Recordset3
Dim Recordset3_cmd
Dim Recordset3_numRows

Set Recordset3_cmd = Server.CreateObject ("ADODB.Command")
Recordset3_cmd.ActiveConnection = MM_mysql_STRING
Recordset3_cmd.CommandText = "SELECT * FROM student.countable"&request.Form("ID")&" ORDER BY 学号 ASC" 
Recordset3_cmd.Prepared = true

Set Recordset3 = Recordset3_cmd.Execute
Recordset3_numRows = 0
%>
<%
Dim Recordset4
Dim Recordset4_cmd
Dim Recordset4_numRows

Set Recordset4_cmd = Server.CreateObject ("ADODB.Command")
Recordset4_cmd.ActiveConnection = MM_mysql_STRING
Recordset4_cmd.CommandText = "SELECT 学号, 姓名, 教学班 FROM student.身份信息（不可泄露） WHERE 学号 not in( select 学号 from countable"&request.Form("ID")&") order by 教学班 ASC,学号 ASC" 
Recordset4_cmd.Prepared = true

Set Recordset4 = Recordset4_cmd.Execute
Recordset4_numRows = 0
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
Recordset4_numRows = Recordset4_numRows + Repeat2__numRows
%>
<!--#include file = "loginconfirmadmin.asp"-->
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

<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>统计信息查看</title>
</head>
<body>
<p align="center">&nbsp;</p>
<p align="center">您好，<%=(Recordset1.Fields.Item("名称").Value)%>！</p>
<p align="center">——————————————————————————————————————</p>
<p align="center">统计名称：<%=(Recordset2.Fields.Item("title").Value)%></p>
<p align="center">注：没有任何人提交的时候生成EXCEL会出错。</p>
<form name="form1" method="post" action="excelcount.php" target="_blank">
  <div align="center"><span style="padding-top:20px">
  <input type="hidden" id="ID" name="ID" value="<%=request.Form("ID")%>" />
    <input type="submit" name="12" id="12" value="点击这里生成EXCEL表格" style="font-size: 16px;
  font-weight: 300 !important;
  position:relative;
  color: #fff;
  cursor: pointer;
  outline: none;
  padding: 10px 15px;
  width: 20%;
  border: none;
  background: #00BBFF ;
  border-radius: 2px;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
  text-transform: uppercase;margin-left:12px" onMouseOver="this.style.background='#9900FF'" onMouseOut="this.style.background='#00BBFF '" />
  </span></div>
</form>
<p align="center">——————————————————————————————————————</p>
<p align="center">尚未提交学生名单</p>
<div align="center">
<div align="center" style="overflow:scroll; height:500px; width: 700px;">
  <table width="400" border="1" align="center">
    <tr>
    <td align="center">班级</td>
      <td align="center">学号</td>
      <td align="center">姓名</td>
   
    </tr>
    <% 
While ((Repeat2__numRows <> 0) AND (NOT Recordset4.EOF)) 
%>
      <tr>
        <td align="center"><%=(Recordset4.Fields.Item("教学班").Value)%></td>
        <td align="center"><%=(Recordset4.Fields.Item("学号").Value)%></td>
        <td align="center"><%=(Recordset4.Fields.Item("姓名").Value)%></td>
      </tr>
      <% 
  Repeat2__index=Repeat2__index+1
  Repeat2__numRows=Repeat2__numRows-1
  Recordset4.MoveNext()
Wend
%>
  </table>

</div>
</div>
<p align="center">&nbsp;</p>
<p align="center">已提交学生名单</p>
<div align="center">
  <div align="center" style="overflow:scroll; height:500px; width: 700px;">
    <table width="400" border="1" align="center">
      <tr>
        <td align="center">学号</td>
        <td align="center">姓名</td>
      </tr>
      <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset3.EOF)) 
%>
        <tr>
          <td align="center"><%=(Recordset3.Fields.Item("学号").Value)%></td>
          <td align="center"><%=(Recordset3.Fields.Item("姓名").Value)%></td>
        </tr>
        <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset3.MoveNext()
Wend
%>
    </table>
  </div>
</div>
<p align="center">&nbsp;</p>
</body>
</html><%
Recordset1.Close()
Set Recordset1 = Nothing
%>
<%
Recordset4.Close()
Set Recordset4 = Nothing
%>
<%
Recordset3.Close()
Set Recordset3 = Nothing
%>
<%
Recordset2.Close()
Set Recordset2 = Nothing
%>
