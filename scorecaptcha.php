<?php
session_start();
header("Content-type:text/html;charset=utf-8");
if($_POST["pswd"] == "0103@1144.com")
{
	$_SESSION['yy'] = 1;
	header("Location:scoreadmin.php"); 
}
else
{
	echo "验证失败";
}
?>