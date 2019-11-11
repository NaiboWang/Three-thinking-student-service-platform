<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/mysql.asp" -->
<%
Dim Recordset2
Dim Recordset2_cmd
Dim Recordset2_numRows

Set Recordset2_cmd = Server.CreateObject ("ADODB.Command")
Recordset2_cmd.ActiveConnection = MM_mysql_STRING
Recordset2_cmd.CommandText = "SELECT * FROM student.infortable where ID>2 ORDER BY ID ASC" 
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
Recordset1_cmd.ActiveConnection = MM_mysql_STRING
Recordset1_cmd.CommandText = "SELECT * FROM 管理 WHERE 用户名 = ?" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 200, 1, 255, Recordset1__MMColParam) ' adVarChar

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>

<html>
<head>

<script charset="utf-8" src="../kindeditor.js"></script>
	<script charset="utf-8" src="../lang/zh-CN.js"></script>
	<script charset="utf-8" src="../plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="instruction"]', {
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
    

<script language="javascript" type="text/javascript">// Example: obj = findObj("image1"); 
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
		 
function findObj(theObj, theDoc) 
{ 
var p, i, foundObj; 
if(!theDoc) theDoc = document; 
if( (p = theObj.indexOf("?")) > 0 && parent.frames.length) 
{ 
theDoc = parent.frames[theObj.substring(p+1)].document; 
theObj = theObj.substring(0,p); 
} 
if(!(foundObj = theDoc[theObj]) && theDoc.all) 
foundObj = theDoc.all[theObj]; 
for (i=0; !foundObj && i < theDoc.forms.length; i++) 
foundObj = theDoc.forms[i][theObj]; 
for(i=0; !foundObj && theDoc.layers && i < theDoc.layers.length; i++) 
foundObj = findObj(theObj,theDoc.layers[i].document); 
if(!foundObj && document.getElementById) 
foundObj = document.getElementById(theObj); 
return foundObj; 
} 


//添加一行学习简历 
function LearnAddSignRow()
{ //读取最后一行的行号，存放在LearnTRLastIndex文本框中 
var LearnTRLastIndex = findObj("LearnTRLastIndex",document); 
var rowID = parseInt(LearnTRLastIndex.value); 
if(document.getElementById("nameofnature").value=="")
{
	alert("请输入属性名")
	return false;
}
var signFrame = findObj("LearnInfoItem",document); 
//添加行 
var newTR = signFrame.insertRow(signFrame.rows.length); 
newTR.id = "LearnItem" + rowID; 

//添加列:起讫时间 
var newNameTD=newTR.insertCell(0); 
newNameTD.align = "center"
//添加列内容 
newNameTD.innerHTML = "<input name='nameofnature[]' id='nameofnature" + rowID + "' type='text' class='inputStyle'  style='text-align:center;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE:none'  value = '"+document.getElementById("nameofnature").value+"' readonly = 'readonly' />"; 

//添加列:毕业院校 
var newNameTD=newTR.insertCell(1); 
newNameTD.align = "center"
//添加列内容 
if(document.getElementById("natureornot").checked){
  newNameTD.innerHTML = "<input name='natureornot[]' id='natureornot" + rowID + "' type='text' class='inputStyle' style='text-align:center;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE:none'  value = '加入学生基本属性' readonly = 'readonly' />";  
}
else
{
	newNameTD.innerHTML = "<input name='natureornot[]' id='natureornot" + rowID + "' type='text' class='inputStyle' style='text-align:center;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE:none'  value = '不加入学生基本属性' readonly = 'readonly' />";  
	}

//添加列:删除按钮 
var newDeleteTD=newTR.insertCell(2); 
//添加列内容 
newDeleteTD.innerHTML = "<div align='center'><input id='txtDel" + rowID + "' type='button' value='删除' onclick=\"LearnDeleteRow('LearnItem" + rowID + "')\" class='inputStyle' /></div>"; 

//将行号推进下一行 
document.getElementById("nameofnature").value="";
document.getElementById("natureornot").checked="";
LearnTRLastIndex.value = (rowID + 1).toString() ; 
} 
//删除指定行 
function LearnDeleteRow(rowid){ 
var signFrame = findObj("LearnInfoItem",document); 
var signItem = findObj(rowid,document); 

//获取将要删除的行的Index 
var rowIndex = signItem.rowIndex; 

//删除指定Index的行 
signFrame.deleteRow(rowIndex); 


} 
</script> 

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发起新统计</title>
</head>
<body>
<p align="center">&nbsp;</p>
<p align="center">您好，<%=(Recordset1.Fields.Item("名称").Value)%>！ <a href="<%= MM_Logout %>">注销</a></p>
<p align="center">——————————————————————————————————————</p>
<form name = "example" action="insertcount.php" method="post" target="_blank">
<p align="center">请输入统计名称：
  <label for="countname"></label>
  <input type="hidden" name="publisher" id="publisher" value="<%=(Recordset1.Fields.Item("名称").Value)%>">
  <input type="text" name="title" id="title"  style="width:300px">
</p>
<p align="center">
  <input name="tz[]" type="checkbox" id="tz" checked="CHECKED" style= "width:18px;height:18px" value="tz">
  <label for="tz"></label>
  同时在三思主页发布该统计的通知</p>
<p align="center">请输入统计说明（帮助学生完成统计，可以不写）</p>
<p align="center">
  <label for="instruction"></label>
  <textarea name="instruction" id="instruction" cols="110" rows="12">
  <div align="center"><span style="line-height:1.5;font-size:18px;font-family:'Microsoft YaHei';">统计截止时间：</span></div>
  </textarea>
</p>
<p align="center">——————————————————————————————————————</p>
<p align="center">需要最后导出的已有属性</p>
<p align="center">注：勾选“可被修改”选项后，学生可以修改该项信息，否则，该信息只读。</p>
<div align="center">
  <table width="500" border="0">
    <tr>
      <td>属性名</td>
      <td align="center">选项</td>
    </tr>
    
     <tr>
      <td><input value="sno" type="checkbox"  style= "width:18px;height:18px" checked="CHECKED" disabled = "disabled">
      学号</td>
      <td align="center"><input type="checkbox" disabled = "disabled" style="width:18px;height:18px"  value="sname">
        可被修改</td>
    </tr>
    <tr>
      <td><input type="checkbox" style= "width:18px;height:18px" checked="CHECKED" disabled = "disabled">
        姓名</td>
      <td align="center"><input type="checkbox"  disabled = "disabled" style="width:18px;height:18px">
      可被修改</td>
    </tr>
         <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset2.EOF)) 
%>
    <tr>
 
<td><input  name="checkbox[]" type="checkbox" id="<%=(Recordset2.Fields.Item("ID").Value)%>"  value="<%=(Recordset2.Fields.Item("title").Value)%>" style= "width:18px;height:18px" >
  <%=(Recordset2.Fields.Item("title").Value)%></td>
      <td align="center"><input name="checkbox2[]" type="checkbox" id="<%=(Recordset2.Fields.Item("ID").Value)%>" value="<%=(Recordset2.Fields.Item("title").Value)%>" style="width:18px;height:18px" >
        可被修改</td>
    </tr>
    <%  
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset2.MoveNext()
Wend
%>
  </table>
</div>
<p align="center">——————————————————————————————————————</p>
<p align="center">需要新加入的统计信息</p>
<p align="center">注：勾选“加入学生基本属性”后，该统计信息会出现在学生的个人基本属性中，以后统计时也可以直接在上方列表中选择。</p>
<p align="center">注：若要将此信息加入个人基本属性，则<strong>不得出现</strong>与已存在属性名称相同的属性名。</p>
<p align="center">注：一次统计中也<strong>不得出现</strong>两个相同的属性名。</p>
<p align="center">注：推荐使用三个字及以上的属性名。</p>
<p align="center">名称：
  <label for="nameofnature"></label>
  <input type="text" name="nameofnature" id="nameofnature">
</p><div style="opacity:0">
<p align="center">选项：
  <input style="width:18px;height:18px"  type="checkbox" name="natureornot" id="natureornot" readonly>
  <label for="natureornot"></label>
  加入学生基本属性</p></div>
<p align="center">
  <input name="add"  style="width:100px;height:40px" id="add" type="button" onClick="LearnAddSignRow()" value="添加属性">
  <input name='LearnTRLastIndex' type='hidden' id='LearnTRLastIndex' value="1" /> 

</p>

<table align="center" width="500"  border="1" id="LearnInfoItem"> 
  <tr > 
<td colspan="8" bgcolor="#96E0E2" style="height:30px;" ><h3 style="text-align:center; margin:0;">新增加统计信息</h3></td> 
</tr> 
<tr id="tr1"> 
<td align="center" class="tdStyle2">名称 </td> 

<td align="center" class="tdStyle2">选项</td> 

<td align="center" class="tdStyle2"> 
操作
</td> 

</tr> 
</table> 

<p align="center">——————————————————————————————————————</p>
<p align="center">
  <input name="add2"  style="width:200px;height:80px; font-size:24px" id="add2" type="submit" onClick="return confirm2()" value="提交">
</p>

</form>
</body>
</html><%
Recordset2.Close()
Set Recordset2 = Nothing
%>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
