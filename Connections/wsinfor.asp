<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/data.asp" -->
<%
Dim MM_editAction
MM_editAction = CStr(Request.ServerVariables("SCRIPT_NAME"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Server.HTMLEncode(Request.QueryString)
End If

' boolean to abort record edit
Dim MM_abortEdit
MM_abortEdit = false
%>
<%
If (CStr(Request("MM_update")) = "form1") Then
  If (Not MM_abortEdit) Then
    ' execute the update
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_data_STRING
		dim mmm
		mmm = left(request.form("stid"),6)
		 
    MM_editCmd.CommandText = "UPDATE [身份信息（不可泄露）] SET [身份证号] = ?,[密码] = '"& mmm &"' WHERE [学号] = ?" 

    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 201, 1, 255, Request.Form("stid")) ' adLongVarChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 200, 1, 255, Request.Form("MM_recordId")) ' adVarChar
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "wssuccess.asp"
    If (Request.QueryString <> "") Then
      If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0) Then
        MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
      Else
        MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
      End If
    End If
    Response.Redirect(MM_editRedirectUrl)
	
  End If
End If
%>
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "1"
If (request("users2") <> "") Then 
  Recordset1__MMColParam = request("users2")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_data_STRING
Recordset1_cmd.CommandText = "SELECT [密码], [身份证号], [学号] FROM 身份信息（不可泄露） WHERE [学号] = ?" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 200, 1, 255, Recordset1__MMColParam) ' adVarChar

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>完善信息</title>
</head>
<Script Language="VBScript">
Sub strMsg()
    MsgBox("字符串")
End Sub
</Script>

<body>
<div align="center" style="border-color:#064CF1; border:solid;max-width:500px; vertical-align:middle; align-content:center;margin:0 auto">
  <p>完善个人信息
</p>
  <p>注：修改身份证号后，请您用身份证号前6位登陆系统。</p>
  <p>学号：<%=request("users2")%></p>
  <p>姓名：<%=request("users3")%></p>
  <form id="form1" name="form1" method="POST" action="<%=MM_editAction%>">
    <p>请输入身份证号：
      <label for="身份证"></label>
      <input type="text" name="stid" id="stid" />
      <input type="hidden" name="MM_update" value="form1" />
      <input type="hidden" name="xh" value="<%= Recordset1.Fields.Item("学号").Value %>" />
      <input type="hidden" name="MM_recordId" value="<%= Recordset1.Fields.Item("学号").Value %>" />
    </p>
    <p>
      <input type="submit" name="12" id="12" value="提交" style="font-size: 14px;
  font-weight: 300 !important;
  position:relative;
  color: #fff;
  cursor: pointer;
  outline: none;
  padding: 2%;
  width: 60%;
  border: none;
  background: #00BBFF ;
  border-radius: 2px;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
  text-transform: uppercase;" onmouseover="this.style.background='#9900FF'" onmouseout="this.style.background='#00BBFF '" />
    </p>
  </form>
  
</div>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
