 <?php
include("connection.php");
$str1 = "select openornot from countinfor where ID ='".$_POST['ID']."'";
$result = mysql_query($str1,$conn); //查询
$rst = mysql_fetch_array($result);
if($rst['openornot'] == "open")
{
		$str1 = "update countinfor set openornot = 'close' where ID ='".$_POST['ID']."'";
		echo "<script> alert('关闭统计成功');</script>";
	}
	else
	{	
		$str1 = "update countinfor set openornot = 'open' where ID ='".$_POST['ID']."'";
		echo "<script> alert('打开统计成功');</script>";
	}
	$result = mysql_query($str1,$conn); //查询
       echo '<script>window.close();</script>'; 
?>