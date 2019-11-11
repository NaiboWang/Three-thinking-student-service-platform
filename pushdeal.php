<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>推免系统信息</title>
</head>
<script src="js/jquery.min.js"></script>
<body>
<p align="center">
  <?php
include("connection.php");
if($_POST['ty'] == 1)
{
	if($_POST['radio'] == 1)
	{
		$id1 = "1";
		$t1 = $_POST['deadline'];
	}
	else
	{
		$id1 = "0";
		$t1 = "2016-12-31";
	}
	if($_POST['radio2'] == 1)
	{
		$id2 = "1";
		$t2 = $_POST['startime'];
	}
	else
	{
		$id2 = "0";
		$t2 = "2016-12-31";
	}
	 $sql = "insert into pushfree(title,link,University,deadline,pubdate,authority,type,popularity,identity,identity2,startime) values('".$_POST['title']."','" .$_POST['link']."','" .$_POST['university']."','".$t1."','".date("20y-m-d",time())."',1,'推免系统','".$_POST['popularity']."','".$id1."','".$id2."','".$t2."')";//从数据库中查询数据
	 
}
else
{

	 $sql = "insert into pushfree(title,link,University,deadline,pubdate,authority,type,popularity,identity,identity2,startime) values('".$_POST['title']."','" .$_POST['link']."','" .$_POST['university']."','2016-12-31','".date("20y-m-d",time())."',1,'推免介绍','".$_POST['popularity']."','0','0','2016-12-31')";//从数据库中查询数据
	 
}
   
       	$query = mysql_query($sql);
			$sql = "call timepush()";
        	$query = mysql_query($sql);

	
?>
 
</p>
 <p align="center">
 添加成功，点击下方链接返回。</p>
 <p align="center"><a href="addpush.php">返回</a></p>
 <p align="center">
   
 </p>
<p align="center">&nbsp;</p>
</body>
</html>