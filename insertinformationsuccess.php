<?php
include("connection.php");
$content1 =mysql_real_escape_string($_POST["content1"]);
date_default_timezone_set('PRC');
	$str2 = "insert into informa(title,content,time,publisher) values('".$_POST["title"]."','".$content1."','".date('Y-m-d')."','".$_POST["adminname"]."')";
		$result = mysql_query($str2,$conn); //查询
	echo "<script> alert('增加成功。');</script>";  
	echo '<script>window.close();</script>'; 
?>