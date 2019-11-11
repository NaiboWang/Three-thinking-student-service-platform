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
Command111.CommandText = "INSERT INTO 留言 (账号,IP, 类型, 时间)  VALUES ('"& session("MM_username") & "',' "  & request.servervariables("remote_addr")  & "','text','" & year(Now) & "-" & Month(Now) & "-" & day(Now) & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now) & "' ) "
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
<title>三思-留言</title>
<style>  
<!--  
.datalist{
	border: 1px solid #0058a3;   /* 表格边框 */
	font-family: Arial;
	border-collapse: collapse;   /* 边框重叠 */
	background-color:#eaf5ff;   /* 表格背景色 */
	font-size: 14px;
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
<div class="container">
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
 <div id="rt-main-header">	

			<div class="menu">
									
	          <ul class="menutop">
			  
				 <li class="root"><a class="item " href="scoreindexcomputer.asp"><span>主页</span></a>	</li>	
				  
				 <li class="root"><a class=" item " href="ttinformationcomputer.asp" ><span>个人信息</span></a>
		
	            </li>
				 <li class="root"><a class=" item " href="ttnoticecomputer.asp" ><span>通知信息</span></a>		
	            </li>	
					<li class="root"><a class=" item " href="scorecontentcomputer.asp" ><span>成绩相关</span></a>
				   <div class="fusion-submenu-wrapper ">
				     <ul >								
							<li><a class=" item " href="scorecontentcomputer.asp"><span>成绩信息</span></a></li>										
							<li><a class=" item " href="scorerankcomputer.asp"><span>排名证明</span></a></li>
					 </ul>
			      </div>			
	            </li>	
					<li class="root"><a class=" item " href="scoredocumentcomputer.asp" ><span>事务管理</span></a>
				  			
	            </li>	
					<li class="root"><a class=" item " href="tttextcomputer.asp" ><span>系统相关</span></a>
				   <div class="fusion-submenu-wrapper ">
				     <ul >						
                     		
							<li><a class=" item " href="tttextcomputer.asp"><span>留言</span></a></li>			
                            <li><a class=" item " href="ttpasswordcomputer.asp"><span>修改密码</span></a></li>									
							<li><a class=" item " href="about.asp" target="_blank"><span>关于三思</span></a></li>
							<li><a class=" item " href="<%= MM_Logout %>"><span>注销</span></a></li>
					 </ul>
			      </div>			
	            </li>							
		</ul>
<div class="menu_right"></div>		   
			</div>
		</div>
<div style="clear:both"></div>	



<div class="port"  style="font:'楷体'">
  <h3>欢迎留言</h3>
		<p class="para">在这里，您可以对本网站的内容进行评价和留言，或者解决相关问题。</strong>
		<p class="para">近期三思网站不会开发留言回复功能，您可以留言给相关人员，他们可以看到，但不会在此网站回复。<span></span>
        
   <img src="hr-geo-sukarno-1s960x639.png"  style="  position:relative; left:2%;background-size:cover; background-position:center; width:90%;height:90%" alt=""/>  </h3>
  <div class="portfolio-grids" align="center" style="min-height:650px">
    <form method="post" action="textsubmit.asp" onSubmit="return check()">
   <table  class="datalist" width="61%" border="1">
  <tr>
    <td width="67" height="82"><div align="center">
    
      <p>留言标题</p>
    </div></td>
    <td colspan="2">
      <div align="center">
        <input type="text"  style="width: 420px; background-color: #F2F2F2"name="textfield" id="textfield">
      </div>
    </td>
  </tr>
  <tr>
    <td height="221"><div align="center">留言内容</div></td>
    <td colspan="2"><div align="center"> <textarea  style="background-color: #F2F2F2" name="textbody" cols="80%" rows="10" id="textbody"></textarea></div></td>
  </tr>
    <tr>
    <td height="42"><div align="center">留言对象</div></td>
   
    <td>
      <div align="center">
        <input name="webdeveloper" type="checkbox" id="webdeveloper" value="1" checked="CHECKED">
        
      网站开发者 
      <!--<input name="zzwdy" type="checkbox" id="zzwdy" value="2" >
      张志为导员 
      <input name="zcydy" type="checkbox" id="zcydy" value="3" >
黄鹏飞导员 --> </div></td>

  </tr>
  
  <tr>
    <td height="42"><div align="center">留言类型</div></td>
   
    <td>
      <div align="center">
        <input type="radio" name="radio" id="nohide" value="nohide" checked>
        实 名          &nbsp;
          <label for="textfield"></label>
          &nbsp; &nbsp; &nbsp;
<input type="radio" name="radio" id="ishide" value="ishide"> 
匿 名 </div></td>

  </tr>
  </table>
  <div style="width:60%; margin:0 auto">
    <div class="my" style="width:50%; float:left" align="center">
        <input type="submit" class="app-cam input"  name="besuretext" id="besuretext" value="提交"> 
        </div>
        <div  class="my" style="width:50%; float:right" align="center"> 
 
        <input style="position:relative; margin-left:-30px" type="reset" class="app-cam" name="reset" id="reset" value="重置">
      
    </div>
  
</div>
    </form>
<script>
function check()
{
	var	a=document.getElementById("textfield").value;
	if(a=="")
	{
		alert('留言标题不能为空，请重新填写。');
		return false;
	}
	var i = 0;
	if(document.getElementById("webdeveloper").checked)
		i++;
	if(document.getElementById("zzwdy").checked)
		i++;
	if(document.getElementById("zcydy").checked)
		i++;	
		if(i==0)
		{
			
		alert('请至少选择一个留言对象，谢谢。');
		return false;
			
			}
			if(confirm('确认提交留言吗？'))
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

<!-- //here ends scrolling icon -->
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
