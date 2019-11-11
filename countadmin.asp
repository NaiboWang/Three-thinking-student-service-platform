<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/mysql.asp" -->
<%
Dim Recordset2
Dim Recordset2_cmd
Dim Recordset2_numRows

Set Recordset2_cmd = Server.CreateObject ("ADODB.Command")
Recordset2_cmd.ActiveConnection = MM_mysql_STRING
Recordset2_cmd.CommandText = "SELECT * FROM student.countinfor where ID <>0 ORDER BY ID DESC" 
Recordset2_cmd.Prepared = true

Set Recordset2 = Recordset2_cmd.Execute
Recordset2_numRows = 0
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>统计信息管理</title>

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
<p align="center">注：发起新统计信息后，请<strong>手动刷新</strong>本页面。</p>
<form id="form1" name="form1" method="post" action="insertcount.asp" target="_blank">
  <div align="center">
    <input  style="width:200px; height:50px; font-size:20px"type="submit" name="button" id="button" value="发起新统计" />
    <input type="hidden" id="adminname" name="adminname" value="<%=(Recordset1.Fields.Item("名称").Value)%>" />

  </div>
</form>
<p align="center">——————————————————————————————————————</p>
<form action="excelcount.php" method="post" name="form1" target="_blank" id="form4">
  <div align="center"><span style="padding-top:20px">
    <input type="hidden" id="ID" name="ID" value="0" />
    <input type="submit" name="12" id="12" value="将已存在学生基本属性生成EXCEL表格" style="font-size: 16px;
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
<p align="center">&nbsp;</p>
<p align="center"></p>
 <div align="center">
  
   已发布统计</div>
 <div   align="center"class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
   <table>
     <thead>
       <tr >
         <th>ID</th>
         <th>统计标题</th>
         <th>发布时间</th>
         <th>状态</th>
         <th>操作</th>
          <th>操作2</th>
       </tr>
     </thead>
     <tbody id="list_main">
       <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset2.EOF)) 
%>
  <tr>
    <td><%=Repeat1__index+1%></td>
    <td style="text-align:left"><%=(Recordset2.Fields.Item("title").Value)%></td>
    <td><div align="center"><%=(Recordset2.Fields.Item("time").Value)%></div></td>
    <%if Recordset2.Fields.Item("openornot").Value = "open" then%>
    <td style="color:#00F">进行中</td>
    <% else%>
     <td style="color:#666">已关闭</td>
<%end if%>
    <td><div align="center">
      
      <form id="form2" name="form2" method="post" action="inforcount.asp" target="_blank">
        
        <input  type="submit" class = "GoStyle" name="button" id="button" value="查看统计信息" />
        
        
        <input type="hidden" id="ID" name="ID" value="<%=(Recordset2.Fields.Item("ID").Value)%>" />
        </form>
      
    </div>
      
      
    </td>  
    <td><div align="center">
      <form id="form3" name="form3" method="post" action="closecount.php"  onsubmit="return confirm2()"  target="_blank">
        
        <input  type="submit" class = "GoStyle" name="button" id="button" value="关闭/打开统计" />
        <input type="hidden" id="ID" name="ID" value="<%=(Recordset2.Fields.Item("ID").Value)%>" />
        
        </form>
    </div>
    </td> 
  </tr>
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset2.MoveNext()
Wend
%>
     </tbody>
   </table>
 </div>
 <script>
	   function confirm2()
	   {
		   if(confirm('确认改变统计状态吗？'))
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
Recordset2.Close()
Set Recordset2 = Nothing
%>
