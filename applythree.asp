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
Recordset6_cmd.CommandText = "SELECT * FROM student.applyend WHERE sno = ? and type = '三方协议'" 
Recordset6_cmd.Prepared = true
Recordset6_cmd.Parameters.Append Recordset6_cmd.CreateParameter("param1", 200, 1, 255, Recordset6__MMColParam) ' adVarChar

Set Recordset6 = Recordset6_cmd.Execute
Recordset6_numRows = 0
%>
<%
Dim Recordset5__MMColParam
Recordset5__MMColParam = "1"
If (Session("MM_Username") <> "") Then 
  Recordset5__MMColParam = Session("MM_Username")
End If
%>
<%
Dim Recordset5
Dim Recordset5_cmd
Dim Recordset5_numRows

Set Recordset5_cmd = Server.CreateObject ("ADODB.Command")
Recordset5_cmd.ActiveConnection = MM_mysql_STRING
Recordset5_cmd.CommandText = "SELECT * FROM student.applythree WHERE 学号 = ?" 
Recordset5_cmd.Prepared = true
Recordset5_cmd.Parameters.Append Recordset5_cmd.CreateParameter("param1", 200, 1, 255, Recordset5__MMColParam) ' adVarChar

Set Recordset5 = Recordset5_cmd.Execute
Recordset5_numRows = 0
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
<title>三思-三方协议盖章预约</title>
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
		 font-family:'微软雅黑'; 
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
	font-family: "微软雅黑";
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
  <h3>“三方协议”盖章预约</h3>
  
<img src="hr-geo-sukarno-1s960x639.png"  style="  position:relative; left:3%;background-size:cover; background-position:center; width:90%;height:90%" alt=""/>
		<p class="para">&nbsp;</p>
		<div  align="center"  class="portfolio-grids" style="font-size:18px; font-family:'微软雅黑'">
     <div align="center" style=" display:block;width:75%">
     <%if Recordset5.Fields.Item("接受单位名称").Value <> "保研" then%>
          <% If Recordset6.EOF Or  Recordset6.BOF Then %>
       <p  style="font-size:18px"align="center"><span class="portfolio-grids" style="font-size:18px; font-family:'微软雅黑'"><%=(Recordset1.Fields.Item("姓名").Value)%>同学</span>，在预约盖章前，请<strong>仔细阅读</strong>网站上的“<a href="https://www.three-thinking.com/information.asp?ID=32" target="_blank" style=" text-decoration:underline">三方协议盖章预约说明</a>”（位于下半部分）。</p>
  <p  style="font-size:18px"align="center">三方协议盖章每位同学只能<strong>预约一次</strong>，如果你确认四份协议上所有<strong>应填信息</strong>和说明上要求的内容都准备好了，就在下方补全信息进行预约。</p>
  <div id="check">
  
  <iframe src="applyinforofthree.html"  height="3150" frameborder="0" scrolling="yes" style="border:#000 solid;width:100%">
<a href="https://www.three-thinking.com/information.asp?ID=32">你的浏览器不支持iframe页面嵌套，请点击这里访问页面内容。</a>
</iframe>
  <p>
    <input id="read"type="checkbox"  style="width:18px;height:18px"  required>
    我已阅读上方有关三方协议领取的相关内容
</p>

  <button onclick="show()">开始填写信息 </button>
  </div>
  <script>
  window.onload=hide;
  function hide(){ 
  document.getElementById("showbox").style.display="none";
  }
  function show(){
	  if(document.getElementById("read").checked){
		  document.getElementById("check").style.display="none";
		  document.getElementById("showbox").style.display="block";
		  }
		  else{
			  alert("请先阅读相关信息");
		  }
	  }
  </script>
  <div id="showbox">
   <p  style="font-size:18px"align="center">注：下方信息<strong>非常重要</strong>，请一定要填写正确，只能<strong>填写一次</strong>。</p>
  <form  name="form1" method="post" action="applythreedeal.asp">
  <p  style="font-size:18px"align="center"><table width="600"  height="400"  border="0" style=" min-height:650px;display:compact;font-size:18px; font-family:'微软雅黑'">
    <tr >
      <td align="right">学号：</td>
      <td><%=(Recordset5.Fields.Item("学号").Value)%></td>
    </tr>
    <tr >
      <td align="right">姓名：</td>
      <td><%=(Recordset5.Fields.Item("姓名").Value)%></td>
    </tr>
    <tr >
      <td align="right">性别：</td>
      <td><%=(Recordset5.Fields.Item("性别").Value)%></td>
    </tr>
    <tr >
      <td align="right">协议书号：</td>
      <td><%=(Recordset5.Fields.Item("协议书号").Value)%></td>
    </tr>
    <tr >
      <td align="right">专业名称：</td>
      <td><%=(Recordset5.Fields.Item("专业名称").Value)%></td>
    </tr>
      <tr >
      <td align="right">手机号：</td>
      <td width="350"><input type="text" placeholder="学院联系用" name="tel" id="tel" style="width:100%"></td>
      </tr>
     
      
      
    <tr >
      <td align="right">学籍所在地：</td>
      <td width="350">
      
        <input type="text" name="hometown" id="hometown" placeholder="高考户籍所在地，格式:省市县/区" style="width:100%">
      </td>
    </tr>
    <tr >
      <td align="right">接收单位名称：</td>
      <td>
        <textarea name="company" id="company" style="min-height:80px; width:100%" placeholder="公司全称，以录用函上的公司名称为准，千万不要填错!!!"></textarea></td>
    </tr>
    <tr >
      <td align="right">户口是否在校：</td>
      <td><input name="radio" type="radio" id="hk" value="否" style="width:18px;height:18px" checked="CHECKED">
        <label for="hk">否 
          <input type="radio" style="width:18px;height:18px" name="radio" id="hk2" value="是">
        是</label></td>
    </tr>
    <tr >
      <td align="right">所签单位是否为在双选会中签约单位：</td>
      <td><input name="sxh" type="radio" id="sxh" value="否" style="width:18px;height:18px" checked="CHECKED">
        <label for="hk">否 
          <input type="radio" style="width:18px;height:18px" name="sxh" id="sxh2" value="是">
        是</label></td>
    </tr>
    <tr >
      <td  align="center" colspan="2"><input type="submit"  onClick="return check()" name="12" id="12" value="预约" style="font-size: 18px;
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
  text-transform: uppercase;" onmouseover="this.style.background='#9900FF'" onmouseout="this.style.background='#00BBFF '" /></td>
      
    </tr>
  </table></p>
  <p  style="font-size:18px"align="center"><span style="margin-top:20px">
    
  </span></p>
  <p>
  </form>
  
  </div>
    <p>
      <%else%>
      <%=(Recordset1.Fields.Item("姓名").Value)%>同学，你已经于<%=(Recordset6.Fields.Item("time").Value)%>在本系统预约过三方协议盖章，申请状态是：<strong><%=(Recordset6.Fields.Item("state").Value)%></strong>，你不能再次在本系统预约三方协议盖章。</p>
    </p>
    <p><%if Recordset6.Fields.Item("state").Value = "未处理" then%>
      ------------------------------------------------------------------------------------------
      <% if datediff("s",date() & " " & "13:30:00",now()) <= 0 then %>
    <p  style="font-size:18px"align="center">请你在<strong><%=(Recordset4.Fields.Item("today").Value)%>（<%=(Recordset4.Fields.Item("weektoday").Value)%>）</strong>的12点50分去导员办公室按流程盖三方协议章子。</p>
  <p  style="font-size:18px"align="center">办公时间为：<strong style="color:#00F">12：50——13：30</strong>，<strong>过期不候</strong>，请按时领取。</p>
  <%else%>
  <p  style="font-size:18px"align="center">请你在下一个工作日的中午12：50，即<strong><%=(Recordset4.Fields.Item("tomorrow").Value)%>（<%=(Recordset4.Fields.Item("weektomorrow").Value)%>）</strong>的12点50分去导员办公室盖三方协议章子。  </p>
  <p  style="font-size:18px"align="center">办公时间为：<strong style="color:#00F">12：50——13：30</strong>，<strong>过期不候</strong>，请按时领取。</p>
  <%end if%>
  -------------------------------------------------------------------------------------------
  <%end if%>
 <p  style="font-size:18px" align="center">您已经提交的三方协议信息如下，如<strong>信息有误</strong>，请联系三思管理员解决。</p>

  <table width="400" border="0" style="font-size:18px; font-family:'黑体'">
    <tr >
      <td align="right">学号：</td>
      <td><%=(Recordset5.Fields.Item("学号").Value)%></td>
    </tr>
    <tr >
      <td align="right">姓名：</td>
      <td><%=(Recordset5.Fields.Item("姓名").Value)%></td>
    </tr>
    <tr >
      <td align="right">性别：</td>
      <td><%=(Recordset5.Fields.Item("性别").Value)%></td>
    </tr>
    <tr >
      <td align="right">协议书号：</td>
      <td><%=(Recordset5.Fields.Item("协议书号").Value)%></td>
    </tr>
    <tr >
      <td align="right">专业名称：</td>
      <td><%=(Recordset5.Fields.Item("专业名称").Value)%></td>
    </tr>
    <tr >
      <td align="right">学籍所在地：</td>
      <td><%=(Recordset5.Fields.Item("学籍所在地").Value)%></td>
    </tr>
    <tr >
      <td align="right">接收单位名称：</td>
      <td><%=(Recordset5.Fields.Item("接受单位名称").Value)%></td>
    </tr>
    <tr >
      <td align="right">户口是否在校：</td>
      <td><%=(Recordset5.Fields.Item("户口是否在校").Value)%></td>
    </tr>
  </table>
  <p>
  <p align="center">以下是三方协议相关事务说明。</p>
  <p>
    <iframe src="applyinforofthree.html"  height="3150" frameborder="0" scrolling="yes" style="border:#000 solid;width:100%"> <a href="https://www.three-thinking.com/information.asp?ID=32">你的浏览器不支持iframe页面嵌套，请点击这里访问页面内容。</a></iframe>
  </p>
    <% End If ' end Not Recordset6.EOF Or NOT Recordset6.BOF %>
  </p>
  
  <p>
    <%else%>
    你是保研的学生，无法预约此项目。
    <%end if%>
</p>
 
  
  </p>
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


    if (confirm('您确认信息无误，并要预约三方协议盖章吗？')) {
  if (confirm('您真的确认信息无误，并要预约三方协议盖章吗？'))
 return true;
 else
 return false;
 }
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
Recordset5.Close()
Set Recordset5 = Nothing
%>
<%
Recordset4.Close()
Set Recordset4 = Nothing
%>
<%
Recordset3.Close()
Set Recordset3 = Nothing
%>
