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
<%
Set Command111 = Server.CreateObject ("ADODB.Command")
Command111.ActiveConnection = MM_tj_STRING
Command111.CommandText = "INSERT INTO 留言 (账号,IP, 类型, 时间)  VALUES ('"& session("MM_username") & "',' "  & request.servervariables("remote_addr")  & "','scorepredictmobile','" & year(Now) & "-" & Month(Now) & "-" & day(Now) & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now) & "' ) "
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
Recordset4_cmd.ActiveConnection = MM_data_STRING
Recordset4_cmd.CommandText = "SELECT * FROM 加权平均分 WHERE [学号] = ?" 
Recordset4_cmd.Prepared = true
Recordset4_cmd.Parameters.Append Recordset4_cmd.CreateParameter("param1", 200, 1, 255, Recordset4__MMColParam) ' adVarChar

Set Recordset4 = Recordset4_cmd.Execute
Recordset4_numRows = 0
%>
<%
Dim Recordset3
Dim Recordset3_cmd
Dim Recordset3_numRows

Set Recordset3_cmd = Server.CreateObject ("ADODB.Command")
Recordset3_cmd.ActiveConnection = MM_data_STRING
Recordset3_cmd.CommandText = "SELECT * FROM 分数段 where 方向 = '" & Recordset1.Fields.Item("培养方向").Value &"'" 
Recordset3_cmd.Prepared = true

Set Recordset3 = Recordset3_cmd.Execute
Recordset3_numRows = 0
%>
<!DOCTYPE html>
<html>
<head>
<title>三思-保研优研预测</title>
<style>  
<!--  
.datalist{  
    border:1px solid #0058a3;   /* 表格边框 */  
    font-family:Arial;  
    border-collapse:collapse;   /* 边框重叠 */  
    background-color:#eaf5ff;   /* 表格背景色 */
	background-size:cover;  
    font-size:14px;  
}  
.datalist caption{  
    padding-bottom:5px;  
    font:bold 1.4em;  
	background-size:cover;  
    text-align:left;  
}  
.datalist th{  
    border:1px solid #0058a3;   /* 行名称边框 */  
    background-color:#4bacff;   /* 行名称背景色 */ 
	background-size:cover;   
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
	background-size:cover;  
    padding-left:10px; padding-right:10px;  
}  
.datalist tr.altrow{  
background-size:cover;  
    background-color:#c7e5ff;   /* 隔行变色 */  
}  
-->  
</style>  

<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
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
          <div class="infor"  style="width:1000px;text-align:left;font-size:150%; background-size:cover; letter-spacing:-3px;font-weight:600;"> <% if Recordset2.Fields.Item("ssex").Value = "女" then%>
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
						$( ".logo infor" ).slideToggle( 300, function() {
						 // Animation complete.
						});
						
						});
					</script>
				<!-- //script for menu -->
		</div>
<!-- //header -->

<div class="submit" style="max-width:400px"><input type="submit" style="border-color:#111; background:#3d279a;color:#FFF; border-style:solid" onClick="window.location=('scorecontentmobile.asp');" value="成绩信息"><input type="submit" style="border-color:#E7E7E7; background:#E7E7E7; border-style:solid" value="成绩预测" ><input type="submit"  style="border-color:#111;color:#FFF; background:#3d279a; border-style:solid" onClick="window.location=('scorerankmobile.asp');" value="排名证明"></div>

<div class="port"  style="font:'楷体'">
  <h3>保研优研预测</h3>
		<p class="para">本系统根据您前5学期的成绩，结合最近各学校的保研和优研政策，为您参考如下。<span></span></p>
  <img src="hr-geo-sukarno-1s960x639.png"  style="  position:relative; left:2%;background-size:cover; background-position:center; width:90%;height:90%" alt=""/>
		<div class="portfolio-grids">
			     <div class="view view-ninth">
                   <div class="content" align="center">
                   
                    <div class="colorblock" align="left" style="width:100%;height:100%" >
		<p>若要&lt;保研&gt;，则：</p>
<p>1、您的CET6（英语六级）&gt;=425分，或者CET4&gt;=550分。</p>
<p>2、分数要求满足下面任意一条：</p>
<p>（1）<strong>三年来</strong>的主干课程（即您在本系统中看到的课程）的加权平均分在80分以上，若想达到这一点，则您大三下学期的均分<strong>至少要</strong>达到<%=(Recordset4.Fields.Item("到80").Value)%>分<u>+</u>2分。</p>
<p>（2）<strong>三年来</strong>的主干课程加权平均分位次位于<strong><%=(Recordset1.Fields.Item("培养方向").Value)%></strong>方向的前20%，目前该方向第20%的学生的均分为<%=(Recordset3.Fields.Item("前20%").Value)%>分，要想达到这个分数，则您大三下学期的均分<strong>至少要</strong>达到<%=(Recordset4.Fields.Item("到前20%").Value)%>分<u>+</u>2分。</p>
<p>3、一般来说在院<strong><%=(Recordset1.Fields.Item("培养方向").Value)%></strong>方向前10%~15%的同学确定可以拿到保研资格。</p>
<p><strong>注：现在的平均分和排名只是按考试成绩，最终的保研排名还要加上学科竞赛的加分等信息。</strong></p>

	</div>
    <p></p>
       <div class="colorblock2" align="left" >
		<p>若要走&lt;优研计划&gt;，则：</p>
<p>1、对英语四六级无要求。</p>
<p>2、成绩在专业排名前50%。</p>
	</div>
     <p><span class="para" style="font-size:25px">注意：此页为2013级成绩，2014级成绩尚未更新。</span></p>
    
    <h3>附表1：<%=(Recordset1.Fields.Item("培养方向").Value)%>方向前五学期的位次分数表</h3> 
     <table class="datalist"  align="center" summary="list of members in EE Studay">  
       <tr style="font-family:'微软雅黑'; font-weight:300">  
        <th scope="col">位次</th>  
        <th scope="col">第1%</th>  
        <th scope="col">第3%</th>  
        <th scope="col">第5%</th>  
        <th scope="col">第10%</th> 
        <th scope="col">第15%</th>
        <th scope="col">第20%</th>
    </tr>
    
    <tr>                  <!-- 奇数行 -->  
        <td style="text-align:center">均分</td>  
          <td style="text-align:center"><%=(Recordset3.Fields.Item("前1%").Value)%></td>
          <td style="text-align:center"><%=(Recordset3.Fields.Item("前3%").Value)%></td>
          <td style="text-align:center"><%=(Recordset3.Fields.Item("前5%").Value)%></td>
          <td style="text-align:center"><%=(Recordset3.Fields.Item("前10%").Value)%></td>
          <td style="text-align:center"><%=(Recordset3.Fields.Item("前15%").Value)%></td>
          <td style="text-align:center"><%=(Recordset3.Fields.Item("前20%").Value)%></td>
    </tr>  
</table>  

<p></p>
 <table class="datalist"  align="center" summary="list of members in EE Studay">  
<h3>附表2：各方向前五学期第50%位次分数表</h3> 
       <tr style="font-family:'微软雅黑'; font-weight:300">  
        <th scope="col">方向</th>  
        <th scope="col">计科嵌入式</th>  
        <th scope="col">计科软件</th>  
        <th scope="col">计科网络</th>  
        <th scope="col">计科视觉</th> 
        <th scope="col">计科卓越</th>
        <th scope="col">网工卓越</th>
        <th scope="col">网络工程</th>
        <th scope="col">物联网工程</th>
    </tr>
    
    <tr>                  <!-- 奇数行 -->   
          <td style="text-align:center">成绩</td>
          <td style="text-align:center">75.67</td>
        <td style="text-align:center">73.92</td>
        <td style="text-align:center">71.88</td>
        <td style="text-align:center">72.11</td>
        <td style="text-align:center">79.40</td>
        <td style="text-align:center">75.44</td>
        <td style="text-align:center">69.30</td>
        <td style="text-align:center">74.49</td> 
    </tr>  
</table>  


  </div>
	</div>

  </div>
       <div class="footer">
		<div class="footer-left">
			<ul>
				<li><a href="about.asp" target="_blank"><img src="images/logo1.png"  width="150" height="45" alt=" " /></a><span> |</span></li>
				<li> <p>Copyright 2016 <a href="http://www.three-thinking.com" target="_blank" title="三思" style="color:#FFFFFF">三思</a> 版权所有||<a href="about.asp" target="_blank" title="三思" style="color:#FFFFFF">关于三思</a>||@<a href="http://www.xidian.edu.cn/" style="color:#FFFFFF" target="_blank">西安电子科技大学 </a>threethinking版权所有|陕ICP备16002727号|<a href="http://www.miitbeian.gov.cn/" style="color:#FFFFFF" target="_blank" title="三思">工信部主页</a> </p></li>
                
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
<%
Recordset4.Close()
Set Recordset4 = Nothing
%>
<%
Recordset3.Close()
Set Recordset3 = Nothing
%>
