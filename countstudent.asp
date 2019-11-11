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
Dim Recordset3__MMColParam
Recordset3__MMColParam = "1"
If (Request.Form("ID") <> "") Then 
  Recordset3__MMColParam = request.QueryString("ID")
End If
%>
<%
Dim Recordset3
Dim Recordset3_cmd
Dim Recordset3_numRows

Set Recordset3_cmd = Server.CreateObject ("ADODB.Command")
Recordset3_cmd.ActiveConnection = MM_mysql_STRING
Recordset3_cmd.CommandText = "SELECT * FROM student.countinfor WHERE md5pass ='"&request.QueryString("ID")&"'"
Recordset3_cmd.Prepared = true
Recordset3_cmd.Parameters.Append Recordset3_cmd.CreateParameter("param1", 5, 1, -1, Recordset3__MMColParam) ' adDouble

Set Recordset3 = Recordset3_cmd.Execute
Recordset3_numRows = 0
%>
<%
Dim Recordset4
Dim Recordset4_cmd
Dim Recordset4_numRows

Set Recordset4_cmd = Server.CreateObject ("ADODB.Command")
Recordset4_cmd.ActiveConnection = MM_mysql_STRING
Recordset4_cmd.CommandText = "SELECT * FROM student."&Recordset3.Fields.Item("inforname").Value
Recordset4_cmd.Prepared = true

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
Recordset6_cmd.CommandText = "SELECT * FROM student.countprivilege WHERE sno = ?" 
Recordset6_cmd.Prepared = true
Recordset6_cmd.Parameters.Append Recordset6_cmd.CreateParameter("param1", 200, 1, 255, Recordset6__MMColParam) ' adVarChar

Set Recordset6 = Recordset6_cmd.Execute
Recordset6_numRows = 0
%>
<%
Dim Recordset7__MMColParam
Recordset7__MMColParam = "1"
If (Session("MM_Username") <> "") Then 
  Recordset7__MMColParam = Session("MM_Username")
End If
%>
<%
Dim Recordset7
Dim Recordset7_cmd
Dim Recordset7_numRows

Set Recordset7_cmd = Server.CreateObject ("ADODB.Command")
Recordset7_cmd.ActiveConnection = MM_mysql_STRING
Recordset7_cmd.CommandText = "SELECT * FROM student.countable"&Recordset3.Fields.Item("ID").Value&" WHERE 学号 = ?" 
Recordset7_cmd.Prepared = true
Recordset7_cmd.Parameters.Append Recordset7_cmd.CreateParameter("param1", 200, 1, 255, Recordset7__MMColParam) ' adVarChar

Set Recordset7 = Recordset7_cmd.Execute
Recordset7_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
Recordset4_numRows = Recordset4_numRows + Repeat1__numRows
%>
<!DOCTYPE html>
<html>
<head>
<title>三思-统计</title>
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
<link href="css/menu.css" type="text/css" rel="stylesheet" />
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
  <h3>统计：<%=(Recordset3.Fields.Item("title").Value)%></h3>
		<p class="para" style="font-size:18px; font-family:'微软雅黑'">统计说明：<span></span><%=(Recordset3.Fields.Item("content").Value)%></p>
        <% If Not Recordset6.EOF Or Not Recordset6.BOF Then %>
  <p  align="center">————————————————————</p>
         
        <form id="form2" name="form2" method="post" action="countlook.asp" target="_blank">
        <p class="para">您是班委，<input  type="submit"  name="button" id="button" value="点击这里" />查看班级统计情况。</p>    
        <input type="hidden" id="ID" name="ID" value="<%=(Recordset3.Fields.Item("ID").Value)%>" />
        </form>
        
          <p  align="center">————————————————————</p>
          
          <% End If ' end Not Recordset6.EOF Or NOT Recordset6.BOF %>
<img src="hr-geo-sukarno-1s960x639.png"  style="  position:relative; left:3%;background-size:cover; background-position:center; width:90%;height:90%" alt=""/>
		<div  align="center"  class="portfolio-grids" style="font-size:18px; font-family:'微软雅黑'">
		  
		    <% if Recordset3.Fields.Item("openornot").Value = "open" then%>
		
		  <p>———————————————— </p>
		  <p align="center">请填写和修改下方文本框中的内容</p>
		  <p align="center">信息没有问题也要<strong style="color:#00F">至少提交一次</strong>以使管理员知道你已知晓该统计</p>
		  <p align="center">统计开放期间，可<strong>随时修改</strong>所填内容</p>
		  <p align="center">————————————————</p>
          <% If Not Recordset7.EOF Or Not Recordset7.BOF Then %>
  <p align="center" style="color:#00F">【您已提交过该统计信息，您还可以在统计开放期间修改您的信息】</p>
  <% End If ' end Not Recordset7.EOF Or NOT Recordset7.BOF %>
<form action="countsubmit.php" method="post" name="form1" id="form1" onSubmit="return check()">
            <input type="hidden" id="ID" name="ID" value="<%=(Recordset3.Fields.Item("ID").Value)%>" />
            <input type="hidden" id="md5" name="md5" value="<%=request.QueryString("ID")%>" />
            <style>
			#counttable
			{
				margin:0;
				width:100%;
			}
			#counttable tbody tr
			{
				position:relative;
			}
			#counttable tbody td
			{
				width:50%;
				padding:2px;
			}
			#counttable tbody td input[type="text"]
			{
				margin-left:20px;
			}
			</style>
		  <table id="counttable" align="left" border="0">
          <% If Recordset7.EOF And Recordset7.BOF Then %>
            <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset4.EOF)) 
%>
<tr>
  
  <td align="right"><%=(Recordset4.Fields.Item("title").Value)%>:</td>
    <% if (Recordset4.Fields.Item("ifreadonly").Value) = "yes" then %>
    <td class="righ"><input type="text" name="<%=(Recordset4.Fields.Item("title").Value)%>" id="<%=(Recordset4.Fields.Item("title").Value)%>" style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE:none;margin-left:20px" readonly = "readonly" value="<%
				if (Recordset4.Fields.Item("ifnature").Value) = "yes" then
				response.write(Recordset1.Fields.Item(Recordset4.Fields.Item("title").Value).Value)
				end if
			%>"></td>
    <%else%>
    <td>
      <input align="middle" type="text" name="<%=(Recordset4.Fields.Item("title").Value)%>" id="<%=(Recordset4.Fields.Item("title").Value)%>"  value="<%
				if (Recordset4.Fields.Item("ifnature").Value) = "yes" then
				response.write(Recordset1.Fields.Item(Recordset4.Fields.Item("title").Value).Value)
				end if
			%>"></td>
  
<%end if%>
            </tr>
              <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset4.MoveNext()
Wend
%>
<%else%>
   <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset4.EOF)) 
%>
<tr>
  
  <td align="right"><%=(Recordset4.Fields.Item("title").Value)%>:</td>
    <% if (Recordset4.Fields.Item("ifreadonly").Value) = "yes" then %>
    <td><input type="text" name="<%=(Recordset4.Fields.Item("title").Value)%>" id="<%=(Recordset4.Fields.Item("title").Value)%>" style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE:none;margin-left:20px" readonly = "readonly" value="<%response.write(Recordset7.Fields.Item(Recordset4.Fields.Item("title").Value).Value)%>"></td>
    <%else%>
    <td>
      <input align="middle" type="text" name="<%=(Recordset4.Fields.Item("title").Value)%>" id="<%=(Recordset4.Fields.Item("title").Value)%>"  value="<%response.write(Recordset7.Fields.Item(Recordset4.Fields.Item("title").Value).Value)%>"></td>
  
<%end if%>
            </tr>
              <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset4.MoveNext()
Wend
%>


          <% End If ' end Recordset7.EOF And Recordset7.BOF %>
          </table>
          <div class="clearfix"></div>
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
	document.getElementById("counttable").width = 200;
　　}
　　
</script>
          <p style="padding-top:20px">
            <input type="submit" name="12" id="12" value="提交" style="font-size: 16px;
  font-weight: 300 !important;
  position:relative;
  color: #fff;
  cursor: pointer;
  outline: none;
  padding: 10px 15px;
  width: 20%;
  border: none;
  background: #00BBFF ;
  border-radius: 2px;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
  text-transform: uppercase;margin-left:12px" onmouseover="this.style.background='#9900FF'" onmouseout="this.style.background='#00BBFF '" />
          </p>
          </form>
          <%else%>
          管理员未开放该统计，不能进行统计。
          <%end if%>
          <script>
		  function check()
		  {
		  	if(confirm('确认提交信息吗？'))
				   return true;
					else
				   return false;
				   }
		  </script>
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
<%
Recordset6.Close()
Set Recordset6 = Nothing
%>
<%
Recordset7.Close()
Set Recordset7 = Nothing
%>
<%
Recordset4.Close()
Set Recordset4 = Nothing
%>
