<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/tj.asp" -->
<!--#include file="Connections/mysql.asp" -->

<%
Dim Recordset2
Dim Recordset2_cmd
Dim Recordset2_numRows



Set Recordset2_cmd = Server.CreateObject ("ADODB.Command")
Recordset2_cmd.ActiveConnection = MM_mysql_STRING
Recordset2_cmd.CommandText = "SELECT * FROM student.teacher where ID = "& request.QueryString("ID") 
Recordset2_cmd.Prepared = true

Set Recordset2 = Recordset2_cmd.Execute
Recordset2_numRows = 0
%>
<%

Set Command1 = Server.CreateObject ("ADODB.Command")
Command1.ActiveConnection = MM_mysql_STRING
Command1.CommandText = "UPDATE student.teacher  SET num = num +1 WHERE ID =  "& request.QueryString("ID") 
Command1.CommandType = 1
Command1.CommandTimeout = 0
Command1.Prepared = true
sessionnews = "sessionnews" &  request.QueryString("ID") 
If Session(sessionnews)<>"true" Then
    Session(sessionnews)="true"
	
Command1.Execute()
end if
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
a:hover{text-decoration:underline;color:#60F;}
</style>

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
     <p  align="center" class = "xddsx" style="display:none; font-size:30px ">西电导师信息介绍</p>
		<img class="xdds" src="images/teachernews.png" style="background-position:center;left:28%;position:relative;background-size:cover; min-height:50px; min-width:200px; width:40%;height:40%"  longdesc="news.asp">
	   <div class="clearfix"> </div>
	</div>
	<div class="container">
			 <div class="grid_3 grid_5" >
				 
                
					 <div id="wz" style="padding-left:5%"><span><b>您的位置：</b><a href="index.asp" style="color:#000">三思主页</a>&nbsp;&gt;&nbsp;<a href="inforlist.asp" style="color:#000">最新通知</a>&nbsp;&gt;&nbsp;<a href="news.asp" style="color:#000">导师信息介绍</a></span></div>
                

			</div>
 
 <div id="list_wrap"><!--新闻内容-->
	<div id="list_main">
		<div class="maindiv">
				<div class="atshowa">
					<div class="atshowname" style="text-align:center;color:#009;font-size:23px;font-weight:bold;line-height:1.5em;margin-bottom:10px;height:auto!important"><%=(Recordset2.Fields.Item("title").Value)%></div>
				</div>
				<div class="atshowb">
					<div class="atshowmessage" style="text-align:center;"><span id="Label2">&nbsp;&nbsp;发布人：<span class="atshowmessage" style="text-align:center;"><%=(Recordset2.Fields.Item("publisher").Value)%></span> &nbsp;&nbsp;发布时间:&nbsp;<%=FormatDateTime((Recordset2.Fields.Item("time").Value),1)%>&nbsp;&nbsp;&nbsp;&nbsp; 浏览次数：</span><%=(Recordset2.Fields.Item("num").Value)%></div>
				</div>
                <hr style="height:1px;border:none;border-top:1px solid #555555;" />
				<div id="change_content1">
					

					<div class="atshowd">
						<div class="atshowcontent" style="padding-left:3%;padding-right:3%;font-size:14px;line-height:1.5em; width:97%; margin:0 auto  ">
				

			
               <%=(Recordset2.Fields.Item("content").Value)%>

				<p style="margin-left: 24pt;text-align:right;">三思团队				</p></span>			
				</span></div>
					</div>
					<hr style="height:1px;border:none;border-top:1px solid #555555;" />
						<div class="atshowe">
							<div class="atshowappendix"><span id="Label4"></span></div>
						</div>

				</div>

		</div>
	          <script>
	function mychange(xlyid,xlydate)
	{
		var b=document.getElementById(xlyid);
		b.style.color="blue";
		b.innerHTML=xlydate;
		
	}
	function mychange2(xlyid,xlyday)
	{
		var b=document.getElementById(xlyid);
		b.style.color="black";
		b.innerHTML=xlyday+"天";
	}
        </script>
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
	$( "img.xdds" ).slideToggle( 3, function() {});
	$( "p.xddsx" ).slideToggle( 3, function() {});
　　}
　　
</script>

 
	</div>
</div>
	</div>
</div>
<div  align="center"class="copy_layout login" style="padding:-50%; margin-top:5%;margin-bottom:2%"> <p>Copyright <%=year(now())%> <a href="http://www.three-thinking.com" target="_blank" title="三思" style="color:#000000">三思</a> 版权所有||<a href="about.asp" target="_blank" title="三思" style="color:#000000">关于三思</a>||@<a href="http://www.xidian.edu.cn/" style="color:#000000" target="_blank">西安电子科技大学 </a>threethinking版权所有|陕ICP备16002727号|<a href="http://www.miitbeian.gov.cn/" style="color:#000000" target="_blank" title="三思">工信部主页</a> </p></div>
<hr style="height:1px;border:none;border-top:1px solid #555555;" />
   
</body>
</html>

<%
Recordset2.Close()
Set Recordset2 = Nothing
%>
