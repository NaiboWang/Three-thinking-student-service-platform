<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改成功！</title>
</head>

<?php
header("Content-type:text/html;charset=utf-8");

$mysql_server_name='182.254.148.186'; //改成自己的mysql数据库服务器
$mysql_username='root'; //改成自己的mysql数据库用户名
$mysql_password='q982311099'; //改成自己的mysql数据库密码
$mysql_database='student'; //改成自己的mysql数据库名
$conn=mysql_connect($mysql_server_name,$mysql_username,$mysql_password) or die("error connecting") ; //连接数据库
mysql_query("set s 'utf8'"); //数据库输出编码 应该与你的数据库编码保持一致.南昌网站建设公司百恒网络PHP工程师建议用UTF-8 国际标准编码.
mysql_select_db($mysql_database); //打开数据库
$xh = substr($_POST['xh'],18,11);
$id = substr($_POST['xh'],0,18);
$sql ="update S set sid = '".$id."' where sno = '" . $xh . "'"; //SQL语句
$result = mysql_query($sql,$conn); //查询
?> 




<body>
<p>
<p align="center"><img src="9885883_231954847000_1.jpg" width="84" height="84" align="absmiddle" />您的信息完善成功，请用该身份证号前6位登陆系统进行操作，如果刚才填写错误，请联系管理员解决！ 点击下方按钮返回登录界面。</p>
<form id="form1" name="form1" method="post" action="scorelogin.asp">
  <div align="center"><input type="image" name="imageField" id="imageField" src="images/return.png" /> </div>
  
</form>
</body>
</html>