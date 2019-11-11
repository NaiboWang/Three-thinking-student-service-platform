<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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
Recordset1_cmd.ActiveConnection = MM_data_STRING
Recordset1_cmd.CommandText = "SELECT * FROM 身份信息（不可泄露） WHERE [学号] = ?" 
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
Recordset2_cmd.ActiveConnection = MM_data_STRING
Recordset2_cmd.CommandText = "SELECT * FROM s WHERE sno = ?" 
Recordset2_cmd.Prepared = true
Recordset2_cmd.Parameters.Append Recordset2_cmd.CreateParameter("param1", 200, 1, 255, Recordset2__MMColParam) ' adVarChar

Set Recordset2 = Recordset2_cmd.Execute
Recordset2_numRows = 0
%>
<!DOCTYPE html>
<html>
<head>
<title>成绩查询系统</title>
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
<link href='http://fonts.useso.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>
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
				<a href="scoreindex.asp"><img src="images/logo.png" width="230" height="59" alt=" " /></a>
          <h1  style=" text-align:left;font-size:17px; letter-spacing:-3px;font-weight:600; top:20px"><img src="images/user.png" style="top:-100px" width="25" height="25" />同学，欢迎你！<div class="bhh" style="float:right; width:400px;position:relative;top:-30px;left:170px"> <a href="<%= MM_Logout %>"><input type="submit" value="注销" > </a></div>  </div> 
                <div class="logo-right">
				<span class="menu"><img src="images/menu.png" alt=" "/></span>
				<ul class="nav1">
					<li ><a href="scoreindex.asp" class="act">主页<span>基本信息</span></a></li>
					<li><a href="scorecontent.asp" class="act1">成绩信息<span>均分与位次</span></a></li>
					<li class="cap"><a href="" class="act2">预测<span>保研优研</span></a></li>
					<li><a href="scorerank.asp" class="act3">成绩证明<span>下载与打印</span></a></li>
					<li><a href="scoredocument.asp" class="act4">相关文件<span>链接与下载</span></a></li>
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
  <h3>欢迎使用！</h3>
		<p class="para">感谢您使用西电三思成绩查询系统，请在上方栏中选择相应的操作来获取相关信息。<span></span></p>
  <img src="hr-geo-sukarno-1s960x639.jpg"  style=" position:relative;left:50px" width="960" height="113" alt=""/>
		<div class="portfolio-grids">
			     <div class="view view-ninth">
                   <div class="content" align="center">
                    <table class="datalist"  align="center" summary="list of members in EE Studay">  
                    <div class="colorblock" align="left">
		<p>若要&lt;保研&gt;，则：</p>
<p>1、您的CET6（英语六级）&gt;=425分，或者CET4&gt;=550分。</p>
<p>2、分数要求满足下面任意一条：</p>
<p>（1）<strong>三年来</strong>的主干课程（去掉实验、实习、课程设计、以及您选择的其他方向的课程或者院选课）的加权平均分在80分以上，若想达到这一点，则您大三下学期的均分<strong>至少要</strong>达到<%=(Recordset3.Fields.Item("到80").Value)%>分<u>+</u>2分。</p>
<p>（2）<strong>三年来</strong>的主干课程加权平均分位次位于<strong><%=(Recordset1.Fields.Item("培养方向").Value)%></strong>方向的前20%，目前该方向第20%的学生的均分为<%=(Recordset5.Fields.Item("前20%").Value)%>分，要想达到这个分数，则您大三下学期的均分<strong>至少要</strong>达到<%=(Recordset3.Fields.Item("到前20%").Value)%>分<u>+</u>2分。</p>
<p>3、一般来说在院<strong><%=(Recordset1.Fields.Item("培养方向").Value)%></strong>方向前10%~15%的同学确定可以拿到保研资格。</p>
<p><strong>注：现在的平均分和排名只是按考试成绩，最终的保研排名还要加上学科竞赛的加分等信息。</strong></p>

	</div>
    
    <h3>个人信息</h3> 
    <tr>                  <!-- 奇数行 -->  
        <td><i class="glyphicon glyphicon-pencil"></i>学号</td>  
        <td>&nbsp;</td>  
    </tr>  
    <tr class="altrow">       <!-- 偶数行 -->  
        <td><i class="glyphicon glyphicon-user">姓名</td>  
        <td>&nbsp;</td>  
    </tr>  
     <tr>                  <!-- 奇数行 -->  
        <td><i class="glyphicon glyphicon-leaf"></i>性别</td>  
        <td>&nbsp;</td>  
    </tr>  
    <tr class="altrow">       <!-- 偶数行 -->  
        <td><i class="glyphicon glyphicon-tag">身份证号</td>  
        <td>&nbsp;</td>  
    </tr> 
    <tr>                  <!-- 奇数行 -->  
        <td><i class="glyphicon glyphicon-calendar"></i>出生日期</td>  
        <td>&nbsp;</td>  
    </tr>  
    <tr class="altrow">       <!-- 偶数行 -->  
        <td><i class="glyphicon glyphicon-map-marker">家庭住址</td>  
        <td>&nbsp;</td>  
    </tr> 
      <tr>                  <!-- 奇数行 -->  
        <td><i class="glyphicon glyphicon-tree-conifer"></i>教学班</td>  
        <td>&nbsp;</td>  
    </tr>  
    <tr class="altrow">       <!-- 偶数行 -->  
        <td><i class="glyphicon glyphicon-pushpin">专业</td>  
        <td>&nbsp;</td>  
    </tr> 
        <tr>                  <!-- 奇数行 -->  
        <td><i class="glyphicon glyphicon-edit"></i>培养方案</td>  
        <td>&nbsp;</td>  
    </tr>  
    <tr class="altrow">       <!-- 偶数行 -->  
        <td><i class="glyphicon glyphicon-tree-deciduous">专业人数</td>  
        <td>&nbsp;</td>  
    </tr> 
</table>  


    
    

  </div>
	</div>

  </div>
       <div class="footer">
		<div class="footer-left">
			<ul>
				<li><a href="index.html"><img src="images/logo1.png"  width="150" height="45" alt=" " /></a><span> |</span></li>
				<li><p>Copyright 2016 <a href="http://www.three-thinking.com" target="_blank" title="三思" style="color:#fff">三思</a> 版权所有||————陕ICP备16002727号 |@xidian threethinking版权所有|<a href="http://www.miitbeian.gov.cn/" style="color:#fff" target="_blank" title="三思">工信部主页</a> </p></li>
                
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
Recordset2.Close()
Set Recordset2 = Nothing
%>
