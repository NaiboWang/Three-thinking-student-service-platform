<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
Recordset1_numRows = Recordset1_numRows + Repeat1__numRows
%>
<!DOCTYPE HTML>
<html>
<head>
<title>三思·通知专区</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Wed Day Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style4.css" rel='stylesheet' type='text/css' />	
<link href="css/notice.css" rel='stylesheet' type='text/css' />	
<!-- start-smoth-scrolling -->

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
			
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
　</script>

<style>
a:hover
{
	text-decoration:underline;
	}
</style>
<!--webfonts-->
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Bizz Wow Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->


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
        <img  class="zxtz"src="images/textinfor.png" style="background-position:center;left:35%;position:relative;background-size:cover; min-height:50px; min-width:200px; width:30%;height:30%"  longdesc="news.asp">&nbsp;
	   <div class="clearfix"> </div>
</div>
<div class="container">
  <div class="grid_3 grid_5"  style="height:60px">
				 
                 <div id="wz" style="padding-left:5%"><span><b>您的位置：</b><a href="/">三思主页</a>&nbsp;&gt;&nbsp;<a href="#">最新通知</a>&nbsp;&gt;&nbsp;</span>
					
			   </div>
                 

			</div>
 
 
 
 <!--右边-->
 <div id="right_1" class="rightf" style="float:right; margin-top:-25px;margin-left:5%;height:500px;margin-right:12px;*margin-right:6px;">
				<div class="b" style=" margin-bottom:2px;border-bottom:solid 2px">
					<div class="linear"><span style="padding-left:3%;"><strong>快速访问</strong></span></div>
					
				</div>
				<div class="b" style="margin-top:8px;padding-bottom:15px;">
					<!--div class="r_title ls">热门视频</div-->
					<div id="r_2" class="clearfix">

						<div class="sp">
							<a href="news.asp" title="西电导师信息介绍 " target="_blank"><img src="images/tc.png" width="125" height="90/">	
							<span>西电导师信息介绍</span></a>
						</div>

						<div class="sp">
							<a href="summercamp.php?lx=1&sx=0" title="夏令营信息汇总 " target="_blank"><img src="images/sc.png" width="125" height="90/">	
							<span>夏令营信息汇总</span></a>
						</div>

						<div class="sp">
							<a href="http://222.25.176.4:8080" title="打印预约成绩单" target="_blank"><img src="images/swxt.png" width="125" height="90/">	
							<span>打印预约成绩单</span></a>
						</div>

						<div class="sp">
							<a href="http://222.25.176.4/" title="实验选课" target="_blank"><img src="images/syxk.png" width="125" height="90/">	
							<span>实验选课</span></a>
						</div>

					</div>
				</div>	
				<!--div class="b" style="margin-top:20px;">
					<div class="r_title ls" style="background:#e7e7e7;"><span style="padding-left:3%;"><strong>关于我们</strong></span></div>
					<div id="tab" style="padding-left:1%">
						<ul style="list-style:none;color:#000000;font-size:10px;;text-align:left;font-family:'微软雅黑'">
							<li>网站名称：三思（threethinking）</li>
							<li>网址：http://www.three-thinking.com</li>
							<li>网站类型：IT/西安电子科技大学/辅助事务管理 </li>
							<li>直属单位：计算机学院“三思”服务团队</li>
							<li>服务对象：西安电子科技大学计算机学院学生</li>
							<li>顾问：王泉/马建峰/党文学/崔江涛/沈玉龙/王卫东</li>
							<li>主管：张志为/张春月/赵岩松/冉宪宇 </li>
							<li>备案信息：陕ICP备16002727号 </li>
							<li>电话：029-81891128</li>
							<li>邮箱：xd2013cs@126.com</li>
							<li>微信号：fudaoyuanweixin</li>
							<li>QQ群：我们的辅导员（196766604）</li>
						</ul>
					</div>
					
					
					
				</div-->
               
			</div>
 <!--右边-->  
			<script>
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
	$( "div.rightf" ).slideToggle( 3, function() {})
$( "img.zxtz" ).slideToggle( 3, function() {})
$( "p.tzxx" ).slideToggle( 3, function() {})
$( "img.xd" ).slideToggle( 3, function() {})

　　}
　　-->

			</script>
						
					
				
                    
 <hr style="margin-top:0;margin-right:0;width:760px;height:1px;border:none;border-top:1px solid #555555;" />
<!--新闻内容-->
<div id="list_wrap">
	
	<div id="list_main" style=" margin-top:-5px;min-height:100px">
      <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) 
%>
  <ul>
    <li><span class="w"><a href="information.asp?ID=<%=(Recordset1.Fields.Item("ID").Value)%>"  target="_blank"><%=(Recordset1.Fields.Item("title").Value)%></a></span><span class="wr"><%=(Recordset1.Fields.Item("time").Value)%></span></li>
    
    
    
  </ul>
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>
    </div>
				<!--翻页测试-->
<div id="innerpage" style="margin-top:5%;text-align:center"></div>
<script type="text/javascript">
//Page
var obj,j;
var page=0;
var nowPage=0;  //当前页
var listNum=16;  //每页显示条数
var PagesLen;   //总页数
var PageNum=10;  //分页链接数(5个)
onload=function(){
obj=document.getElementById("list_main").getElementsByTagName("ul");
j=obj.length
PagesLen=Math.ceil(j/listNum);
upPage(0)
}
function upPage(p){
nowPage=p
//内容变换
for (var i=0;i<j;i++){
obj[i].style.display="none"
}
for (var i=p*listNum;i<(p+1)*listNum;i++){
if(obj[i])obj[i].style.display="block"
}
strS='<a href="JavaScript:FirstPage()" onclick="upPage(0)">首页</a>  '
var PageNum_2=PageNum%2==0?Math.ceil(PageNum/2)+1:Math.ceil(PageNum/2)
var PageNum_3=PageNum%2==0?Math.ceil(PageNum/2):Math.ceil(PageNum/2)+1
var strC="",startPage,endPage;
if (PageNum>=PagesLen) {startPage=0;endPage=PagesLen-1}
else if (nowPage<PageNum_2){startPage=0;endPage=PagesLen-1>PageNum?PageNum:PagesLen-1}//首页
else {startPage=nowPage+PageNum_3>=PagesLen?PagesLen-PageNum-1: nowPage-PageNum_2+1;var t=startPage+PageNum;endPage=t>PagesLen?PagesLen-1:t}
for (var i=startPage;i<=endPage;i++){
 if (i==nowPage)strC+='<a href="JavaScript:curPage()" class="curpage" onclick="upPage('+i+')">'+(i+1)+'</a> '
 else strC+='<a href="#JavaScript:Page()" onclick="upPage('+i+')">'+(i+1)+'</a> '
}
if(nowPage>0) strC+='<a href="#JavaScript:Page()" onclick="upPage('+(nowPage-1)+')">上一页</a>'  
	if((nowPage+1)<=PagesLen-1)  strC+='<a href="#JavaScript:Page()" onclick="upPage('+(nowPage+1)+')">下一页</a>'  
strE=' <a href="JavaScript:LastPage()" onclick="upPage('+(PagesLen-1)+')">尾页</a>  '
strE2=nowPage+1+"/"+PagesLen+"页"
document.getElementById("innerpage").innerHTML=strS+strC+strE+strE2
}
</script>
			
<!--翻页测试-->
  </div>
 
</div>
<div  align="center"class="copy_layout login" style="padding:-50%; margin-top:5%"> <p>Copyright 2016 <a href="http://www.three-thinking.com" target="_blank" title="三思" style="color:#000000">三思</a> 版权所有||<a href="about.asp" target="_blank" title="三思" style="color:#000000">关于三思</a>||@<a href="http://www.xidian.edu.cn/" style="color:#000000" target="_blank">西安电子科技大学 </a>threethinking版权所有|陕ICP备16002727号|<a href="http://www.miitbeian.gov.cn/" style="color:#000000" target="_blank" title="三思">工信部主页</a> </p></div>
   
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
