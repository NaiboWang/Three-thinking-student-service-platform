<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/mysql.asp" -->
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
Recordset10_numRows = Recordset10_numRows + Repeat1__numRows
%>
<!--#include file = "loginconfirmadmin.asp"-->
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
Dim Recordset10
Dim Recordset10_cmd
Dim Recordset10_numRows

Set Recordset10_cmd = Server.CreateObject ("ADODB.Command")
Recordset10_cmd.ActiveConnection = MM_mysql_STRING
Recordset10_cmd.CommandText = "SELECT * FROM student.informa order by ID desc" 
Recordset10_cmd.Prepared = true

Set Recordset10 = Recordset10_cmd.Execute
Recordset10_numRows = 0
%>
<%
Dim Recordset11
Dim Recordset11_cmd
Dim Recordset11_numRows

Set Recordset11_cmd = Server.CreateObject ("ADODB.Command")
Recordset11_cmd.ActiveConnection = MM_mysql_STRING
Recordset11_cmd.CommandText = "SELECT sum(num) as num1 FROM student.informa" 
Recordset11_cmd.Prepared = true

Set Recordset11 = Recordset11_cmd.Execute
Recordset11_numRows = 0
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知信息管理</title>

</head>
<style>
 .GoStyle
    {
         color:#00F;          
         background-color: #FFFFFF;
         border: 0px none;
         cursor:pointer;
         font-size: 16px;
		 text-decoration:underline;
    }
	
</style>
<script src="js/jquery.min.js"></script>
<body>
<p align="center">&nbsp;</p>
<p align="center">您好，<%=(Recordset1.Fields.Item("名称").Value)%>！ <a href="<%= MM_Logout %>">注销</a></p>
<p align="center">——————————————————————————————————————</p>
<p align="center">通知信息页面总访问次数：<%=(Recordset11.Fields.Item("num1").Value)%>次</p>
<p align="center">注：增加或删除完通知信息后，请<strong>手动刷新</strong>本页面。</p>
<form id="form1" name="form1" method="post" action="insertinformation.asp" target="_blank">
  <div align="center">
    <input  style="width:200px; height:50px; font-size:20px"type="submit" name="button" id="button" value="增加通知信息" />
    <input type="hidden" id="adminname" name="adminname" value="<%=(Recordset1.Fields.Item("名称").Value)%>" />

  </div>
</form>
<p align="center">——————————————————————————————————————</p>
<p align="center"></p>
 <div align="center">
  
   已发布通知</div>
 <div   align="center"class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
   <table>
     <thead>
       <tr >
         <th>ID</th>
         <th>标题</th>
         <th>发布时间</th>
         <th>访问量</th>
         <th>操作</th>
          <th>操作2</th>
       </tr>
     </thead>
     <tbody id="list_main">
     
       <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset10.EOF)) 
%>

  <tr>
    <td><%=1+Repeat1__index%></td>
    <td style="text-align:left"><a href="information.asp?ID=<%=(Recordset10.Fields.Item("ID").Value)%>" target="_blank"><%=(Recordset10.Fields.Item("title").Value)%></a></td>
    <td><div align="center"><%=(Recordset10.Fields.Item("time").Value)%></div></td>
    <td><div align="center"><%=(Recordset10.Fields.Item("num").Value)%></div></td>
    <td><div align="center">
      
      <form id="form2" name="form2" method="post" action="updateinformation.asp" target="_blank">
        
        <input  type="submit" class = "GoStyle" name="button" id="button" value="修改" />
     
        
        <input type="hidden" id="ID" name="ID" value="<%=(Recordset10.Fields.Item("ID").Value)%>" />
        </form>
      
    </div>
      
      
    </td>  
    <td><div align="center">
      <form id="form3" name="form3" method="post" action="deleteinformation.php"  onsubmit="return confirm2()"  target="_blank">
        
        <input  type="submit" class = "GoStyle" name="button" id="button" value="删除" />
        <input type="hidden" id="ID" name="ID" value="<%=(Recordset10.Fields.Item("ID").Value)%>" />
        
      </form>
      </div>
    </td> 
  </tr>
 
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset10.MoveNext()
Wend
%>
     </tbody>
   </table>
 </div>
 <script>
	   function confirm2()
	   {
		   if(confirm('确认要删除吗？'))
			   return true
			  else
			  return false
			   
		   
		 }
	   </script>
 <div id="innerpage" style="margin-top:5%;text-align:center"></div>



<p align="center">&nbsp;</p>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>

<%
Recordset10.Close()
Set Recordset10 = Nothing
%>
<%
Recordset11.Close()
Set Recordset11 = Nothing
%>
