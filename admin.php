<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>information</title>
</head>

<body>
<p align="center">相关信息管理与查看</p>
<p align="center"><a href="addxly.php?mm=147258" target="_blank">增加夏令营信息</a></p>
<?php
include("connection.php");

$sql = "select num from num";
$result = mysql_query($sql,$conn); //查询
$rst = mysql_fetch_array($result);
$n = $rst['num'];
?>

<p align="left">夏令营访问次数：<?php echo $rst['num']."次" ?></p>
 <div  >
<div align="center">
  <table width="499" border="1">
    <tr align="center">
      <td width="38"><div align="center">ID</div></td>
      <td width="70"><div align="center">学号</div></td>
      <td width="369"><div align="center">时间</div></td>
      </tr>
  </table>
</div>
<div align="center" style="overflow:scroll;width:auto" >
    

<?php
$sql = "select * from record";
$result = mysql_query($sql,$conn); //查询
if($_GET['lx'] == 1485242)
echo "验证成功";
else
exit();

while($rst = mysql_fetch_array($result))
{
?>
  <table width="495" border="1">
    <tr align="center">
      <td height="24"><?php print $rst['ID'] ?></td>
      <td><?php print $rst['sno'] ?></td>
      <td><?php print $rst['time'] ?></td>
      </tr>
  </table>
    <?php
}
?>
<p> </p>
    <?php
$sql = "select * from recordxly order by ID desc";
$result = mysql_query($sql,$conn); //查询
$n1 = 0;
while($rst = mysql_fetch_array($result))
{
	if($n1 > $n-150)
	{
?>
  <table width="495" border="1">
    <tr align="center">
      <td height="24"><?php print $rst['ID'] ?></td>
      <td><?php print $rst['IP'] ?></td>
      <td><?php print $rst['time'] ?></td>
      <td><?php print $rst['type'] ?></td>
      </tr>
  </table>
    <?php
	
	}
	$n1++;
}
?>
 
 
  
</div>
</div>
<p>&nbsp;</p>

</body>
</html>