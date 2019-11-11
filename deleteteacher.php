<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>删除导师信息</title>
</head>
 
 <?php
include("connection.php");
include("teacherconfirm.php");
        $sql = "delete from teacher where ID ='".$_POST['ID']."'";//从数据库中查询数据
        	$query = mysql_query($sql);
		echo "<script> alert('删除成功');</script>"; 
		
		
?>
<body>
<script>
 window.close();
</script>
</body>
</html>