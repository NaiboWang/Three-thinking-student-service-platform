<?php
include("logincheck.php");
?>
<!DOCTYPE HTML>
<html>
<head>
<title>三思·学生信息/成绩管理</title>
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

<!--webfonts-->
    


<!--//webfonts-->
</head>
<body style="color:#000">
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
     <p  align="center" class = "tzxx" style="display:none; font-size:30px ">科研项目信息</p>
		<img class="tzxx" src="images/textadmin.png" style="background-position:center;left:30%;position:relative;background-size:cover; min-height:50px; min-width:200px; width:40%;height:30%"  longdesc="news.asp">
	   <div class="clearfix"> </div>
	</div>
	<div class="container" style="width:1200px">
			 <div class="grid_3 grid_5" >
				 
                 <div id="wz" ><b>尊敬的管理员，欢迎您！</b>
				<div class="atshowa">
					<div class="atshowname" style="text-align:center;color:#009;font-size:23px;font-weight:bold;line-height:1.5em; font-family:'微软雅黑';margin-bottom:10px;height:auto!important">学生信息/成绩管理</div>
				<div align="center" style="font-family:'微软雅黑'; color:#000">
                 <div class="button"  style="margin-top:10px">  

     <a href="uploadpre.html" target="_blank"> <input type="button" 
	 style="font-size: 16px;
  font-weight: 300 !important;
  position:relative;
  color: #fff;
  cursor: pointer;
  outline: none;
  padding: 10px 15px;
  width: 20%;
  border: none;
  background: rgb(0,102,255) ;
  border-radius: 2px;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
  margin-top:10px;
  text-transform: uppercase;margin-left:0%"
  
	 value="1、学生信息导入"

	 onMouseOver="this.style.background='#9900FF'" onMouseOut="this.style.background='#06F'" ></a>
	  </div>
      2、手动设置增加课程信息<br/>
3、手动设置方向配置的年级和方向名
       <div class="button"  style="margin-top:10px">
         <a id="setnum" href="setnum.php">
        <input type="button" 
		style=" 
		font-size: 16px;
  font-weight: 300 !important;
  position:relative;
  color: #fff;
  cursor: pointer;
  outline: none;
  padding: 10px 15px;
  width: 20%;
  border: none;
  background:#30C;
  border-radius: 2px;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
  margin-top:10px;
  text-transform: uppercase;margin-left:0%
		" onMouseOver="this.style.background='#9900FF'" onMouseOut="this.style.background='#30C'" 
		value="4、生成方向人数"></a></div>
          <div class="button"  style="margin-top:10px">
         <a href="uploadspre.html" target="_blank">
        <input type="button" 
		style=" 
		font-size: 16px;
  font-weight: 300 !important;
  position:relative;
  color: #fff;
  cursor: pointer;
  outline: none;
  padding: 10px 15px;
  width: 20%;
  border: none;
  background:#3b5999;
  border-radius: 2px;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
  margin-top:10px;
  text-transform: uppercase;margin-left:0%
		" onMouseOver="this.style.background='#9900FF'" onMouseOut="this.style.background='#3b5999'" 
		value="5、导入清洗后的成绩"></a></div>
         
           <div class="button"  style="margin-top:10px">  

     <a id="setscore" href="setscore.php"> <input type="button" 
	 style="font-size: 16px;
  font-weight: 300 !important;
  position:relative;
  color: #fff;
  cursor: pointer;
  outline: none;
  padding: 10px 15px;
  width: 20%;
  border: none;
  background: rgb(0,102,255) ;
  border-radius: 2px;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
  margin-top:10px;
  text-transform: uppercase;margin-left:0%"
  
	 value="6、生成学生加权平均分"

	 onMouseOver="this.style.background='#9900FF'" onMouseOut="this.style.background='#06F'" ></a>
	  </div>
             <div class="button"  style="margin-top:10px">
         <a id="setrank" href="setrank.php">
        <input type="button" 
		style=" 
		font-size: 16px;
  font-weight: 300 !important;
  position:relative;
  color: #fff;
  cursor: pointer;
  outline: none;
  padding: 10px 15px;
  width: 20%;
  border: none;
  background:#30C;
  border-radius: 2px;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
  margin-top:10px;
  text-transform: uppercase;margin-left:0%
		" onMouseOver="this.style.background='#9900FF'" onMouseOut="this.style.background='#30C'" 
		value="7、生成学生名次"></a></div>
      <div class="button"  style="margin-top:10px">
         <a href="uploadtpre.html" target="_blank">
        <input type="button" 
		style=" 
		font-size: 16px;
  font-weight: 300 !important;
  position:relative;
  color: #fff;
  cursor: pointer;
  outline: none;
  padding: 10px 15px;
  width: 20%;
  border: none;
  background:#3b5999;
  border-radius: 2px;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
  margin-top:10px;
  text-transform: uppercase;margin-left:0%
		" onMouseOver="this.style.background='#9900FF'" onMouseOut="this.style.background='#3b5999'" 
		value="8、导入保研排名成绩"></a></div>
				  </div>
				  </div>

</div>
               <script>
               $("#setnum").click(function(){
  if(confirm("确认要重新生成方向人数吗？"))
  	return true;
  else
	return false;
});
 $("#setscore").click(function(){
  if(confirm("确认要重新生成加权平均分吗？"))
  	return true;
  else
	return false;
});
 $("#setrank").click(function(){
  if(confirm("确认要重新生成名次吗？"))
  	return true;
  else
	return false;
});
               </script>
               
			</div>
 
 <div id="list_wrap"><!--新闻内容-->
	<div id="list_main">
		<div class="maindiv">
</div>
	</div>
</div>

<hr style="height:1px;border:none;border-top:1px solid #555555;" />
<div  align="center"class="copy_layout login" style="padding:-50%; margin-bottom:2%"> <p>Copyright 2017 <a href="http://www.three-thinking.com" target="_blank" title="三思" style="color:#000000">三思</a> 版权所有||<a href="http://www.three-thinking.com/about.asp" target="_blank" title="三思" style="color:#000000">关于三思</a>||@<a href="http://www.xidian.edu.cn/" style="color:#000000" target="_blank">西安电子科技大学 </a>threethinking版权所有|陕ICP备16002727号|<a href="http://www.miitbeian.gov.cn/" style="color:#000000" target="_blank" title="三思">工信部主页</a> </p></div>
<hr style="height:1px;border:none;border-top:1px solid #555555;" />
   
</body>
</html>

