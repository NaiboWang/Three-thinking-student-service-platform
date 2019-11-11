<?php
include("connection.php");
$content1 =mysql_real_escape_string($_POST["content1"]);
date_default_timezone_set('PRC');
	$str2 = "update informa set title = '".$_POST["title"]."',content = '".$content1."' where ID = ".$_POST["ID"];
		$result = mysql_query($str2,$conn); //查询
	echo "<script> alert('修改成功。');</script>";  
	echo '<script>window.close();</script>'; 
?>