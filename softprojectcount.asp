<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="Connections/data.asp" -->
<!--#include file="Connections/mysql.asp" -->
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "1"
If (Session("MM_Username")  <> "") Then 
  Recordset1__MMColParam = Session("MM_Username") 
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_data_STRING
Recordset1_cmd.CommandText = "SELECT [教学班], [姓名], [学号] FROM 身份信息（不可泄露） WHERE [学号] = ?" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 200, 1, 255, Recordset1__MMColParam) ' adVarChar

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<%
Dim Recordset2__MMColParam
Recordset2__MMColParam = "1"
If (Session("MM_Username") <> "") Then 
  Recordset2__MMColParam = Session("MM_Username")
End If
%>
<%
Dim Recordset2
Dim Recordset2_cmd
Dim Recordset2_numRows

Set Recordset2_cmd = Server.CreateObject ("ADODB.Command")
Recordset2_cmd.ActiveConnection = MM_mysql_STRING
Recordset2_cmd.CommandText = "SELECT sno, sname, groupno, tasktype, workcontent,softtype,leaderornot FROM student.softprojectcontent WHERE sno = ?" 
Recordset2_cmd.Prepared = true
Recordset2_cmd.Parameters.Append Recordset2_cmd.CreateParameter("param1", 200, 1, 20, Recordset2__MMColParam) ' adVarChar

Set Recordset2 = Recordset2_cmd.Execute
Recordset2_numRows = 0
%>

<%
Dim Recordset4
Dim Recordset4_cmd
Dim Recordset4_numRows

Set Recordset4_cmd = Server.CreateObject ("ADODB.Command")
Recordset4_cmd.ActiveConnection = MM_mysql_STRING
Recordset4_cmd.CommandText = "SELECT sno FROM student.softprojectcontent WHERE sno = '"&Recordset1.Fields.Item("学号").Value &"' and leaderornot = '组长'" 
Recordset4_cmd.Prepared = true
Recordset4_cmd.Parameters.Append Recordset4_cmd.CreateParameter("param1", 200, 1, 255, Recordset4__MMColParam) ' adVarChar

Set Recordset4 = Recordset4_cmd.Execute
Recordset4_numRows = 0
%>
<%
Dim Recordset5
Dim Recordset5_cmd
Dim Recordset5_numRows

Set Recordset5_cmd = Server.CreateObject ("ADODB.Command")
Recordset5_cmd.ActiveConnection = MM_mysql_STRING
Recordset5_cmd.CommandText = "select count(*) as num from softprojectcontent where groupno ="& Recordset2.Fields.Item("groupno").Value
Recordset5_cmd.Prepared = true
Recordset5_cmd.Parameters.Append Recordset5_cmd.CreateParameter("param1", 200, 1, 255, Recordset5__MMColParam) ' adVarChar

Set Recordset5 = Recordset5_cmd.Execute
Recordset5_numRows = 0
%>



<%
Dim Recordset3__MMColParam
Recordset3__MMColParam = "1"
If (Session("groupno") <> "") Then 
  Recordset3__MMColParam = Recordset2.Fields.Item("groupno").Value
End If
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
Recordset3_numRows = Recordset3_numRows + Repeat1__numRows
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>软件工程大作业</title>
</head>
<body>
<script>
function F_Select(select) 
{ 

   for(iIndex=0;iIndex <select.length;iIndex++) 
        { 
                  if(select.options[iIndex].selected) 
                  { 
					  if(select.options[iIndex].value=='主题爬虫') 
								  { 
			  document.getElementById('choice13').checked=true;
								  } 
								  if(select.options[iIndex].value=='公交路线查询') 
								  { 
			  document.getElementById('choice14').checked=true;
								  } 
								  if(select.options[iIndex].value=='科研成果申报') 
								  { 
			  document.getElementById('choice15').checked=true;
								  } 
								  
                              if(select.options[iIndex].value==4) 
                              { 
          document.getElementById('LTime').style.display="";
                              } 
							  else
							  {
								  document.getElementById('LTime').style.display="none";
								  }
                              
                  }                   
        } 
} 
		function myCheck2()
            {
					if(document.getElementById('addsno').value=="")
					{
						
						alert("学号不能为空");
			  	return false;
						}
					if(document.getElementById('addcontent').value=="")
					{
						
						alert("请输入负责内容");
			  	return false;
						}
						  if(confirm('确认增加组员吗？'))
				   return true;
					else
				   return false;
						
			}
		
		
		
		
		  function myCheck(select)
            {
					var NowNum = document.getElementById('content').value.length;
				if(NowNum<10)
				{
					alert("请给老师提至少10字以上的建议，谢谢。");
				return false;
					
					}
					
				for(iIndex=0;iIndex <select.length;iIndex++) 
        { 
                  if(select.options[iIndex].selected) 
                  { 
                              if(select.options[iIndex].value==4) 
                              { 
       if(document.getElementById('zzxt').value=="")
	   		{
				alert("自主选题请填写题目！");
				return false;
				}
                              }      
                  }                   
        } 

				
				var i = 0;
				if(document.getElementById('sno1').value==document.getElementById('sno2').value&&document.getElementById('sno1').value!=""||document.getElementById('sno1').value==document.getElementById('sno3').value&&document.getElementById('sno1').value!=""||document.getElementById('sno1').value==document.getElementById('sno4').value&&document.getElementById('sno1').value!=""||document.getElementById('sno1').value==document.getElementById('sno5').value&&document.getElementById('sno1').value!=""||document.getElementById('sno1').value==document.getElementById('sno6').value&&document.getElementById('sno1').value!=""||document.getElementById('sno2').value==document.getElementById('sno3').value&&document.getElementById('sno2').value!=""||document.getElementById('sno2').value==document.getElementById('sno4').value&&document.getElementById('sno2').value!=""||document.getElementById('sno2').value==document.getElementById('sno5').value&&document.getElementById('sno2').value!=""||document.getElementById('sno2').value==document.getElementById('sno6').value&&document.getElementById('sno2').value!=""||document.getElementById('sno3').value==document.getElementById('sno4').value&&document.getElementById('sno3').value!=""||document.getElementById('sno3').value==document.getElementById('sno5').value&&document.getElementById('sno3').value!=""||document.getElementById('sno3').value==document.getElementById('sno6').value&&document.getElementById('sno3').value!=""||document.getElementById('sno4').value==document.getElementById('sno5').value&&document.getElementById('sno4').value!=""||document.getElementById('sno4').value==document.getElementById('sno6').value&&document.getElementById('sno4').value!=""||document.getElementById('sno5').value==document.getElementById('sno6').value&&document.getElementById('sno5').value!="")
				i = -10;
				
              	if(document.getElementById('sno1').value!="")
				i++;
				if(document.getElementById('sno2').value!="")
				i++;
				if(document.getElementById('sno3').value!="")
				i++;
				if(document.getElementById('sno4').value!="")
				i++;
				if(document.getElementById('sno5').value!="")
				i++;
				if(document.getElementById('sno6').value!="")
				i++;
				
				k=0;
				
				if(document.getElementById('worktype').value!="")
				k++;
				if(document.getElementById('worktype2').value!="")
				k++;
				if(document.getElementById('worktype3').value!="")
				k++;
				if(document.getElementById('worktype4').value!="")
				k++;
				if(document.getElementById('worktype5').value!="")
				k++;
				if(document.getElementById('worktype6').value!="")
				k++;
				
		
				if(k<i)
				{
					alert("请填写完整每个组员应负责的内容。");
			  	return false;
					
					}
				j=0;
				if(document.getElementById('choice1').checked==true)
					j++;
				if(document.getElementById('choice3').checked==true)
					j++;
				if(document.getElementById('choice5').checked==true)
					j++;
				if(document.getElementById('choice7').checked==true)
					j++;
					if(document.getElementById('choice9').checked==true)
					j++;
					if(document.getElementById('choice11').checked==true)
					j++;
						

				
				if(j==0)
				{
					alert("一个组应该有一个组长。");
			  	return false;
					}
					else if(j>1)
					{
						alert("一个组只应该有一个组长。");
			  	return false;
						}
						
	
				if(i<0)
				{
					 alert("同一学号不可重复填写！");
			  	return false;
					}
              else if(i==0)
			  {
				  alert("请填写至少一个人的信息！");
			  	return false;
			  }
			  else
			  {
				  if(confirm('确认提交信息吗？'))
				   return true;
					else
				   return false;
				  }
			 
            }
			
			
</script>
<p><%=(Recordset1.Fields.Item("姓名").Value)%>同学，欢迎你！</p>
<% if Recordset2.Fields.Item("groupno").Value = 0 then %>
<form  id="form1" name="form1" method="post" action="softsubmit.php" onsubmit="return myCheck(choice)">
  <div align="center">
    <p ><div style=" font-size:25px">软件工程大作业统计</div></p>
    <p>选题类型：
      <label for="choice"></label>
      <select name="choice" id="choice" onchange="F_Select(this)">
        <option value="主题爬虫" selected="selected">主题爬虫</option>
        <option value="公交路线查询">公交路线查询</option>
        <option value="科研成果申报">科研成果申报</option>
        <option value="4">自主选题</option>
      </select> 
    </p>
    <p><span  id="LTime" style= "display:none;">自主选题题目： 
      <input   type=text name = "zzxt" id = "zzxt" />
    </span></p>
     <p>&nbsp;</p>
    <table width="800" border="1">
       <tr>
         <td   colspan="3"><div align="center">采用形式：</div></td>
         <td width="592">
              
       <input name="xs" type="radio" id="choice13" value="电脑软件" checked="checked" />
       电脑软件
       <label for="choice13"></label>
<input name="xs" type="radio" id="choice14" value="手机APP" />
手机APP
<label for="choice14"></label>
     <input name="xs" type="radio" id="choice15" value="网站" />
     网站
     <input name="xs" type="radio" id="choice16" value="嵌入式系统" />
     嵌入式系统
     <input name="xs" type="radio" id="choice17" value="微信开发" />
     微信开发 </td>
      </tr>
    </table>
    <table width="800" border="1">
       <tr>
         <td height="37" colspan="4"><div align="center"><strong>组内成员基本信息（有几个人就填几个，无须姓名）</strong></div></td>
      </tr>
       <tr>
         <td width="109" height="23"><div align="center">组员</div></td>
         <td width="189"><div align="center">学号</div></td>
         <td width="172"><div align="center">类别</div></td>
         <td width="302" height="23"><div align="center">负责内容（例如“网站XX模块开发”）</div></td>
       </tr>
        <tr>
         <td width="109" height="23"><div align="center">成员1</div></td>
         <td width="189"><div align="center">
         <label for="sno1"></label>
             <input name="sno1" type="text" id="sno1" value="<%=(Recordset1.Fields.Item("学号").Value)%>"/>
         </div></td>
         <td width="172"><div align="center">
    <input name="cho1" type="radio" id="choice1" value="组长" checked="checked" />
组长
<label for="choice1"></label>
<input name="cho1" type="radio" id="choice2" value="组员" />
组员
<label for="choice2"></label>
         </div></td>
         <td width="302" height="23"><div align="center">
             <label for="worktype"></label>
             <input name="worktype" type="text" id="worktype" value="" />
         </div></td>
       </tr>
        <tr>
         <td width="109" height="23"><div align="center">成员2</div></td>
         <td width="189"><div align="center">
         <label for="sno7"></label>
             <input type="text" name="sno2" id="sno2" />
         </div></td>
         <td width="172"><div align="center">
    <input type="radio" name="cho2" id="choice3" value="组长" />
组长
<label for="choice3"></label>
<input name="cho2" type="radio" id="choice4" value="组员" checked="checked" />
组员
<label for="choice4"></label>
         </div></td>
         <td width="302" height="23"><div align="center">
             <label for="worktype"></label>
             <input name="worktype2" type="text" id="worktype2" value=""   />
         </div></td>
       </tr>
        <tr>
         <td width="109" height="23"><div align="center">成员3</div></td>
         <td width="189"><div align="center">
         <label for="sno8"></label>
             <input type="text" name="sno3" id="sno3" />
         </div></td>
         <td width="172"><div align="center">
    <input type="radio" name="cho3" id="choice5" value="组长" />
组长
<label for="choice5"></label>
<input name="cho3" type="radio" id="choice6" value="组员" checked="checked" />
组员
<label for="choice6"></label>
         </div></td>
         <td width="302" height="23"><div align="center">
             <label for="worktype"></label>
             <input name="worktype3" type="text" id="worktype3" value=""  />
         </div></td>
       </tr>
        <tr>
         <td width="109" height="23"><div align="center">成员4</div></td>
         <td width="189"><div align="center">
         <label for="sno9"></label>
             <input type="text" name="sno4" id="sno4" />
         </div></td>
         <td width="172"><div align="center">
           <input type="radio" name="cho4" id="choice7" value="组长" />
组长
<label for="choice7"></label>
<input name="cho4" type="radio" id="choice8" value="组员" checked="checked" />
组员
<label for="choice8"></label>
         </div></td>
         <td width="302" height="23"><div align="center">
         <label for="worktype"></label>
             <input name="worktype4" type="text" id="worktype4" value=""  />
         </div></td>
       </tr>
        <tr>
         <td width="109" height="23"><div align="center">成员5</div></td>
         <td width="189"><div align="center">
         <label for="sno11"></label>
             <input type="text" name="sno5" id="sno5" />
         </div></td>
         <td width="172"><div align="center">
    <input type="radio" name="cho5" id="choice9" value="组长" />
组长
<label for="choice9"></label>
<input name="cho5" type="radio" id="choice10" value="组员" checked="checked" />
组员
<label for="choice10"></label>
         </div></td>
         <td width="302" height="23"><div align="center">
             <label for="worktype"></label>
             <input name="worktype5" type="text" id="worktype5" value="" />
         </div></td>
       </tr>
       <tr>
         <td width="109" height="23"><div align="center">成员6</div></td>
         <td width="189"><div align="center">
         <label for="sno12"></label>
             <input type="text" name="sno6" id="sno6" />
         </div></td>
         <td width="172"><div align="center">
    <input type="radio" name="cho6" id="choice11" value="组长" />
组长
<label for="choice11"></label>
<input name="cho6" type="radio" id="choice12" value="组员" checked="checked" />
组员
<label for="choice12"></label>
         </div></td>
         <td width="302" height="23"><div align="center">
           <label for="worktype"></label>
             <input name="worktype6" type="text" id="worktype6" value=""  />
         </div></td>
       </tr>
       
    </table>
    <table width="800" border="1">
    <tr><td width="145" height="79"><div align="center">给王静老师提点建设性建议(老师看不到谁给她留的言)
    </div></td>
      <td width="639"><div align="center">
        <textarea cols="100px" rows="10" id="content" name="content"></textarea>
      </div></td>
    </tr>
    </table>
    <p>&nbsp;</p>
    <p>
      <input type="submit" name="submit" id="submit" value="提交" />
      <input type="reset" name="reset" id="reset" value="重置" />
    </p>
    <p></p>
  </div>
</form>
<p>
  <%else%>
</p>
<%
Dim Recordset3
Dim Recordset3_cmd
Dim Recordset3_numRows

Set Recordset3_cmd = Server.CreateObject ("ADODB.Command")
Recordset3_cmd.ActiveConnection = MM_mysql_STRING
Recordset3_cmd.CommandText = "SELECT * FROM student.softprojectcontent WHERE groupno = " & Recordset2.Fields.Item("groupno").Value &" order by leaderornot desc"
Recordset3_cmd.Prepared = true
Recordset3_cmd.Parameters.Append Recordset3_cmd.CreateParameter("param1", 5, 1, -1, Recordset3__MMColParam) ' adDouble

Set Recordset3 = Recordset3_cmd.Execute
Recordset3_numRows = 0
%>





<div style=" font-size:25px">
  <div align="center">软件工程大作业基本信息</div>
</div>
<p align="center">选择题目：<%=(Recordset2.Fields.Item("tasktype").Value)%>
</p>
	<p align="center">开发形式：<%=(Recordset2.Fields.Item("softtype").Value)%>
    
    </p>
	<div align="center"><strong>组内基本情况</strong></div>
  <div align="center">
      <table width="836" border="1">
        <tr>
          <th width="186" scope="col">学号</th>
          <th width="115" scope="col">姓名</th>
          <th width="363" scope="col">负责内容</th>
          <th width="148" scope="col">职务</th>
        </tr>
        
        <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset3.EOF)) 
%>
        <tr>
          <th width="178" scope="col"><%=(Recordset3.Fields.Item("sno").Value)%></th>
          <th width="107" scope="col"><%=(Recordset3.Fields.Item("sname").Value)%></th>
          <th width="346" scope="col"><%=(Recordset3.Fields.Item("workcontent").Value)%></th>
          <th width="180" scope="col"><%=(Recordset3.Fields.Item("leaderornot").Value)%></th>
        </tr>
        <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset3.MoveNext()
Wend
%>
      </table>
      <script language="javascript" type="text/javascript">
function dele()
			{
				if(confirm('确认退出该组吗？'))
				{
					document.getElementById("formid").submit();
				}
				
				}
				
      </script>
  </div>
</div>
<form id="formid" action="deletesoft.php" method="post" >
  <div align="center">
    <input name="sno" type="hidden" value="<%=(Recordset2.Fields.Item("sno").Value)%>" />
    <input name="groupo" type="hidden" value="<%=(Recordset2.Fields.Item("groupno").Value)%>" />
    <input name="type" type="hidden" value="<%=(Recordset2.Fields.Item("leaderornot").Value)%>" />
  </div>
</form>	
					
<p align="center">您可以：<a href="javascript:dele();">退出该组</a>（组长退出整组将解散）</p>
<p>
  <%
Recordset3.Close()
Set Recordset3 = Nothing
%>


  <% If Not Recordset4.EOF Or Not Recordset4.BOF Then %>
  <div align="center">
      <p>&nbsp;</p>
      <p>您是组长，请在下方添加组员。</p>
      <p>您的组内现在有<%=(Recordset5.Fields.Item("num").Value)%>人，您还可以再添加<%Response.Write(6-CInt((Recordset5.Fields.Item("num").Value)))%>人。</p>
      <p>
       <% If 6-CInt((Recordset5.Fields.Item("num").Value)) >0 Then %>
      <p>—————————————————————————————————————
    <form action="addsoftcount.php" method="post" onsubmit="return myCheck2()">
      <p>学号：  
          <label for="addsno"></label>
          <input type="text" name="addsno" id="addsno" />
         &nbsp;&nbsp;&nbsp;&nbsp; 负责内容：
<label for="addcontetn"></label>
          <input type="text" name="addcontent" id="addcontent" />
        </p>
        <p>————————————————————————————————————— </p>
        <p> 
          <input type="submit" name="button" id="button" value="添加" />
          <input type="reset" name="button2" id="button2" value="重置" />
          <input name="groupno" type="hidden" value="<%=(Recordset2.Fields.Item("groupno").Value)%>" />
          <input name="tasktype" type="hidden" value="<%=(Recordset2.Fields.Item("tasktype").Value)%>" />
           <input name="softtype" type="hidden" value="<%=(Recordset2.Fields.Item("softtype").Value)%>" />
        </p>
        <p>&nbsp;</p>
      </form>
       
       <%end if%>
      <br />
      </p>
    </div>
    <% End If ' end Not Recordset1.EOF Or NOT Recordset1.BOF %>
</p>
<p>
  <%end if%>
</p>
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
Recordset4.Close()
Set Recordset4 = Nothing
%>
<%
Recordset5.Close()
Set Recordset5 = Nothing
%>
