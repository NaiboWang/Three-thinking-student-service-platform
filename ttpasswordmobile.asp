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
<!--#include file="Connections/mysql.asp" -->
<!--#include file="Connections/tj.asp" -->
<%
Set Command111 = Server.CreateObject ("ADODB.Command")
Command111.ActiveConnection = MM_tj_STRING
Command111.CommandText = "INSERT INTO 留言 (账号,IP, 类型, 时间)  VALUES ('"& session("MM_username") & "',' "  & request.servervariables("remote_addr")  & "','passwordmobile','" & year(Now) & "-" & Month(Now) & "-" & day(Now) & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now) & "' ) "
Command111.CommandType = 1
Command111.CommandTimeout = 0
Command111.Prepared = true
Command111.Execute()

%>

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
Recordset1_cmd.ActiveConnection = MM_mysql_STRING
Recordset1_cmd.CommandText = "SELECT * FROM 身份信息（不可泄露） WHERE 学号 = ?" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 200, 1, 255, Recordset1__MMColParam) ' adVarChar

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<!DOCTYPE html>
<html>
<head>
<title>三思-修改密码</title>
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
</style>  

<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style2.css" rel="stylesheet" type="text/css" media="all" />
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
</head>
	
<body>
	<div class="psd">
<div class="container">
<!-- header -->
		<div class="header">
      
			<div class="logo">
				<a href="scoreindexmobile.asp"><img src="images/logo.png"  style="min-height:30px; min-width:115px" width=45% height=20% alt=" " /></a>
          <div class="infor"  style="width:1000px;text-align:left;font-size:150%; background-size:cover; letter-spacing:-3px;font-weight:600;">
          <% if Recordset1.Fields.Item("性别").Value = "女" then%>
          <img src="images/userfemale.png" width="32" height="32" />
             <% else %>
          <img src="images/user.png" width="32" height="32" />
             <%end if%>
		  <%=(Recordset1.Fields.Item("姓名").Value)%>同学，欢迎你！ </div></div> 
          <div class="logo-right">
				<span class="menu"><img src="images/menu.png" alt=" "/></span>
				<ul class="nav1">
					<li><a href="scoreindexmobile.asp" class="act">主页</a></li>
					<li><a href="ttinformationmobile.asp" class="act1">个人信息</a></li>
					<li><a href="ttnoticemobile.asp" class="act2">通知信息</a></li>
					<li><a href="scorecontentmobile.asp" class="act3">成绩相关</a></li>
					<li><a href="scoredocumentmobile.asp" class="act4">事务管理</a></li>
                    <li class="cap"><a href="tttextmobile.asp" class="act5">系统相关</a></li>
				</ul>
			</div>
		  <div class="clearfix"> </div>
				<!-- script for menu --> 
		  <script> 
						$( "span.menu" ).click(function() {
						$( "ul.nav1" ).slideToggle( 300, function() {
						 // Animation complete.
						});
						});
					</script>
				<!-- //script for menu -->
		</div>
<!-- //header -->


<div class="submit" style="max-width:400px"><input type="submit" style="border-color:#111; background:#3d279a;color:#FFF; border-style:solid" onClick="window.location=('tttextmobile.asp');" value="留言"><input type="submit" style="border-color:#E7E7E7; background:#E7E7E7; border-style:solid" value="修改密码" ><input type="submit"  style="border-color:#111;color:#FFF; background:#3d279a; border-style:solid" onClick="window.location=('about.asp');" value="关于三思"><input type="submit"  style="border-color:#111;color:#FFF; background:#3d279a; border-style:solid" onClick="window.location=('<%= MM_Logout %>');" value="注销"></div>



<div class="port"  style="font:'楷体'">
  <h3>修改密码</h3>
		<p class="para">新密码长度为4-16位，修改完成后，系统自动注销，请用新密码重新登录。<span></span>
        
		<img src="hr-geo-sukarno-1s960x639.png"  style="  position:relative; left:2%;background-size:cover; background-position:center; width:90%;height:90%" alt=""/>
		
		
        
        

				
  <form onSubmit="return takein()" action="alterpass.asp" method="post" class="register active" name="changepass">
	        <label>
	          旧密码：</label> 						    
				      <input  style="margin-bottom:20px" name="oldpass" type="password" id="oldpass"/> 						    
						      
						      
						      
		      <p>
		        <label>新密码：</label>
						      <input name = "newpass" type="password" id="newpass"/>
    </p>
						    <p>
						      
						      <label>确认密码：</label>
						      <input name = "surepass" type="password"  id="surepass"/>
						      
						      
						      
				      </p>
					    <div class="bottom">
						
							<input type="submit" id="suresubmit" value="确认修改" />
							<a href="" rel="login" class="linkform">若忘记密码，请联系管理人员</a>
							<div class="clear"></div>
    </div>
  </form>
            
                
  <div class="clear"></div>
    <script>
	function takein()
	{
		if(changepass.oldpass.value == "")
		{
			alert('旧密码不能为空');
			return false;
			}
		var c=changepass.newpass.value;
		var d=changepass.surepass.value;
		
		var NowNum = changepass.newpass.value.length;
				if(NowNum<4||NowNum>16)
				{
					alert("新密码的长度应该在4-16位之间。");
				return false;
					}
					
		
		
		
		if(c=="")
		{
			alert('新密码不能为空');
			return false;
			}
			else
			{
				if(d=="")
				{
					alert('请填写确认密码');
					return false;
					}
					else
					{
							if(c!=d)
							{
								alert('两次输入密码不一致，请重新输入');
								return false;
								}
						}
				}
			return true;
		
	}
	</script>
        
        
                 
    <br/><br/><br/>
   
   
   
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
