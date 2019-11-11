<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/tj.asp" -->
<%
Set Command111 = Server.CreateObject ("ADODB.Command")
Command111.ActiveConnection = MM_tj_STRING
Command111.CommandText = "INSERT INTO 留言 (账号,IP, 类型, 时间)  VALUES ('guest',' "  & request.servervariables("remote_addr")  & "','about','" & year(Now) & "-" & Month(Now) & "-" & day(Now) & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now) & "' ) "
Command111.CommandType = 1
Command111.CommandTimeout = 0
Command111.Prepared = true
Command111.Execute()
%>
<%
Set Command112 = Server.CreateObject ("ADODB.Command")
Command112.ActiveConnection = MM_tj_STRING
Command112.CommandText = "update 统计 set 关于 = 关于+1 "
Command112.CommandType = 1
Command112.CommandTimeout = 0
Command112.Prepared = true
Command112.Execute()
%>

<!DOCTYPE html>
<html>
<head>
<title>关于三思</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href='css/fonts1.css' rel='stylesheet' type='text/css'>
<link href='css/fonts2.css' rel='stylesheet' type='text/css'>
<!-- js -->
<script src="js/jquery.min.js"></script>
<!-- //js -->
<!-- for-mobile-apps -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Bizz Wow Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>

<!-- start-smoth-scrolling -->
</head>
	
<body>
	<div class="psd">
	<div class="container">
<!-- header -->
		<div class="header">
                <a href="http://www.xidian.edu.cn" target="_blank"><img src="images/scorelogo.png" style="position:relative; left:2%; background-position:left;background-size:cover; width:20%;height:20%"  alt=""/></a>
				  <img src="decoration.png"  style="position:relative; left:52%;background-position:right;background-size:cover; width:25%;height:25%" alt=""/>
			<div class="clearfix"> </div>
		</div>
<!-- //header -->
<!-- blog -->
	<div class="blog">
	  <img src="logo.png" style=" margin-bottom:2%;position:relative;left:7%;background-size:cover; min-height:50px; min-width:200px; width:25%;height:25%" alt=""/>
	  <div class="blog-left">
	    <div class="blog-left-info">
			<h3 style=" color:#0015FF;font-family:'楷体';">一个人的感官终究还是不够用，直到被永不消逝的电波消融，让无数双艺术巨手把我碎成轻尘。——朱耀耀·三思三爱三行诗</h3>
		
		  <div class="banner">
<!-- Slider-starts-Here -->
				<script src="js/responsiveslides.min.js"></script>
				 <script>
				    // You can also use "$(window).load(function() {"
				    $(function () {
				      // Slideshow 4
				      $("#slider3").responsiveSlides({
				        auto: true,
				        pager: false,
				        nav: true,
				        speed: 500,
				        namespace: "callbacks",
				        before: function () {
				          $('.events').append("<li>before event fired.</li>");
				        },
				        after: function () {
				          $('.events').append("<li>after event fired.</li>");
				        }
				      });
				
				    });
				  </script>
			
				
					<div  id="top" class="callbacks_container wow fadeInUp" data-wow-delay="0.5s">
                    <ul class="rslides" id="slider3" style="padding-right:100px">
						<a href="threethinking1.pdf" target="_blank"><div class="banner1">
                         
						</div></a>
					
					
						<a href="threethinking3.pdf" target="_blank"><div class="banner2">
                          
						</div> </a>
				
					
						<a href="threethinking4.pdf" target="_blank"><div class="banner3">
							   
						</div></a>
					
						<a href="threethinking5.pdf" target="_blank"><div class="banner4">
							  
						</div></a>
                        <a href="threethinking6.pdf" target="_blank"><div class="banner5">
							  
						</div></a>
					<a href="threethinking78.pdf" target="_blank"><div class="banner6">
							  
						</div></a>
				</ul>
                </div>
	</div>
		</div>
            
			
	  </div>
	  <div class="blog-right">
	    <h3 align="center" style=" margin-right:10%;color:#0015FF;font-family:'微软雅黑'">关于三思</h3>
	    <ul  style="color:#000000;text-align:left;font-family:'微软雅黑'">
				<li>网站名称：三思（threethinking）</li>
				  <li>网址：http://www.three-thinking.com</li>
				    <li>网站类型：IT/西安电子科技大学/辅助事务管理 </li>
				    <li>直属单位：计算机学院&ldquo;三思&rdquo;服务团队</li>
				    <li>服务对象：西安电子科技大学计算机学院学生</li>
				    <li>顾问：王泉/马建峰/党文学/崔江涛/沈玉龙/王卫东</li>
				    <li>主管：张志为/张春月/赵岩松/冉宪宇 </li>
				    <li>开发：王乃博/任阳/韩佳文/冯雪芹/崔家宝/冀托</li>
				    <li>美工：王乃博/韩雨倩 </li>
				    <li>架构：HTML5+CSS+ASP+VBScript+PHP+MySQL</li>
				    <li>备案信息：陕ICP备16002727号 </li>
				    <li>法人代表：王乃博 </li>
				    <li>备案时间：2016年3月29日 </li>
				    <li>电话：029-81891128</li>
				    <li>邮箱：982311099@qq.com</li>
				    <li>微信号：fudaoyuanweixin</li>
				    <li>QQ群：我们的辅导员（196766604）</li>
				
				
		</ul>
	  </div>
		<div class="clearfix"> </div>
		
	</div>
<!-- //blog -->
<!-- footer -->
	<div class="footer">
		<div class="footer-left">
			<ul>
				<li><a href="about.html" target="_blank"><img src="images/logo1.png"  width="150" height="45" alt=" " /></a><span> |</span></li>
				<li> <p>Copyright 2016 <a href="http://www.three-thinking.com" target="_blank" title="三思" style="color:#FFFFFF">三思</a> 版权所有||<a href="about.html" target="_blank" title="三思" style="color:#FFFFFF">关于三思</a>||@<a href="http://www.xidian.edu.cn/" style="color:#FFFFFF" target="_blank">西安电子科技大学 </a>threethinking版权所有|陕ICP备16002727号|<a href="http://www.miitbeian.gov.cn/" style="color:#FFFFFF" target="_blank" title="三思">工信部主页</a> </p></li>
                
			</ul>
		</div>
		<div class="clearfix"> </div>
	</div>
<!-- //footer -->
	</div>
	</div>
<!-- here stars scrolling icon -->
	
<!-- //here ends scrolling icon -->
</body>
</html>