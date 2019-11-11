<?php
include("connection.php");
$str1 = "select tablename,inforname from countinfor where ID ='".$_POST['ID']."'";
$result = mysql_query($str1,$conn); //查询
$rst = mysql_fetch_array($result);
$tablename = $rst['tablename'];
$inforname = $rst['inforname'];

$str1 = "select * from ".$inforname;
$result = mysql_query($str1,$conn); //查询
/*while($rst = mysql_fetch_array($result))
{
	if($rst['ifreadonly'] == "no" &&$rst['ifnature'] == "yes")
	{
		$str2 = "update 身份信息（不可泄露） set ".$rst['title']."='".$_POST[$rst['title']]."' where 学号 ='".$_POST['学号']."'";
		$result2 = mysql_query($str2,$conn); //查询
	}
}*/

$str1 = "select * from ".$tablename." where 学号 ='".$_POST['学号']."'";
$result = mysql_query($str1,$conn); //查询
$rst = mysql_fetch_array($result);
if(empty($rst['学号']))
{
	$str1 = "insert into ".$tablename."(学号) values ('".$_POST['学号']."')";
	$result = mysql_query($str1,$conn); //查询
}

$str1 = "select * from ".$inforname;
$result = mysql_query($str1,$conn); //查询
while($rst = mysql_fetch_array($result))
{
	if($rst['title']<>"学号")
	{
		$str2 = "update ".$tablename." set ".$rst['title']."='".$_POST[$rst['title']]."' where 学号 ='".$_POST['学号']."'";
		$result2 = mysql_query($str2,$conn); //查询
	}
}
	echo "<script> alert('提交成功，您还可以在统计开放时间内随意对所填信息进行修改。');";  
	echo "window.location.href='countstudent.asp?ID=".$_POST['md5']."'</script>";  
?>