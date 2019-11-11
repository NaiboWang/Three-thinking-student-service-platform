 <%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
 <% Response.CodePage=65001%>
<% Response.Charset="UTF-8" %>
 <!--#include file = "loginconfirm.asp"-->
 <!--#include file="Connections/data.asp" -->
<!--#include file="Connections/mysql.asp" -->
<!--#include file="Connections/tj.asp" -->
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
Recordset3_cmd.CommandText = "SELECT * FROM student.dayofapply" 
Recordset3_cmd.Prepared = true

Set Recordset3 = Recordset3_cmd.Execute
Recordset3_numRows = 0
%>
<%
Dim Recordset4__MMColParam
Recordset4__MMColParam = Recordset3.Fields.Item("day").Value

%>
<%
Dim Recordset4
Dim Recordset4_cmd
Dim Recordset4_numRows

Set Recordset4_cmd = Server.CreateObject ("ADODB.Command")
Recordset4_cmd.ActiveConnection = MM_mysql_STRING
Recordset4_cmd.CommandText = "SELECT * FROM student.applyday WHERE ID = ?" 
Recordset4_cmd.Prepared = true
Recordset4_cmd.Parameters.Append Recordset4_cmd.CreateParameter("param1", 200, 1, 255, Recordset4__MMColParam) ' adVarChar

Set Recordset4 = Recordset4_cmd.Execute
Recordset4_numRows = 0
%>

<%
Dim Recordset6__MMColParam
Recordset6__MMColParam = "1"
If (Session("MM_Username") <> "") Then 
  Recordset6__MMColParam = Session("MM_Username")
End If
%>
<%
Dim Recordset6
Dim Recordset6_cmd
Dim Recordset6_numRows

Set Recordset6_cmd = Server.CreateObject ("ADODB.Command")
Recordset6_cmd.ActiveConnection = MM_mysql_STRING
Recordset6_cmd.CommandText = "SELECT * FROM student.applyend WHERE sno = ? and type = '推荐表'" 
Recordset6_cmd.Prepared = true
Recordset6_cmd.Parameters.Append Recordset6_cmd.CreateParameter("param1", 200, 1, 255, Recordset6__MMColParam) ' adVarChar

Set Recordset6 = Recordset6_cmd.Execute
Recordset6_numRows = 0
%>
<%
Dim Recordset3__MMColParam
Recordset3__MMColParam = "1"
If (Request.Form("ID") <> "") Then 
  Recordset3__MMColParam = request.Form("ID")
End If
%>
<!DOCTYPE html>
<html>
<head>
<title>三思-推荐表预约</title>
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
.GoStyle
    {
         color:#00F;          
         background-color: #FFFFFF;
         border: 0px none;
         cursor:pointer;
         font-size: 12px;
		 font-family:'楷体'; 
		 text-decoration:underline;
    }
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
<link href="css/menu.css" type="text/css" rel="stylesheet" />
<style type="text/css">
body,td,th {
	font-family: "楷体";
}
</style>
<script type="text/javascript" src="js/mootools.js"></script>
<script type="text/javascript" src="js/fusion.js"></script>
<script type="text/javascript">
	window.addEvent('load', function() {
		new Fusion('ul.menutop', {
			pill: 1,
			effect: 'slide',
			opacity: 1,
			hideDelay: 500,
			centered: 0,
			tweakInitial: {'x': 0, 'y': -1},
			tweakSubsequent: {'x': 1, 'y': -1},
			menuFx: {duration: 500, transition: Fx.Transitions.Back.easeInOut},
			pillFx: {duration: 250, transition: Fx.Transitions.linear}
		});
	});
  </script>
  

</head>
	
<body>
	<div class="psd">
<div class="container" style="min-height:100px">
<!-- header -->
		<div class="header" style="font-size:150%;font-weight:600;">
        <div style="background-image:url(images/t10.jpg);background-repeat: no-repeat; background-positon: 120%, 120%">
               <img src="images/logo.png" style=" margin-right:50%;position:relative; left:2%; background-position:left;background-size:cover; width:20%;height:20%"  alt=""/>
                
           <% if Recordset1.Fields.Item("性别").Value = "女" then%>
          <img src="images/userfemale.png" width="32" height="32" />
             <% else %>
          <img src="images/user.png" width="32" height="32" />
             <%end if%>
		  <%=(Recordset1.Fields.Item("姓名").Value)%>同学，欢迎你！
			</div>	  
			<div class="clearfix"> </div>
           
		</div>
        
  

<div style="clear:both"></div>	





<!-- //header -->
<div class="port"  style="font:'楷体'; min-height:100px">
  <h3>《毕业生推荐表》预约申请</h3>
  
<img src="hr-geo-sukarno-1s960x639.png"  style="  position:relative; left:3%;background-size:cover; background-position:center; width:90%;height:90%" alt=""/>
		<p class="para">&nbsp;</p>
		<div  align="center"  class="portfolio-grids" style="font-size:18px; font-family:'微软雅黑'">
     <div align="center" style="width:75%">
          <% If Recordset6.EOF Or  Recordset6.BOF Then %>
          <p  style="font-size:18px"align="center"><span class="portfolio-grids" style="font-size:18px; font-family:'微软雅黑'"><%=(Recordset1.Fields.Item("姓名").Value)%>同学</span>，在预约推荐表前，请仔细阅读网站上的“<a href="https://www.three-thinking.com/information.asp?ID=32" target="_blank" style=" text-decoration:underline">推荐表预约说明</a>”。</p>
          
   <div id="check">
  <iframe src="applyinforofend.html" style="border:#000 solid;width:100%"  height="2400" frameborder="0" scrolling="yes">
  <p><a href="https://www.three-thinking.com/information.asp?ID=32">你的浏览器不支持iframe页面嵌套，请点击这里访问页面内容。</a>
  </iframe>
  <input id="read"type="checkbox" style="width:18px;height:18px" required>我已阅读上方有关毕业生推荐表的相关信息
</p>

  <button onclick="show()">开始填写信息 </button>
  </div>
  <script>
  window.onload=hide;
  function hide(){ 
  //document.getElementById("iframe").scrollTo(0,500);
  document.getElementById("graduForm").style.display="none";
  }
  function show(){
	  if(document.getElementById("read").checked){
		  document.getElementById("check").style.display="none";
		  document.getElementById("graduForm").style.display="block";
		  }
		  else{
			  alert("请先阅读相关信息");
		  }
	  }
  </script>
          <div id="graduForm">
  <p  style="font-size:18px"align="center">毕业生推荐表每位同学只能<strong>预约一次</strong>，如果你考虑好了，就在下方填写手机号，并点击下方按钮进行预约。  </p>
  <form name="form1" method="post" action="applyenddeal.asp">
    <p>
      <label for="tel"><span style="font-size:18px">手机号：</span></label>
      <input type="text" placeholder="学院联系用" name="tel" id="tel">
      </p>
   
    <p><span style="font-size:18px"><span style="margin-top:20px">
      <input type="submit"  onClick="return check()" name="12" id="12" value="预约" style="font-size: 18px;
  font-weight: 300 !important;
  position:relative;
  color: #fff;
  cursor: pointer;
  outline: none;
  padding: 10px 15px;
  width: 25%;
  border: none;
  background: #00BBFF ;
  border-radius: 2px;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
  text-transform: uppercase;" onMouseOver="this.style.background='#9900FF'" onMouseOut="this.style.background='#00BBFF '" />
    </span></span></p>
</form>
  <p  style="font-size:18px"align="center">&nbsp;</p>
  <p>
    <%else%>
    <%=(Recordset1.Fields.Item("姓名").Value)%>同学，你已经于<%=(Recordset6.Fields.Item("time").Value)%>在本系统预约过《毕业生推荐表》，申请状态是：<strong><%=(Recordset6.Fields.Item("state").Value)%></strong>，你不能再次在本系统预约推荐表。  </p>
  <p><%if Recordset6.Fields.Item("state").Value = "未处理" then%>
    ------------------------------------------------------------------------------------------
    <% if datediff("s",date() & " " & "12:40:00",now()) <= 0 then %>
  <p  style="font-size:18px"align="center">请你在<strong><%=(Recordset4.Fields.Item("today").Value)%>（<%=(Recordset4.Fields.Item("weektoday").Value)%>）</strong>的12点50分去导员办公室领取推荐表。</p>
<p  style="font-size:18px"align="center">推荐表在导员办公室门口的<strong>电视上放着</strong>，自行领取<strong>一张</strong>即可。</p>
  <%else%>
  <p  style="font-size:18px"align="center">请你在下一个工作日的中午12：50，即<strong><%=(Recordset4.Fields.Item("tomorrow").Value)%>（<%=(Recordset4.Fields.Item("weektomorrow").Value)%>）</strong>的12点50分去导员办公室领取推荐表。</p>
<p  style="font-size:18px"align="center">推荐表在导员办公室门口的<strong>电视上放着</strong>，自行领取<strong>一张</strong>即可。</p>
  <p>
    <%end if%>
    ------------------------------------------------------------------------------------------
  <%end if%>
    </p>
  <p>以下是推荐表填写说明。 </p>
  <p>
    <iframe src="applyinforofend.html" style="border:#000 solid;width:100%"  height="2400" frameborder="0" scrolling="yes">
    <p><a href="https://www.three-thinking.com/information.asp?ID=32">你的浏览器不支持iframe页面嵌套，请点击这里访问页面内容。</a>     
    </iframe>
  </p>
  <p>
    <% End If ' end Not Recordset6.EOF Or NOT Recordset6.BOF %>
  </p>
  </p>
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
       <script>
	  function check() //项目申报检测
{
	
		 ss = document.getElementById('tel').value;
		re = /^[0-1]\d{10}$/
		if (re.test(ss)) {} else {
			alert("请输入正确的联系电话");
			return false;
}

	
    if (confirm('您确认要预约推荐表吗？')) 
 return true;
    else
	 return false;
	

}

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
	$( "div.menu" ).slideToggle( 3, function() {});
　　}
　　
</script>

<!-- //here ends scrolling icon -->
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
<%
Recordset6.Close()
Set Recordset6 = Nothing
%>
<%
Recordset4.Close()
Set Recordset4 = Nothing
%>
<%
Recordset3.Close()
Set Recordset3 = Nothing
%>