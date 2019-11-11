
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/data.asp" -->
<!--#include file="Connections/tj.asp" -->
<!--#include file="Connections/mysql.asp" -->
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_mysql_STRING
Recordset1_cmd.CommandText = "SELECT ID, title,time FROM student.informa ORDER BY ID DESC" 
Recordset1_cmd.Prepared = true

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<%
Dim Recordset2__MMColParam
Recordset2__MMColParam = "1"
If (Request("MM_EmptyValue") <> "") Then 
  Recordset2__MMColParam = Request("MM_EmptyValue")
End If
%>
<%
Dim Recordset2
Dim Recordset2_cmd
Dim Recordset2_numRows

Set Recordset2_cmd = Server.CreateObject ("ADODB.Command")
Recordset2_cmd.ActiveConnection = MM_mysql_STRING
Recordset2_cmd.CommandText = "SELECT * FROM student.index WHERE choice = 1" 
Recordset2_cmd.Prepared = true
Recordset2_cmd.Parameters.Append Recordset2_cmd.CreateParameter("param1", 5, 1, -1, Recordset2__MMColParam) ' adDouble

Set Recordset2 = Recordset2_cmd.Execute
Recordset2_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 12
Repeat1__index = 0
Recordset1_numRows = Recordset1_numRows + Repeat1__numRows
%>
<!DOCTYPE HTML>
<html>
<head>
<title>三思·无悔青春</title>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=0.40, maximum-scale=10, minimum-scale=0, user-scalable=yes, width=device-width">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" href="jquery.easySlider.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style3.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet">
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!----webfonts--->
<link href='css/fonts1.css' rel='stylesheet' type='text/css'>
<!---//webfonts--->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
	<script>
	console.log("三思，点滴珍藏的大学青春纪念册。");
		console.log("加入三思，我们一起来改变大学生的生活习惯。");
		console.log("请将简历发送至：%c resume@three-thinking.com","color:red");
		console.log("三思，期待你的加入。");
	</script>
<%
If Session("user_is_index")<>"true" Then
    Session("user_is_index")="true"
Set Command111 = Server.CreateObject ("ADODB.Command")
Command111.ActiveConnection = MM_tj_STRING
Command111.CommandText = "INSERT INTO 留言 (账号,IP, 类型, 时间)  VALUES ('guest',' "  & request.servervariables("remote_addr")  & "','index','" & year(Now) & "-" & Month(Now) & "-" & day(Now) & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now) & "' ) "
Command111.CommandType = 1
Command111.CommandTimeout = 0
Command111.Prepared = true
Command111.Execute()
Set Command112 = Server.CreateObject ("ADODB.Command")
Command112.ActiveConnection = MM_tj_STRING
Command112.CommandText = "update 统计 set ID = ID+1 "
Command112.CommandType = 1
Command112.CommandTimeout = 0
Command112.Prepared = true
Command112.Execute()
end if
%>
<%
' *** Validate request to log in to this site.
GOTOswgl  = CStr(Request.ServerVariables("URL")) & "?GOTOswglnow=1"
If (CStr(Request("GOTOswglnow")) = "1") Then
  LoginSuccess = "http://222.25.176.4:8080"
	Set Command1 = Server.CreateObject ("ADODB.Command")
	Command1.ActiveConnection = MM_tj_STRING
	Command1.CommandText =  "INSERT INTO 留言 (账号,IP, 类型, 时间)  VALUES ('guest',' "  & request.servervariables("remote_addr")  & "','swgl','" & year(Now) & "-" & Month(Now) & "-" & day(Now) & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now) & "' ) "
	Command1.CommandType = 1
	Command1.CommandTimeout = 0
	Command1.Prepared = true
	Command1.Execute()
  Response.Redirect(LoginSuccess)
End If
%>

<!-- 下面是滑动相关-->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<style type="text/css">

<!--* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}-->

.notice p{
text-align:left;
font-size:18px;}

wrap {text-align:left;}
body {
	background: url(img/bg.gif);
}
.sha ul,li{
	padding-left:5px;
	text-align:left;
	line-height:29px;
}
a, img {
	border: none;
}
.zx_slider {
	position: relative;
	margin: 40px auto 0 auto;
	width: 1002px;
	height: 350px;
	overflow: hidden;
	border-radius: 5px;
}
.zx_slider .imgbox {
	width: 3750px;
	height: 310px;
	position: absolute;
	left: 5px;
	top: 4px;
}
.zx_slider .imgbox img {
	float: left;
	width: 750px;
	height: 310px;
}
.zx_slider .png {
	width: 1002px;
	height: 350px;
	left: 0px;
	top: 0px;
	position: absolute;
	background: url(img/slider_bg.png);
	_background: none;
filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src="img/slider_bg.png");
}
.zx_slider .lbtn {
	cursor: pointer;
	width: 45px;
	height: 55px;
	position: absolute;
	left: 0px;
	bottom: -3px;
	background: url(img/slider_l_btn.png);
	_background: none;
filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src="img/slider_l_btn.png");
}
.zx_slider .rbtn {
	cursor: pointer;
	width: 45px;
	height: 55px;
	position: absolute;
	left: 718px;
	bottom: -3px;
	background: url(img/slider_r_btn.png);
	_background: none;
filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src="img/slider_r_btn.png");
}
.zx_slider .btnbox {
	width: 750px;
	height: 60px;
	position: absolute;
	left: 30px;
	bottom: 0px;
}
.zx_slider .btnbox a {
	cursor: pointer;
	display: inline-block;
	float: left;
	width: 126px;
	height: 54px;
	margin: 0 0 0 10px;
}
.zx_slider .btnbox a img {
	position: relative;
	display: inline;
	width: 120px;
	height: 48px;
	float: left;
	border: 3px solid #392101;
	border-radius: 2px;
}
.zx_slider .btnbox a .img_hover {
	border: 3px solid #e4471f;
	border-radius: 2px;
}
.zx_slider .slider_p {
	overflow: hidden;
	width: 220px;
	height: 290px;
	position: absolute;
	right: 15px;
	top: 15px;
}
.zx_slider .slider_p h3 {
	margin: 20px 0 10px 0;
	font-size: 20px;
	text-align: center;
	color: #faa629;
}
.zx_slider .slider_p p {
	line-height: 26px;
	font-size: 14px;
	color: #D6D6D6;
}
.hi_btn {
	width: 740px;
	height: 330px;
	position: absolute;
	left: 0px;
	top: 0px;
	display: block;
}
</style>

<!-- 下面是下拉菜单相关-->
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript"> 
$(document).ready(function(){
  $(".flip").mouseover(function(){
    $(this).next("div").slideDown(500);
  });
  $(".content").mouseleave(function(){
    $(this).children("div").slideUp(500);
  });
});
</script>
<style type="text/css">
div.panel, p.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	border: solid 0px;
}
div.panel {
	height: auto;
	display: none;
}
</style>
<!-- 上面是下拉菜单相关-->
<!-- 去除超链接特性-->
<style type="text/css">
a:link {
	color: #000000;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #000000;
}
a:hover {
	text-decoration: underline;
	color: #FF0000;
}
a:active {
	text-decoration: none;
	color: #FF0000;
}
</style>
<!-- 去除超链接特性-->

</head>
<body id="login" style="text-align:center;overflow-x:auto;">

<div style="width:1024px; margin:0 auto; height:1200px"><!--最大框-->

<div style="float:left; width:100%; height:100px; clear:both; margin:10px 20px 0 20px; padding-right:5%; display:inline"><a href="about.asp" target="_blank"><img src="logo.png" style="float:left;background-size:cover; height:80%; max-height:80px; min-height:50px; min-width:300px;alt=""/></a>
    
  
	<div style="float:right;font-size:20px;margin-top:5%">
	    <img height=25px src="images/user.png"/><a href="scorelogin.asp"  style="font-family:'微软雅黑'" target="_blank"><strong>学生登录</strong></a>
	</div>
	
	<div style="float:right;margin-right:3%;margin-top:5%;font-size:20px;">
	    <img height=25px src="images/user.png"/><a href="login.asp"  style="font-family:'微软雅黑'" target="_blank"><strong>管理员登录</strong></a>
	</div>
    
</div>

<div align="center" style="float:left;margin-left:auto;margin-right:auto; width:1300px;">
    <div class="zx_slider" style="float:left;margin-top:-0.5%;margin-left:0;margin-right:13%">
         <div class="imgbox"> 
             <!--img alt="Danx" src="images/sc.png" width="750" height="310" /> 
			<img alt="Danx" src="images/gcd.png" width="750" height="310" />
			<img alt="Danx" src="images/tc.png" width="750" height="310" /> 
        
            <img alt="Danx" src="images/swxt.png" width="750" height="310" />
            <img alt="Danx" src="images/scold.png" width="750" height="310" />
            
            <!--img alt="Danx" src="img/danx5.jpg" width="750" height="310" /--> 
            <img alt="Danx" src="images/<%=(Recordset2.Fields.Item("photo1").Value)%>" width="750" height="310" />
			<img alt="Danx" src="images/<%=(Recordset2.Fields.Item("photo2").Value)%>" width="750" height="310" />
             <img alt="Danx" src="images/<%=(Recordset2.Fields.Item("photo3").Value)%>" width="750" height="310" /> 
			<img alt="Danx" src="images/<%=(Recordset2.Fields.Item("photo4").Value)%>" width="750" height="310" />
			<img alt="Danx" src="images/<%=(Recordset2.Fields.Item("photo5").Value)%>" width="750" height="310" />
            
			
            </div>
        <div class="png"></div>
        <a href="<%=(Recordset2.Fields.Item("link1").Value)%>" id="hi_btn0" class="hi_btn" target="_blank"></a> 
		<a href="<%=(Recordset2.Fields.Item("link2").Value)%>" target="_blank" id="hi_btn1" class="hi_btn"></a> 
		<a href="<%=(Recordset2.Fields.Item("link3").Value)%>" target="_blank" id="hi_btn2" class="hi_btn"></a>
        
        <a href="<%=(Recordset2.Fields.Item("link4").Value)%>" target="_blank" id="hi_btn3" class="hi_btn"></a>
        <a href="<%=(Recordset2.Fields.Item("link5").Value)%>" target="_blank" id="hi_btn4" class="hi_btn"></a> 
        
        
		
        <div class="btnbox"> 
         <a onmouseover="btn_m_over(0)"><img alt="Danx" id="btn_img0" class="thumb  img_hover" src="images/<%=(Recordset2.Fields.Item("photo1").Value)%>" /></a> 
			<a onmouseover="btn_m_over(1)"><img alt="Danx" id="btn_img1" class="thumb" src="images/<%=(Recordset2.Fields.Item("photo2").Value)%>" /></a> 
			<a onmouseover="btn_m_over(2)"><img alt="Danx" id="btn_img2" class="thumb" src="images/<%=(Recordset2.Fields.Item("photo3").Value)%>" /></a> 
           
            <a onmouseover="btn_m_over(3)"><img alt="Danx" id="btn_img3" class="thumb" src="images/<%=(Recordset2.Fields.Item("photo4").Value)%>" /></a> 
            <a onmouseover="btn_m_over(4)"><img alt="Danx" id="btn_img4" class="thumb" src="images/<%=(Recordset2.Fields.Item("photo5").Value)%>" /></a> 
            
			
		</div>
        <div class="lbtn"></div>
        <div class="rbtn"></div>
        <div class="slider_p">
			<div id="slider_p0" class="slider_p_div">
            <h3><a href="<%=(Recordset2.Fields.Item("link1").Value)%>" style="color:#faa629" target="_blank"><%=(Recordset2.Fields.Item("name1").Value)%></a></h3>
            <p><%=(Recordset2.Fields.Item("exp1").Value)%></p>
				<h3><a href="<%=(Recordset2.Fields.Item("link2").Value)%>" target="_blank" style="color:#faa629"><%=(Recordset2.Fields.Item("name2").Value)%></a></h3>
				
				<h3><a href="<%=(Recordset2.Fields.Item("link3").Value)%>" target="_blank" style="color:#faa629"><%=(Recordset2.Fields.Item("name3").Value)%></a></h3>
                
                <h3><a href="<%=(Recordset2.Fields.Item("link4").Value)%>" style="color:#faa629" target="_blank" ><%=(Recordset2.Fields.Item("name4").Value)%></a></h3>
                <h3><a href="<%=(Recordset2.Fields.Item("link5").Value)%>" target="_blank" style="color:#faa629" ><%=(Recordset2.Fields.Item("name5").Value)%></a></h3>
               
                </div>
            <div id="slider_p1" class="slider_p_div">
				<h3><a href="<%=(Recordset2.Fields.Item("link1").Value)%>" style="color:#faa629" target="_blank"><%=(Recordset2.Fields.Item("name1").Value)%></a></h3>
            
				<h3><a href="<%=(Recordset2.Fields.Item("link2").Value)%>" target="_blank" style="color:#faa629"><%=(Recordset2.Fields.Item("name2").Value)%></a></h3>
				<p><%=(Recordset2.Fields.Item("exp2").Value)%></p>
				<h3><a href="<%=(Recordset2.Fields.Item("link3").Value)%>" target="_blank" style="color:#faa629"><%=(Recordset2.Fields.Item("name3").Value)%></a></h3>
                
                <h3><a href="<%=(Recordset2.Fields.Item("link4").Value)%>" style="color:#faa629" target="_blank" ><%=(Recordset2.Fields.Item("name4").Value)%></a></h3>
                <h3><a href="<%=(Recordset2.Fields.Item("link5").Value)%>" target="_blank" style="color:#faa629" ><%=(Recordset2.Fields.Item("name5").Value)%></a></h3>
               
				
            </div>
				<div id="slider_p2" class="slider_p_div">
               	<h3><a href="<%=(Recordset2.Fields.Item("link1").Value)%>" style="color:#faa629" target="_blank"><%=(Recordset2.Fields.Item("name1").Value)%></a></h3>
            
				<h3><a href="<%=(Recordset2.Fields.Item("link2").Value)%>" target="_blank" style="color:#faa629"><%=(Recordset2.Fields.Item("name2").Value)%></a></h3>
				<h3><a href="<%=(Recordset2.Fields.Item("link3").Value)%>" target="_blank" style="color:#faa629"><%=(Recordset2.Fields.Item("name3").Value)%></a></h3>
                <p><%=(Recordset2.Fields.Item("exp3").Value)%></p>
                <h3><a href="<%=(Recordset2.Fields.Item("link4").Value)%>" style="color:#faa629" target="_blank" ><%=(Recordset2.Fields.Item("name4").Value)%></a></h3>
                <h3><a href="<%=(Recordset2.Fields.Item("link5").Value)%>" target="_blank" style="color:#faa629" ><%=(Recordset2.Fields.Item("name5").Value)%></a></h3>
				
				</div>
            <div id="slider_p3" class="slider_p_div">
					<h3><a href="<%=(Recordset2.Fields.Item("link1").Value)%>" style="color:#faa629" target="_blank"><%=(Recordset2.Fields.Item("name1").Value)%></a></h3>
            
				<h3><a href="<%=(Recordset2.Fields.Item("link2").Value)%>" target="_blank" style="color:#faa629"><%=(Recordset2.Fields.Item("name2").Value)%></a></h3>
				
				<h3><a href="<%=(Recordset2.Fields.Item("link3").Value)%>" target="_blank" style="color:#faa629"><%=(Recordset2.Fields.Item("name3").Value)%></a></h3>
                
                <h3><a href="<%=(Recordset2.Fields.Item("link4").Value)%>" style="color:#faa629" target="_blank" ><%=(Recordset2.Fields.Item("name4").Value)%></a></h3>
                <p><%=(Recordset2.Fields.Item("exp4").Value)%></p>
                <h3><a href="<%=(Recordset2.Fields.Item("link5").Value)%>" target="_blank" style="color:#faa629" ><%=(Recordset2.Fields.Item("name5").Value)%></a></h3>
				
                </div>
            <div id="slider_p4" class="slider_p_div">
		<h3><a href="<%=(Recordset2.Fields.Item("link1").Value)%>" style="color:#faa629" target="_blank"><%=(Recordset2.Fields.Item("name1").Value)%></a></h3>
            
				<h3><a href="<%=(Recordset2.Fields.Item("link2").Value)%>" target="_blank" style="color:#faa629"><%=(Recordset2.Fields.Item("name2").Value)%></a></h3>
				
				<h3><a href="<%=(Recordset2.Fields.Item("link3").Value)%>" target="_blank" style="color:#faa629"><%=(Recordset2.Fields.Item("name3").Value)%></a></h3>
                
                <h3><a href="<%=(Recordset2.Fields.Item("link4").Value)%>" style="color:#faa629" target="_blank" ><%=(Recordset2.Fields.Item("name4").Value)%></a></h3>

                <h3><a href="<%=(Recordset2.Fields.Item("link5").Value)%>" target="_blank" style="color:#faa629" ><%=(Recordset2.Fields.Item("name5").Value)%></a></h3>
				                <p><%=(Recordset2.Fields.Item("exp5").Value)%></p>
                </div>
            
            </div>
    </div>
    <!--zx_slider end--> 
    <!--/div-->
    <script type="text/javascript">
var slider_count=4;
$(".slider_p_div").hide();
$("#slider_p0").show();
$(".hi_btn").hide();
$("#hi_btn0").show();
$(".img_hover").animate({bottom:'10px'});
var slider_i=1;
var m_over=true;

function zx_slider(){
	if(m_over){
		if(slider_i<0){slider_i=slider_count;}
		//p
		$(".slider_p_div").hide();
		$("#slider_p"+slider_i).show();
		//p end
		//hi_btn
		$(".hi_btn").hide();
		$("#hi_btn"+slider_i).show();
		//hi_btn end
		//btn
		$(".btnbox img").stop(true,true);
		$(".btnbox img").removeClass("img_hover");
		$(".btnbox img").animate({bottom:'0px'},200);
		$("#btn_img"+slider_i).addClass("img_hover");
		$("#btn_img"+slider_i).animate({bottom:'10px'},200);
		//btn end
		$(".imgbox").stop();
		$(".imgbox").animate({left:'-750'*slider_i+'px'});
		if(slider_i<slider_count){
			slider_i++;	
		}else{
			slider_i=0;
		}
	}
}

$(".lbtn").click(function(){
	m_over=true;
	if(slider_i==0){slider_i=slider_count-1}else{slider_i=slider_i-2;}
	zx_slider();
	m_over=false;
});

$(".rbtn").click(function(){
	m_over=true;
	zx_slider();
	m_over=false;
});

function btn_m_over(btn_i){
	if(slider_i-1!=btn_i){
		m_over=true;
		slider_i=btn_i;
		zx_slider();
		m_over=false;
	}
}

zx_timer=setInterval("zx_slider();",5000); 
$(".zx_slider").mouseover(function(){
	m_over=false;
});
$(".zx_slider").mouseout(function(){
	m_over=true;
});
</script>
    <div style="text-align:center;clear:both"> 
        <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script> 
        <script src="/follow.js" type="text/javascript"></script> 
    </div>
    
	<div class="app-cam" style="float:left;border: 3px solid #e2512d  ;border-radius: 20px; width:380px; height:400px; margin-top:3%;margin-right:0%; padding:0px 20px; min-width:300px">
		<div style="margin-top:1%;height:350px">	
			
				<table>
					<tbody>
						<tr>
							<td align="center" style=" font-family:'微软雅黑'"><font size="5"><%=(Recordset2.Fields.Item("title").Value)%></font></td>
						</tr>
						<tr>
							<td style="padding:0 30px;">
							  
							  <p style="font-size:16px; font-family:'微软雅黑'">★<%=(Recordset2.Fields.Item("content").Value)%></p>
							  <p>&nbsp;</p>
							  
							</td>
						</tr>
					
					</tbody>
				</table>
		
		</div>
    </div>
	
	<div class="row" style="border-radius: 20px;border-top:3px solid #f1b619;border-left:3px solid #f1b619;float:right;width:550px;height:400px;margin-right:23%;margin-top:3%;">
        
        <div class="post">
            <div class="postTitle" style="margin-top:1%">
                <span id="biyekuaixun1" class="s1" style="font-size:22px;font-family:'微软雅黑'; margin-left:70px">
                <font size=5px color="black"><strong>最新通知</strong></font>
                <span class="postTitle" style="margin-top:1%">
                <span class="s1" style="font-size:22px;"><span class="postTitle" style="margin-top:1%">
                <span style="float:right;padding-right:-20px">
                <a id="biyekuaixun1a" href="inforlist.asp" target="_blank" style="display:block;margin-right:20px"><font size=4px>MORE&gt;&gt;
                </font></a>
                
                </span></span></span></span></span>
                <div class="postBody" style="margin-top:1%;width:100%;margin-left:1%;float:left">
                  <div id="biyexinwen2" class="postList">
                    <ul>
                      <li class="sha">
                        <% If Recordset1.EOF And Recordset1.BOF Then %>
                        &gt;&gt;暂无通知
                        <% End If ' end Recordset1.EOF And Recordset1.BOF %>
                        <!--span style="float: right;margin-right:20px"><a>2015-07-10</a></span-->
                      </li>
                    </ul>
                  </div>
                </div>
                <span style="float:right;padding-right:5px"><a id="biyekuaixun2a" href="/services" style="display:none;"><font size=2px color=black>MORE&gt;&gt;</font></a>
                    </span>
                </div>
            <div class="postBody" style="margin-top:0%;width:100%;margin-left:1%;float:left">
                <div id="biyexinwen1" class="postList">
                    <ul>
                      <% If Not Recordset1.EOF Or Not Recordset1.BOF Then %>
                       <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) 
%>
  <li class="sha">
  <li style="display:block;overflow:hidden;word-break:keep-all;white-space:nowrap;text-overflow:ellipsis;font-family:'黑体'; width:80%; float:left">&gt;&gt;<!--span style="float: right;margin-right:20px"><a>2015-07-10</a></span-->
   
      <a   href="information.asp?ID=<%=(Recordset1.Fields.Item("ID").Value)%>" target="_blank"><%=(Recordset1.Fields.Item("title").Value)%></a> </li>
      <span style="float: right;margin-right:25px; margin-top:2px"><%=(Recordset1.Fields.Item("time").Value)%></span>

  </li>
      <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>
    
  <% End If ' end Not Recordset1.EOF Or NOT Recordset1.BOF %>
                    </ul>
                </div>
                
          </div>
                
      </div>
    </div>
    
    
    
</div>

<div style=" margin:0 auto;width:100%; height:1; clear:both;padding-top:10px">
    <div style=" width:100%; height:700">
        <p>Copyright <%=year(now())%> <a href="http://www.three-thinking.com" target="_blank" title="三思" style="color:#000000">三思</a> 版权所有||<a href="about.asp" target="_blank" title="三思" style="color:#000000">关于三思</a>||@<a href="http://www.xidian.edu.cn/" style="color:#000000" target="_blank">西安电子科技大学 </a>threethinking版权所有|陕ICP备16002727号|<a href="http://www.miitbeian.gov.cn/" style="color:#000000" target="_blank" title="三思">工信部主页</a> </p>
    </div>
</div>

</div><!--大框-->
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
