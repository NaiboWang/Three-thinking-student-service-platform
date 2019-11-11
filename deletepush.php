<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>删除推免信息</title>
</head>
 
 <?php
include("connection.php");
        $sql = "delete from pushfree where ID ='".$_GET['ID']."'";//从数据库中查询数据
        	$query = mysql_query($sql);
		
?>
<body>
<p align="center">删除成功，点击下方链接返回。</p>
<p align="center"><a href="addpush.php">返回</a></p>
</body>
</html>