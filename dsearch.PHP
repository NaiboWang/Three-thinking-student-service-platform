<?php
   include("connection.php");
$type = $_GET['type'];
$sql = "update applyend set state = '已处理' where sno = '{$_GET['sno']}' and type = '{$type}'";
 $q=mysql_query($sql);
if($type == '协议返回')
{
	$sql = "update applythree set 协议返回情况 = '已返回' where 学号 = '{$_GET['sno']}'";
	$q=mysql_query($sql);
}
echo "1";
   
    mysql_close();
?>