<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/data.asp" -->
<!--#include file = "loginconfirm.asp"-->
<!--#include file="Connections/mysql.asp" -->
<!--#include file="Connections/tj.asp" -->
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







<%
Set Command111 = Server.CreateObject ("ADODB.Command")
Command111.ActiveConnection = MM_tj_STRING
Command111.CommandText = "INSERT INTO 留言 (账号,IP, 类型, 时间)  VALUES ('"& session("MM_username") & "',' "  & request.servervariables("remote_addr")  & "','documentmobile','" & year(Now) & "-" & Month(Now) & "-" & day(Now) & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now) & "' ) "
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
Dim Recordset3
Dim Recordset3_cmd
Dim Recordset3_numRows

Set Recordset3_cmd = Server.CreateObject ("ADODB.Command")
Recordset3_cmd.ActiveConnection = MM_mysql_STRING
Recordset3_cmd.CommandText = "SELECT * FROM student.countinfor WHERE openornot = 'open' order by ID desc" 
Recordset3_cmd.Prepared = true

Set Recordset3 = Recordset3_cmd.Execute
Recordset3_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 10
Repeat1__index = 0
Recordset3_numRows = Recordset3_numRows + Repeat1__numRows
%>
<!DOCTYPE html>
<html>
<head>
<title>三思-事务信息管理</title>
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
<link rel="stylesheet" type="text/css" href="css/style_common.css" />
<link rel="stylesheet" type="text/css" href="css/style9.css" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href='fontscontent.css' rel='stylesheet' type='text/css'>
<link href='fontscontent2.css' rel='stylesheet' type='text/css'>
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
             <%end if%><%=(Recordset1.Fields.Item("姓名").Value)%>同学，欢迎你！ </div></div> 
          <div class="logo-right">
				<span class="menu"><img src="images/menu.png" alt=" "/></span>
				<ul class="nav1">
					<li ><a href="scoreindexmobile.asp" class="act">主页</a></li>
					<li><a href="ttinformationmobile.asp" class="act1">个人信息</a></li>
					<li><a href="ttnoticemobile.asp" class="act2">通知信息</a></li>
					<li><a href="scorecontentmobile.asp" class="act3">成绩相关</span></a></li>
					<li class="cap"><a href="" class="act4">事务管理</a></li>
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
<div class="port"  style="font:'楷体'">
  <h3>个人事务处理</h3>
		<p class="para">这里有学校、学院等发布的最新各项事务，请根据您的个人情况来选择相应的事务o(∩_∩)o <span></span></p>
   <img src="hr-geo-sukarno-1s960x639.png"  style="  position:relative; left:2%;background-size:cover; background-position:center; width:90%;height:90%" alt=""/>
	<div class="portfolio-grids">
	  <div align="center">
	    <table width="80%" height="443">
	      <tr>
	        <td width="36%" rowspan="2"><table width="95%"  height="97.5%" border="1" bordercolor="#D4D4D4">
	          <tr>
	            <td height="40" bgcolor="#4472c4" bordercolor="#4472c4"><div align="center" style="color:#EEE"><strong><font face="楷体" size="+1">学校事务</font></strong></div></td>
	            </tr>
	          <tr valign="top">
	            <td >
                 <div style=" width:100% ; padding-left:10px">
                <br/>
                <a href="http://10.168.55.50:8088/searchWeb/Login.aspx" target="_blank"><font size="+1" face="楷体"> • 水电费查询</font></a><br/>
                <a href="http://zyzfw.xidian.edu.cn/site/index" target="_blank"><font size="+1" face="楷体"> • 校园网流量查询</font></a><br/>
                <a href="http://jwxt.xidian.edu.cn" target="_blank"><font size="+1" face="楷体"> • 教务系统</font></a><br/>
                <a href="http://jwc.xidian.edu.cn" target="_blank"><font size="+1" face="楷体"> • 西电教务处</font></a><br/>
                <a href="http://yz.xidian.edu.cn/" target="_blank"><font size="+1" face="楷体"> • 西电研究生招生网</font></a><br/>
                <a href="http://cs.xidian.edu.cn" target="_blank"><font size="+1" face="楷体"> • 西电计算机学院</font></a><br/>
                
                 <a href="http://ce.xidian.edu.cn/" target="_blank"><font size="+1" face="楷体"> • 西电网络与信息安全技术学院</font></a><br/>
                  <a href="http://sc.xidian.edu.cn" target="_blank"><font size="+1" face="楷体">• 西电软件学院</font></a><br/>
                   </div>
</td>
	            </tr>
            </table></td>
	        <td width="64%" height="240"><table width="95%"  height="95%"  border="1" bordercolor="#D4D4D4">
	          <tr>
	            <td height="40" bgcolor="#4472c4" bordercolor="#4472c4"><div align="center" style="color:#EEE"><strong><font face="楷体" size="+1">学院事务</font></strong></div></td>
	            </tr>
	          <tr valign="top">
	            <td>
                <div style=" width:100% ; padding-left:10px">
                <br/><a href="queryteacher.asp" target="_blank"><font size="+1" face="楷体"> • 学院教师信息查询</font></a><br/>
                <a href="http://222.25.176.4:8080" target="_blank"><font size="+1" face="楷体"> • 事务管理系统</font></a><br/>
                <a href="summercamp.php?lx=1&sx=0" target="_blank"><font size="+1" face="楷体"> • 计算机类夏令营信息汇总</font></a><br/>
                     <a href="news.asp" target="_blank"> <font size="+1" face="楷体">• 西电导师信息汇总</font></a><br/>
                     <a href="http://222.25.176.4/" target="_blank"><font size="+1" face="楷体">• 计算机学院选课</font></a><br/>
                     <a href="http://bbcjzm.neea.edu.cn/" target="_blank"> <font size="+1" face="楷体">• 四六级成绩找回</font></a><br/>
                     
                    </div>
                </td>
	            </tr>
            </table></td>
          </tr>
	      <tr>
	        <td height="203"><table width="95%"  height="95%" border="1" bordercolor="#D4D4D4">
	          <tr>
	            <td height="40" bgcolor="#4472c4" bordercolor="#4472c4"><div align="center" style="color:#EEE"><strong><font face="楷体" size="+1">班级事务</font></strong></div></td>
	            </tr>
	          <tr valign="top">
	            <td><div style=" width:100% ; padding-left:10px"> <br/>
             
                    <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset3.EOF)) 
%>
                      <a href="countstudent.asp?ID=<%=(Recordset3.Fields.Item("md5pass").Value)%>" target="_blank"><font size="+1" face="楷体"> • 统计<a href="countstudent.asp?ID=<%=(Recordset3.Fields.Item("md5pass").Value)%>" target="_blank"><font size="+1" face="楷体"><%=(Recordset3.Fields.Item("title").Value)%></font></a>：</font></a><br/>
                      <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset3.MoveNext()
Wend
%> <a href="applyreturn.asp" target="_blank"><font size="+1" face="楷体"> • 三方协议返回预约申请</font></a><br/>
<a href="applyend.asp" target="_blank"><font size="+1" face="楷体"> • 《毕业生推荐表》预约申请</font></a><br/>
 <a href="applythree.asp" target="_blank"><font size="+1" face="楷体"> • "三方协议"盖章预约申请</font></a>
                </div></td>
	            </tr>
            </table></td>
          </tr>
        </table>
      </div>
			 
                
                 
                
    </div>
<h1></h1>
 
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
</div>
<!-- here stars scrolling icon -->
	<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
	</script>
<!-- //here ends scrolling icon -->
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
<%
Recordset3.Close()
Set Recordset3 = Nothing
%>
