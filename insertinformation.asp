<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/data.asp" -->
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

<%
Function htmlspecialchars(str)
	str = Replace(str, "&", "&amp;")
	str = Replace(str, "<", "&lt;")
	str = Replace(str, ">", "&gt;")
	str = Replace(str, """", "&quot;")
	htmlspecialchars = str
End Function
%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>增加新通知</title>
	<link rel="stylesheet" href="../themes/default/default.css" />
	<link rel="stylesheet" href="../plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor.js"></script>
	<script charset="utf-8" src="../lang/zh-CN.js"></script>
	<script charset="utf-8" src="../plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '../plugins/code/prettify.css',
				uploadJson : '../asp/upload_json.asp',
				fileManagerJson : '../asp/file_manager_json.asp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				} 
			});
			prettyPrint();
		});
	</script>
</head>
<body>
	<p align="center">&nbsp;</p>
	<p align="center">您好，<%=(Recordset1.Fields.Item("名称").Value)%>！ <a href="<%= MM_Logout %>">注销</a></p>
    <p align="center">——————————————————————————————————————	</p>
    <form name="example" method="post" action="insertinformationsuccess.php" target="_blank">
	  <p align="center">增加新通知</p>
		<p align="center">标题：
		  <label for="title"></label>
		  <input  style="width:30%" type="text" name="title" id="title">
           <input type="hidden" id="adminname" name="adminname" value="<%=(Recordset1.Fields.Item("名称").Value)%>" />
		</p>
		<div align="center">
          <p>在此输入具体内容          </p>
          <p>
            <textarea name="content1"  id="content1" style="width:900px;height:400px;visibility:hidden;"></textarea>
            <br />
            <input onClick="return confirm2()" style="width:200px; height:50px"type="submit" name="button" value="提交内容" />
          </p>
          </p>
        </div>
	</form>
	   <script>
	   function confirm2()
	   {
		   
					
		   if(document.getElementById("title").value=="")
		   	{
				alert("请输入标题内容。")
					return false
			}
		
		   if(confirm('确认要增加吗？'))
			   return true
			  else
			  return false
		 }
	   </script>
<p>&nbsp;</p>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>