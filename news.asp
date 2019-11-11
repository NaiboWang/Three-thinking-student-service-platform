<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/tj.asp" -->
<!--#include file="Connections/mysql.asp" -->
<%
If Session("user_is_recorded")<>"true" Then
    Session("user_is_recorded")="true"
Set Command1 = Server.CreateObject ("ADODB.Command")
Command1.ActiveConnection = MM_mysql_STRING
Command1.CommandText = "UPDATE count SET news = news +1 "
Command1.CommandType = 1
Command1.CommandTimeout = 0
Command1.Prepared = true
Command1.Execute()
end if
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_mysql_STRING
Recordset1_cmd.CommandText = "SELECT news FROM count" 
Recordset1_cmd.Prepared = true

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<%
Dim Recordset2
Dim Recordset2_cmd
Dim Recordset2_numRows

Set Recordset2_cmd = Server.CreateObject ("ADODB.Command")
Recordset2_cmd.ActiveConnection = MM_mysql_STRING
Recordset2_cmd.CommandText = "SELECT * FROM student.teacher order by ID desc" 
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
<!DOCTYPE HTML>
<html>
<head>
<title>三思·导师信息</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Wed Day Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style4.css" rel='stylesheet' type='text/css' />	
<link href="css/notice.css" rel='stylesheet' type='text/css' />	
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
p {
 font-size:17px;
}
a{color: #0162f4;}
a:hover{text-decoration:underline;color: #C20C0C;}
.div1{ display:inline; float;left;}
.div3{ display:inline; float;right;}
</style>
<!--webfonts-->

<!--//webfonts-->
</head>
<body>
<!--start-home-->
<!-- header --><!-- //header -->
<!-- banner -->
<div class="banner two">
		<div class="container" >
			<div class="banner-navigation" style="padding:1% 1% 1% 1%">

					
				    <a href="http://www.three-thinking.com" target="_blank"> 
					<img src="images\logo1.png" style="background-position:center;position:relative;background-size:cover; min-height:50px; min-width:200px; width:15%;height:15%" alt=""/></a>
	  <a href="http://www.xidian.edu.cn" target="_blank"><img class="xd" src="images/scorelogowhite.png" style="position:relative; left:60%; background-position:left;background-size:cover; width:20%;height:20%"  alt=""/></a>

					 
					<!--script-for-menu-->
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
<!--typography-->
<div class="typrography">
	 <div class="container">
     <p  align="center" class = "tzxx" style="display:none; font-size:30px ">最新通知信息</p>
		<img class="tzxx" src="images/textinfor.png" alt="" style="background-position:center;left:35%;position:relative;background-size:cover; min-height:50px; min-width:200px; width:30%;height:30%"  longdesc="news.asp">
	   <div class="clearfix"> </div>
	</div>
	<div class="container">
			 <div class="grid_3 grid_5" >
				 
                 <div id="wz" style="padding-left:5%"><span><b>您的位置：</b><a href="index.asp" style="color:#000">三思主页</a>&nbsp;&gt;&nbsp;<a href="inforlist.asp" style="color:#000">最新通知</a>&nbsp;&gt;&nbsp;</span>
					
				</div>
                

			</div>
 
 <div id="list_wrap"><!--新闻内容-->
	<div id="list_main">
		<div class="maindiv">
				<div class="atshowa">
					<div class="atshowname" style="text-align:center;color:#009;font-size:23px;font-weight:bold;line-height:1.5em;margin-bottom:10px;height:auto!important">  <span id="Label1">西电导师信息介绍</span></div>
				</div>
				<div class="atshowb">
					<div class="atshowmessage" style="text-align:center;"><span id="Label2">&nbsp;&nbsp;发布时间:&nbsp;2016-5-25 10:44:13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 浏览次数：</span><%=(Recordset1.Fields.Item("news").Value)%></div>
				</div>
				
				<hr style="height:1px;border:none;border-top:1px solid #555555;" />
				<div id="change_content1">
					

					<div class="atshowd">
						<div class="atshowcontent" style="padding-left:3%;padding-right:3%;font-size:14px;line-height:1.5em;">
				<span id="Label3">

				<p>&nbsp;&nbsp;&nbsp; 鉴于目前有相当一部分想上本校研究生的同学在联系导师的过程中遇到困难，本站现向广大同学提供西电本校的相关导师信息，以方便同学们了解。具体导师详情请点击下面链接进行查看：</p>
				<p>&nbsp;</p>
				</span><span>
			
				<div style="border-top:2px dashed #000;border-bottom:2px dashed #000">
				<p>&nbsp;</p>
				<p>学校官方链接区域： </p>
				<p>&nbsp;&nbsp;西安电子科技大学<strong>计算机学院</strong>导师信息汇总：<a href="http://cs.xidian.edu.cn/html/graduate/faculty/index.html" target="_blank"><font size="3px" color="blue">点此进行查看</font></a></p>

				<p>&nbsp;&nbsp;西安电子科技大学<strong>软件学院</strong>导师信息汇总：<a href="http://sc.xidian.edu.cn/html/teacher/daoshixinxi/" target="_blank"><font size="3px" color="blue">点此进行查看</font></a></p>

				<p>&nbsp;&nbsp;西安电子科技大学<strong>网络与信息安全学院</strong>导师信息汇总：<a href="http://ce.xidian.edu.cn/?page_id=232" target="_blank"><font size="3px" color="blue">点此进行查看</font></a></p>
				<p>&nbsp;</p>
				</div>

				<div style="border-bottom:2px dashed #000">

				<p style="margin-left: 42pt;">&nbsp;</p>
				
                <p>三思团队自主整理模块： </p>
                <p>&nbsp;&nbsp;这部分内容是学校部分老师今年进行宣讲和推荐自己的信息的区域，由导员和三思团队成员不断整理，汇总在这里，不断更新，请关注：</p>
                <p>&nbsp;</p>
<% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset2.EOF)) 
%>
  <p>&nbsp;&nbsp;★<a style="color:#00F" href="teachernews.asp?ID=<%=(Recordset2.Fields.Item("ID").Value)%>" target="_blank"><%=(Recordset2.Fields.Item("title").Value)%></a>(发布时间：<%=FormatDateTime((Recordset2.Fields.Item("time").Value),1)%>)</p>
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset2.MoveNext()
Wend
%>
  <p>&nbsp;</p>
                
                </div>
                 <script>
　　var browser = {
　　versions : function() {
　　var u = navigator.userAgent, app = navigator.appVersion;
　　return {//移动终端浏览器版本信息
　　trident : u.indexOf('Trident') > -1, //IE内核
　　presto : u.indexOf('Presto') > -1, //opera内核
　　webKit : u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
　　gecko : u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
　　mobile : !!u.match(/AppleWebKit.*Mobile.*/)
　　|| !!u.match(/AppleWebKit/), //是否为移动终端
　　ios : !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
　　android : u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
　　iPhone : u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
　　iPad: u.indexOf('iPad') > -1, //是否iPad
　　webApp : u.indexOf('Safari') == -1,
　　//是否web应该程序，没有头部与底部
　　google:u.indexOf('Chrome')>-1
　　};
　　}(),
　　language : (navigator.browserLanguage || navigator.language).toLowerCase()
　　}
　　
　　var system = {
　　win: false,
　　mac: false,
　　xll: false,
　　ipad:false
　　};
　　//检测平台
　　var p = navigator.platform;
　　system.win = p.indexOf("Win") == 0;
　　system.mac = p.indexOf("Mac") == 0;
　　system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
　　system.ipad = (navigator.userAgent.match(/iPad/i) != null)?true:false;
　　//跳转语句，如果是手机访问就自动跳转到" "里的页面
　　if (system.win || system.mac || system.xll||system.ipad) {

　} else {
	$( "img.xd" ).slideToggle( 3, function() {});
	$( "img.tzxx" ).slideToggle( 3, function() {});
	$( "p.tzxx" ).slideToggle( 3, function() {});
　　}
　　
</script>

                <div style="border-bottom:2px dashed #000">

				<p style="margin-left: 42pt;">&nbsp;</p>
				
                <p>导师发布信息方式：</p>
                <p>导师如果想将自己的信息发布到此页面，可以将任意格式（包括图片、附件）的word文档发送到下面任意一个邮箱，我们会第一时间将您的信息发布到此页面：</p>
                <p>张志为老师：407824606@qq.com</p>
                <p>张春月老师：zhangchunyue1224@qq.com</p>
                <p>三思网站管理员：982311099@qq.com </p>
                <p>&nbsp;</p>
                
                </div>
                <p style="margin-left: 42pt;">&nbsp;</p>
                <p style="margin-left: 24pt;">&nbsp;</p>

				<p style="margin-left: 24pt;text-align:right;">三思团队</p>
				</span>

				<p style="margin-left: 24pt;text-align:right;">2016-5-25</span></p>
				</span> 
			</div>
					</div>
					<hr style="height:1px;border:none;border-top:1px solid #555555;" />
						<div class="atshowe">
							<div class="atshowappendix"><span id="Label4"></span></div>
						</div>

				</div>

		</div>
	
 
	</div>
</div>
	</div>
</div>
<div  align="center"class="copy_layout login" style="padding:-50%; margin-top:5%;margin-bottom:2%"> <p>Copyright <%=year(now())%> <a href="http://www.three-thinking.com" target="_blank" title="三思" style="color:#000000">三思</a> 版权所有||<a href="about.asp" target="_blank" title="三思" style="color:#000000">关于三思</a>||@<a href="http://www.xidian.edu.cn/" style="color:#000000" target="_blank">西安电子科技大学 </a>threethinking版权所有|陕ICP备16002727号|<a href="http://www.miitbeian.gov.cn/" style="color:#000000" target="_blank" title="三思">工信部主页</a> </p></div>
   
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
