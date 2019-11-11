<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file = "loginconfirm.asp"-->
<%
MM_Logout = CStr(Request.ServerVariables("URL")) & "?MM_Logoutnow=1"
If (CStr(Request("MM_Logoutnow")) = "1") Then
  Session.Contents.Remove("MM_Username")
  Session.Contents.Remove("MM_UserAuthorization")
  MM_logoutRedirectPage = "scorelogin.asp"
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
<!--#include file="Connections/mysql.asp" -->
<%
Set Command111 = Server.CreateObject ("ADODB.Command")
Command111.ActiveConnection = MM_tj_STRING
Command111.CommandText = "INSERT INTO 留言 (账号,IP, 类型, 时间)  VALUES ('"& session("MM_username") & "',' "  & request.servervariables("remote_addr")  & "','scorecontentmobile','" & year(Now) & "-" & Month(Now) & "-" & day(Now) & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now) & "' ) "
Command111.CommandType = 1
Command111.CommandTimeout = 0
Command111.Prepared = true
Command111.Execute()

%>

<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "1"
If (Session("MM_Username") <> "") Then 
  Recordset1__MMColParam = Session("MM_Username")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_mysql_STRING
Recordset1_cmd.CommandText = "SELECT * FROM 身份信息（不可泄露） WHERE 学号 = ?" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 200, 1, 255, Recordset1__MMColParam) ' adVarChar

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<%
Dim Recordset2
Dim Recordset2_cmd
Dim Recordset2_numRows

Set Recordset2_cmd = Server.CreateObject ("ADODB.Command")
Recordset2_cmd.ActiveConnection = MM_mysql_STRING
Recordset2_cmd.CommandText = "SELECT * FROM student.方向配置 WHERE 方向名 = '"& Recordset1.Fields.Item("培养方向").Value &"' and 年级 = '" & Recordset1.Fields.Item("年级").Value &"'" 
Recordset2_cmd.Prepared = true

Set Recordset2 = Recordset2_cmd.Execute
Recordset2_numRows = 0
%>
<%
Dim Recordset3
Dim Recordset3_cmd
Dim Recordset3_numRows

Set Recordset3_cmd = Server.CreateObject ("ADODB.Command")
Recordset3_cmd.ActiveConnection = MM_mysql_STRING
Recordset3_cmd.CommandText = "SELECT 课程.课程号, 课程名, 类型, 学分, 学期, 成绩 FROM 课程, 成绩 WHERE 课程.课程号 = 成绩.课程号 and 学号 = '" & Session("MM_Username") & "' ORDER BY  学期,课程.课程号" 
Recordset3_cmd.Prepared = true

Set Recordset3 = Recordset3_cmd.Execute
Recordset3_numRows = 0
%>
<%
Dim Recordset4__MMColParam
Recordset4__MMColParam = "1"
If (Session("MM_Username") <> "") Then 
  Recordset4__MMColParam = Session("MM_Username")
End If
%>
<%
Dim Recordset4
Dim Recordset4_cmd
Dim Recordset4_numRows

Set Recordset4_cmd = Server.CreateObject ("ADODB.Command")
Recordset4_cmd.ActiveConnection = MM_mysql_STRING
Recordset4_cmd.CommandText = "SELECT * FROM 加权平均分 WHERE 学号 = ?" 
Recordset4_cmd.Prepared = true
Recordset4_cmd.Parameters.Append Recordset4_cmd.CreateParameter("param1", 200, 1, 255, Recordset4__MMColParam) ' adVarChar

Set Recordset4 = Recordset4_cmd.Execute
Recordset4_numRows = 0
%>

<%
Dim Repeat1__numRows
Dim Repeat1__index
Dim Repeat_num
Repeat_num=0
Repeat1__numRows = -1
Repeat1__index = 0
Recordset3_numRows = Recordset3_numRows + Repeat1__numRows
%>


<!DOCTYPE html>
<html>
<head>
<title>三思-个人成绩</title>
<style>  
<!--  
.datalist{  
    border:1px solid #0058a3;   /* 表格边框 */  
    font-family:Arial;  
    border-collapse:collapse;   /* 边框重叠 */  
    background-color:#eaf5ff;   /* 表格背景色 */  
    font-size:14px;  
}  
.datalist caption{  
    padding-bottom:5px;  
    font:bold 1.4em;  
    text-align:left;  
}  
.datalist th{  
    border:1px solid #0058a3;   /* 行名称边框 */  
    background-color:#4bacff;   /* 行名称背景色 */  
    color:#FFFFFF;              /* 行名称颜色 */  
    font-weight:bold;  
    padding-top:4px; padding-bottom:4px;  
    padding-left:12px; padding-right:12px;  
    text-align:center;  
}  
.datalist td{  
    border:1px solid #0058a3;   /* 单元格边框 */  
    text-align:left;  
    padding-top:4px; padding-bottom:4px;  
    padding-left:10px; padding-right:10px;  
}  

.datalist tr.altrow{  
    background-color:#c7e5ff;   /* 隔行变色 */  
}  
-->  
</style>  

<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href='css/fonts1.css' rel='stylesheet' type='text/css'>
<link href='css/fonts2.css' rel='stylesheet' type='text/css'>
<!-- js -->
<script src="js/jquery.min.js"></script>
<!-- //js -->
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Bizz Wow Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
</head>
	
<body>
	<div class="psd">
    
    
<div class="container">
<!-- header -->
		<div class="header">
        	
			<div class="logo">
				<a href="scoreindexmobile.asp"><img src="images/logo.png"  style="min-height:30px; min-width:115px" width=45% height=20% alt=" " /></a>
          <div class="infor"  style="width:1000px;text-align:left;font-size:150%; background-size:cover; letter-spacing:-3px;font-weight:600;"> <% if Recordset1.Fields.Item("性别").Value = "女" then%>
          <img src="images/userfemale.png" width="32" height="32" />
             <% else %>
          <img src="images/user.png" width="32" height="32" />
             <%end if%>
			 <%=(Recordset1.Fields.Item("姓名").Value)%>同学，欢迎你！ </div></div> 
          <div class="logo-right">
				<span class="menu"><img src="images/menu.png" alt=" "/></span>
				<ul class="nav1">
					<li ><a href="scoreindexmobile.asp" class="act">主页</a></li>
					<li><a href="ttinformationmobile.asp" class="act1">个人信息</a></li>
					<li><a href="ttnoticemobile.asp" class="act2">通知信息</a></li>
					<li class="cap"><a href="scorecontentmobile.asp" class="act3">成绩相关</a></li>
					<li><a href="scoredocumentmobile.asp" class="act4">事务管理</a></li>
                    <li><a href="tttextmobile.asp" class="act5">系统相关</a></li>
				</ul>
			</div>
             <div class="clearfix"> </div>
				<!-- script for menu --> 
		  <script> 
						$( "span.menu" ).click(function() {
						$( "ul.nav1" ).slideToggle( 300, function() {
						 // Animation complete.
						});
						});
					</script>
				<!-- //script for menu -->
		</div>
<!-- //header -->

<div class="submit" style="max-width:400px"><input type="submit" style="border-color:#E7E7E7; background:#E7E7E7; border-style:solid" value="成绩信息" ><input type="submit"  style="border-color:#111;color:#FFF; background:#3d279a; border-style:solid" onClick="window.location=('scorerankmobile.asp');" value="排名证明"></div>
<div class="port"  style="font:'楷体'">
 <h3>成绩信息声明</h3>
		<p class="para">1、本系统提供的所有数据只作参考，如有和教务处成绩不一致的地方，以教务处成绩为准。<span></span></p>
		<p class="para">2、加权平均分计算方法：您在下方看到课程的成绩×学分之和÷所有学分总和。</p>
		<p class="para">3、根据所有<%=(Recordset1.Fields.Item("培养方向").Value)%>方向同学平均分，排出您的位次，计算百分比：位次/总人数*100%。</p>
<p class="para"><img src="hr-geo-sukarno-1s960x639.png"  style="  position:relative; left:2%;background-size:cover; background-position:center; width:90%;height:90%" alt=""/>
		</p>
<div class="portfolio-grids">
			     <div class="view view-ninth">
                   <div class="content" align="center">
                    <table class="datalist"  align="center" summary="list of members in EE Studay">  
    <h3>个人成绩基本信息</h3> 
   <h4>继续声明：此成绩和位次为大学期间的<strong>裸分</strong>成绩，不包含加分，不是最终计算保研的最终成绩，且所有未通过科目均按60分计算，实际成绩与此成绩有略微的偏差，各个专业及方向的人数也会与实际人数有3%左右的偏差，请注意。</h4>

    <tr  class="altrow">                  <!-- 奇数行 -->  
        <td><i class="glyphicon glyphicon-pencil"></i>学号</td>  
        <td><%=(Recordset1.Fields.Item("学号").Value)%></td>  
        <td><i class="glyphicon glyphicon-star">大学期间加权平均分</td>  
        <td><%=(Recordset4.Fields.Item("加权平均分").Value)%></td>  
    </tr>  
    <tr>       <!-- 偶数行 -->  
        <td><i class="glyphicon glyphicon-user">姓名</td>  
        <td><%=(Recordset1.Fields.Item("姓名").Value)%></td>  
        <td><i class="glyphicon glyphicon-sort-by-order"></i>大学期间成绩在计算机学院<%=(Recordset1.Fields.Item("培养方向").Value)%>方向位次</td>  
        <td><%=(Recordset4.Fields.Item("位次").Value)%>/<%=(Recordset2.Fields.Item("人数").Value)%>（总人数）</td>  
    </tr>  
     <tr  class="altrow">                  <!-- 奇数行 -->  
        <td><i class="glyphicon glyphicon-leaf"></i>专业</td>  
        <td><%=(Recordset1.Fields.Item("培养方向").Value)%></td>
          <td><i class="glyphicon glyphicon-stats">大学期间成绩在计算机学院<%=(Recordset1.Fields.Item("培养方向").Value)%>方向中占的百分比</td>  
        <td id="sbfb"></td>
	<script>
         var a = parseFloat("<%=(Recordset4.Fields.Item("位次").Value)%>");
		 var b = parseFloat("<%=(Recordset2.Fields.Item("人数").Value)%>");
		 var bfb = a/b*100;
		 bfb = bfb.toFixed(2) + "%";
		 jQuery("#sbfb").append(bfb);
	</script>
    </tr>  
    
     
</table>
                  

                   </div>
  <p></p>
      <div class="view view-ninth">
        <div class="content" align="center">
             <table class="datalist"   style="margin:auto"align="center" summary="list of members in EE Studay">  
             <p></p>
             <p></p>
 <h3 >个人主干课程成绩单</h3>
    <tr style="font-family:'微软雅黑'; font-weight:500">  
        <th scope="col">课程号</th>  
        <th scope="col">课程名</th>  
        <th scope="col">课程类型</th>  
        <th scope="col">学分</th>  
        <th scope="col">学期</th> 
        <th scope="col">成绩</th>  
    </tr>
     
     
    
    <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset3.EOF)) 
%>
<% if Repeat1__numRows mod 2 <>0 then%>
<tr align="center">                  <!-- 奇数行 -->  
        <td style="text-align:center"><%=(Recordset3.Fields.Item("课程号").Value)%></td> 
        <td style="text-align:center"><%=(Recordset3.Fields.Item("课程名").Value)%></td> 
        <td style="text-align:center"><%=(Recordset3.Fields.Item("类型").Value)%></td> 
        <td style="text-align:center"><%=(Recordset3.Fields.Item("学分").Value)%></td> 
        <td style="text-align:center"><%=(Recordset3.Fields.Item("学期").Value)%></td> 
        <td style="text-align:center"><%=(Recordset3.Fields.Item("成绩").Value)%></td> 
    </tr>  
  <%else%>
    <tr class="altrow">       <!-- 偶数行 -->  
        <td style="text-align:center"><%=(Recordset3.Fields.Item("课程号").Value)%></td> 
        <td style="text-align:center"><%=(Recordset3.Fields.Item("课程名").Value)%></td> 
        <td style="text-align:center"><%=(Recordset3.Fields.Item("类型").Value)%></td> 
        <td style="text-align:center"><%=(Recordset3.Fields.Item("学分").Value)%></td> 
        <td style="text-align:center"><%=(Recordset3.Fields.Item("学期").Value)%></td> 
        <td style="text-align:center"><%=(Recordset3.Fields.Item("成绩").Value)%></td> 
    </tr>
     <%end if%>
  <% 
  Repeat_num = Repeat_num + Recordset3.Fields.Item("学分").Value
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset3.MoveNext()
Wend
%>
           </table>        
   <p align="right" style="position:relative;left:-200px"> 共修读主干课程数：<%response.Write(Repeat1__index)%>，共修读学分：<%response.Write(Repeat_num)%>。</p>

  </div>
	</div>

  </div>
   
</div>
   <div class="footer">
		<div class="footer-left">
			<ul>
				<li><a href="about.asp" target="_blank"><img src="images/logo1.png"  width="150" height="45" alt=" " /></a><span> |</span></li>
				<li> <p>Copyright <%=year(now())%> <a href="http://www.three-thinking.com" target="_blank" title="三思" style="color:#FFFFFF">三思</a> 版权所有||<a href="about.asp" target="_blank" title="三思" style="color:#FFFFFF">关于三思</a>||@<a href="http://www.xidian.edu.cn/" style="color:#FFFFFF" target="_blank">西安电子科技大学 </a>threethinking版权所有|陕ICP备16002727号|<a href="http://www.miitbeian.gov.cn/" style="color:#FFFFFF" target="_blank" title="三思">工信部主页</a> </p></li>
                
			</ul>
		</div>
		<div class="clearfix"> </div>
</div> 
<!-- //here ends scrolling icon -->
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
