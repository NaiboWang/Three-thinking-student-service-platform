<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/tj.asp" -->
<!--#include file="Connections/mysql.asp" -->

<%
if Session("user_is_index") = false or  Session("user_is_index") = "" then
%>


<script>

alert("Please log in this page from the index of the website");
</script>

<%
Response.end()
end if
%>

<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_mysql_STRING
Recordset1_cmd.CommandText = "SELECT * FROM 身份信息（不可泄露）" 
Recordset1_cmd.Prepared = true

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<%
' *** Validate request to log in to this site.
MM_LoginAction = Request.ServerVariables("URL")
If Request.QueryString <> "" Then MM_LoginAction = MM_LoginAction + "?" + Server.HTMLEncode(Request.QueryString)
MM_valUsername = CStr(Request.Form("xh2"))
If MM_valUsername <> "" Then
  Dim MM_fldUserAuthorization
  Dim MM_redirectLoginSuccess
  Dim MM_redirectLoginFailed
  Dim MM_loginSQL
  Dim MM_rsUser
  Dim MM_rsUser_cmd
  
  MM_fldUserAuthorization = ""
  MM_redirectLoginSuccess = "scoreindex.asp"
  MM_redirectLoginFailed = "login-lose.asp?type=1"

  MM_loginSQL = "SELECT 学号, 密码"
  If MM_fldUserAuthorization <> "" Then MM_loginSQL = MM_loginSQL & "," & MM_fldUserAuthorization
  MM_loginSQL = MM_loginSQL & " FROM 身份信息（不可泄露） WHERE 学号 = ? AND 密码 = ?"
  Set MM_rsUser_cmd = Server.CreateObject ("ADODB.Command")
  MM_rsUser_cmd.ActiveConnection = MM_mysql_STRING
  MM_rsUser_cmd.CommandText = MM_loginSQL
  MM_rsUser_cmd.Parameters.Append MM_rsUser_cmd.CreateParameter("param1", 200, 1, 255, MM_valUsername) ' adVarChar
  MM_rsUser_cmd.Parameters.Append MM_rsUser_cmd.CreateParameter("param2", 200, 1, 255, Request.Form("pswd")) ' adVarChar
  MM_rsUser_cmd.Prepared = true
  Set MM_rsUser = MM_rsUser_cmd.Execute

  If Not MM_rsUser.EOF Or Not MM_rsUser.BOF Then 
    ' username and password match - this is a valid user
	 Session("MM_Username") = MM_valUsername
	Set Command1 = Server.CreateObject ("ADODB.Command")
	Command1.ActiveConnection = MM_mysql_STRING
	Command1.CommandText = "UPDATE 身份信息（不可泄露）  SET ID = ID+1 WHERE 学号 =  '"& session("MM_username")&"'"
	Command1.CommandType = 1
	Command1.CommandTimeout = 0
	Command1.Prepared = true
	Command1.Execute()
	
	Set Command2 = Server.CreateObject ("ADODB.Command")
	Command2.ActiveConnection = MM_mysql_STRING
	Command2.CommandText = "UPDATE 统计 SET ID = ID+1"
	Command2.CommandType = 1
	Command2.CommandTimeout = 0
	Command2.Prepared = true
	Command2.Execute()
	
   
    If (MM_fldUserAuthorization <> "") Then
      Session("MM_UserAuthorization") = CStr(MM_rsUser.Fields.Item(MM_fldUserAuthorization).Value)
    Else
      Session("MM_UserAuthorization") = ""
    End If
    if CStr(Request.QueryString("accessdenied")) <> "" And false Then
      MM_redirectLoginSuccess = Request.QueryString("accessdenied")
    End If
    MM_rsUser.Close
    Response.Redirect(MM_redirectLoginSuccess)
	
  End If
  MM_rsUser.Close
  Response.Redirect(MM_redirectLoginFailed)
End If
%>

<!DOCTYPE HTML>
<html>
<head>
<title>三思·学生登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style2.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.cookie.js"></script>
<!----webfonts--->
<link href='css/fonts2.css' rel='stylesheet' type='text/css'>
<!---//webfonts--->  
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script> 
</head>
<body id="login">
  <div class="login-logo">
    <a href="about.asp" target="_blank"><img src="logo.png" style="background-size:cover; min-height:50px; min-width:200px; width:25%;height:25%" alt=""/></a>
    <h1 style="padding:20px"></h1>
    <p></p>
    <a href="login.asp" target="_blank"><img src="title.png"  style="background-repeat:no-repeat;background-size:cover; min-height:12.5px; min-width:180px;width:24%; height:25%" alt=""/></a>
  </div>
<div class="app-cam" style=" margin-top:1%">
    <form action = "<%=MM_LoginAction%>" id="form2" name="form2" method="POST" >  
		<input type="text" class="text"  id = "xh" name="xh2" value="学号" onfocus="if (this.value == '学号') {this.value = '';}" onblur="if (this.value == '') {this.value = '学号';}">
		<input type="password" value="password" name = "pswd" id = "pswd" onfocus="if (this.value == 'password') {this.value = '';}" onblur="if (this.value == '') {this.value = 'password';}">
		<div class="submit"><input type="submit" value="登录" >  <input type="reset"  value="重置"></div>
		<ul class="new" style="font-family:'微软雅黑'; font-size:large">
		 <p>注：密码初始为身份证号[后6位]。</p>
    <p>注：如身份证后六位无法登陆，请尝试用123456登录。</p>
        <p>注：登陆之后可以进行修改密码、留言等功能。</p>
	 <p>注：登陆之后可下载成绩排名证明，没有身份证号的同学请完善身份证信息后再下载。</p>
		</ul>
	</form>
  </div>
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">公告</h4>
            </div>
            <div class="modal-body" style="text-indent: 2em;font-size: 1.1em">由于三思网站改版，因此所有学生的密码初始化为身份证号<strong>后6位（X为大写）</strong>，如果后6位无法登陆，即是系统中身份证号信息不全，则密码为123456，所有学生登陆之后可修改密码，由此带来的不便，请您谅解。</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">知道了</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>  
    $(document).ready(function(){  
	if ($.cookie("o") == null) { //设置cookie，使用户只看一次就可以
       var str = "1";　　//对序列化成字符串然后存入cookie 
       $.cookie("o", str, { 
         expires:21  //设置时间，如果此处留空，则浏览器关闭此cookie就失效。 
       });
	    $("#myModal").modal("show")   
     } 
      
    })  
    </script>   
   <div class="copy_layout login" style="padding:-50%; margin-top:5%"> <p>Copyright <%=year(now())%> <a href="http://www.three-thinking.com" target="_blank" title="三思" style="color:#000000">三思</a> 版权所有||<a href="about.asp" target="_blank" title="三思" style="color:#000000">关于三思</a>||@<a href="http://www.xidian.edu.cn/" style="color:#000000" target="_blank">西安电子科技大学 </a>threethinking版权所有|陕ICP备16002727号|<a href="http://www.miitbeian.gov.cn/" style="color:#000000" target="_blank" title="三思">工信部主页</a> </p></div>
   
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
