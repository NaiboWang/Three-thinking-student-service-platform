<!DOCTYPE HTML>
<html>
<head>
<title>三思·推免系统专区</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Wed Day Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style4.css" rel='stylesheet' type='text/css' />	
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!--webfonts-->
  <link href='fontssummer.css' rel='stylesheet' type='text/css'>
<!--//webfonts-->
</head>
<body>
<!--start-home-->
<!-- header --><!-- //header -->
<!-- banner -->
<div class="banner two">
		<div class="container" >
			<div class="banner-navigation" style="padding:1% 1% 1% 1%">

					
				    <a href="http://www.three-thinking.com" target="_blank"> <img src="\images\logo1.png" style="background-position:center;position:relative;background-size:cover; min-height:50px; min-width:200px; width:15%;height:15%" alt=""/></a>
	  <a href="http://www.xidian.edu.cn" target="_blank"><img class="xd" src="images/scorelogowhite.png" style="position:relative; left:60%; background-position:left;background-size:cover; width:20%;height:20%"  alt=""/></a>

					
			  <!--script-for-menu-->
							
					<!--script-for-menu-->
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
<!--typography-->
<div class="typrography">
	 <div class="container">
     <p  align="center" class = "yyjh" style="display:none; font-size:23px ">各学校/国家推免系统汇总</p>
	      <img  class="xlytp" src="\images\tm.png" style="background-position:center;left:17%;position:relative;background-size:cover; min-height:50px; min-width:200px; width:70%;height:80%" alt=""/>
	
	   <div class="clearfix"> </div>
</div>
<div class="container" style=" margin-left:5%; width:90%; margin-top:15px">
			 
				 <h3>排序方式<span class="bjsj" style="float:right;text-align:right" id=time>?</span></h3>
                 
                 
                 <script>
function show() 
{ 
now=new Date(); 
year=now.getFullYear(); 
month=now.getMonth()+1; 
date=now.getDate(); 
hours=now.getHours(); 
minutes=now.getMinutes(); 
var ary = Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
var day = new Date();
seconds=now.getSeconds(); 
if(minutes<=9) 
minutes="0"+minutes 
if(seconds<=9) 
seconds="0"+seconds
time.innerHTML="北京时间："+year+"年"+month+"月"+date+"日"+"  "+hours+":"+minutes+":"+seconds+"  "+ary[day.getDay()];
setTimeout("show()",1000); 
}
show();
</script> 

                 
				   <div style="clear:both" class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
              <li role="presentation" <?php if($_GET['lx'] == 1) {?> class="active" <?php } ?> ><a href="pushfree.php?lx=1&sx=<?php echo $_GET['sx'] ?>" id="home-tab" role="tab" aria-controls="home" aria-expanded="true">发布时间</a></li>
			  <li role="presentation" <?php if($_GET['lx'] == 2) {?> class="active" <?php } ?> ><a href="pushfree.php?lx=2&sx=<?php echo $_GET['sx'] ?>" id="home-tab" role="tab"  aria-controls="home" aria-expanded="true">大学</a></li>
			  <li role="presentation" <?php if($_GET['lx'] == 3) {?> class="active" <?php } ?> ><a href="pushfree.php?lx=3&sx=<?php echo $_GET['sx'] ?>" role="tab" id="profile-tab"  aria-controls="profile">报名截止时间</a></li>
              <li role="presentation" <?php if($_GET['lx'] == 4) {?> class="active" <?php } ?> ><a href="pushfree.php?lx=4&sx=<?php echo $_GET['sx'] ?>" role="tab" id="profile-tab"  aria-controls="profile">面试开始时间</a></li>
              
			  <li role="presentation"  class="dropdown">
				<a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle ="dropdown"  aria-controls="myTabDrop1-contents"><?php if($_GET['sx'] == 1) {?>筛选：推免系统<?php } elseif($_GET['sx'] == 2) {?> 筛选：推免介绍<?php } else {?> 类型：全部<?php }?><span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1" id="myTabDrop1-contents">
				  <li <?php if($_GET['sx'] == 1) {?> class="active" <?php } ?> ><a href="pushfree.php?lx=<?php echo $_GET['lx'] ?>&sx=1" tabindex="-1" role="tab" id="dropdown1-tab"  aria-controls="dropdown1">推免系统</a></li>
				  <li <?php if($_GET['sx'] == 2) {?> class="active" <?php } ?> ><a href="pushfree.php?lx=<?php echo $_GET['lx'] ?>&sx=2" tabindex="-1" role="tab" id="dropdown2-tab" aria-controls="dropdown2">推免介绍</a></li>
                   <li <?php if($_GET['sx'] == 0) {?> class="active" <?php } ?> ><a href="pushfree.php?lx=<?php echo $_GET['lx'] ?>&sx=0" tabindex="-1" role="tab" id="dropdown4-tab" aria-controls="dropdown4">全部</a></li>
                   
				</ul>
			  </li>
			</ul>
         
          <script type="text/javascript">
function deleteCell(){
var mailbody = document.getElementById("mainbody");
var cell = document.getElementById("delCell");
while(cell!=undefined){
mainbody.removeChild(cell);
} 
}
</script>

      <?php

$mysql_server_name='localhost'; //改成自己的mysql数据库服务器
$mysql_username='root'; //改成自己的mysql数据库用户名
$mysql_password='q982311099'; //改成自己的mysql数据库密码
$mysql_database='student'; //改成自己的mysql数据库名
$conn=mysql_connect($mysql_server_name,$mysql_username,$mysql_password) or die("error connecting") ; //连接数据库
mysql_query("set names 'utf8'"); //数据库输出编码 应该与你的数据库编码保持一致.南昌网站建设公司百恒网络PHP工程师建议用UTF-8 国际标准编码.
mysql_select_db($mysql_database); //打开数据库
$str2 = "select month(max(pubdate)) as month,day(max(pubdate)) as day from pushfree";
$result = mysql_query($str2,$conn); //查询
$rst = mysql_fetch_array($result);
 ?>
            <h3>推免信息，最新更新时间：<?php echo $rst['month']."月",$rst['day']."日" ?></h3>
           
            <table class="datatable">
              <thead>
                <tr >
                  <th>ID</th>
                  <th>标题</th>
                  <th>大学</th>
                  <th>类型</th>
                  <th class="xt2">报名截止时间<br>(悬停可看具体日期)</br></th>
                  
                  <th>面试开始时间<br>
                    (悬停可看具体日期)</br></th>
                  <th>状态</th>
                </tr>
                
              </thead>
              <tbody id = "mainbody">
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
	$( "img.xlytp" ).slideToggle( 3, function() {});
	$( "p.yyjh" ).slideToggle( 3, function() {});
	$( "span.bjsj" ).slideToggle( 3, function() {});
　　}
　　
</script>
<tr id = "delCell">
                  <td>置顶</td>
                  <td style="text-align:left"><a href="http://yz.chsi.com.cn/tm/" target="_blank">全国推荐优秀应届本科毕业生免试攻读研究生信息公开暨管理服务系统</a></td>
                  <td>中华人民共和国</td>
            <td>推免系统</td>
                  
                 <td >9.22开始注册</td>
               
                  <td > 9.28填报志愿</td>
                 
               
                  
                 <td style="color:#333">已结束</td>
                  
                  
                   
                </tr>
                
   <?php
if (!session_id()) 
	session_start();
if ( empty($_SESSION['tname']))
{
	$_SESSION['tname']='ceshi';
	$str2 = "update num2 set num = num + 1";
mysql_query($str2); 
	}

	  

$str2 = "insert into recordtm(time,type,IP) values('".date('y-m-d h:i:s',time())."','". $_GET['lx']." ".$_GET['sx']."','".$_SERVER["REMOTE_ADDR"]."')";
mysql_query($str2); //数据库输出编码 应该与你的数据库编码保持一致.南昌网站建设公司百恒网络PHP工程师建议用UTF-8 国际标准编码.

$str1 = "select * from pushfree ";
if($_GET['sx'] == 1)
$str1 = $str1."where type = '推免系统' ";
elseif($_GET['sx'] == 2)
$str1 = $str1."where type = '推免介绍' ";

$str1 = $str1."order by ";

if($_GET['lx'] == 1)
$str1 = $str1."authority desc,pubdate desc,ID desc";
elseif($_GET['lx'] == 2)
$str1 = $str1."popularity desc,authority desc,deadline asc";
elseif($_GET['lx'] == 3)
$str1 = $str1."authority desc,deadline asc,popularity desc";
elseif($_GET['lx'] == 4)
$str1 = $str1."authority desc,startime asc,deadline asc,popularity desc";

$t = $_GET['sx'];
$result = mysql_query($str1,$conn); //查询
$i = 1;

while($rst = mysql_fetch_array($result))
{
?>



                <tr id = "delCell">
                  <td><?php echo $i?></td>
                  <td style="text-align:left"><a href="<?php echo $rst['link']?>" target="_blank"><?php echo $rst['title']?></a></td>
                  <td><?php echo $rst['University']?></td>
                  <td><?php echo $rst['type']?></td>
                  <?php if($rst['identity'] == 1){ ?> 
                 <td id="<?php echo "x".$i ?>" onmouseover="mychange('<?php echo "x".$i ?>','<?php echo $rst['deadline'] ?>')" onmouseout="mychange2('<?php echo "x".$i ?>','<?php echo $rst['remainday'] ?>')" >  <?php echo $rst['remainday']."天"?> </td>
                 <?php } else{?>
                  <td > 不确定 </td>
                 
                  <?php } ?>
                   <?php if($rst['identity2'] == 1){ ?> 
                 <td id="<?php echo "y".$i ?>" onmouseover="mychange('<?php echo "y".$i ?>','<?php echo $rst['startime'] ?>')" onmouseout="mychange2('<?php echo "y".$i ?>','<?php echo $rst['remainday2'] ?>')" >  <?php echo $rst['remainday2']."天"?> </td>
                  <?php } else{?>
                  <td > 不确定 </td>
                 
                  <?php } ?>
                  <?php if ($rst['states'] == "报名中")
				  { ?>
                  <td style="color:#00F"><?php echo $rst['states']?></td>
                  <?php }		  
				  elseif($rst['states'] == "面试前")
				  {
				   ?>
                   <td style="color:#309"><?php echo $rst['states']?></td>  
                    <?php
				  }
				  else{ ?>
                   <td style="color:#666"><?php echo $rst['states']?></td>
               <?php
				  }
				  ?>
                   
                </tr>
        <?php 
		$i = $i + 1;
		} ?>
              </tbody>
            </table>
       
            
		   </div>
           
           
           
		  </div>
          </div>
		  <div  align="center"class="copy_layout login" style="padding:-50%; margin-top:5%"> <p>Copyright <?php echo date("Y"); ?> <a href="http://www.three-thinking.com" target="_blank" title="三思" style="color:#000000">三思</a> 版权所有||<a href="about.asp" target="_blank" title="三思" style="color:#000000">关于三思</a>||@<a href="http://www.xidian.edu.cn/" style="color:#000000" target="_blank">西安电子科技大学 </a>threethinking版权所有|陕ICP备16002727号|<a href="http://www.miitbeian.gov.cn/" style="color:#000000" target="_blank" title="三思">工信部主页</a> </p></div>
   
<!--/bottom-section-->
	
			<!--start-smoth-scrolling-->
			<script type="text/javascript">
								jQuery(document).ready(function($) {
									$(".scroll").click(function(event){		
										event.preventDefault();
										$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
									});
								});
							
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
	

</body>
</html>