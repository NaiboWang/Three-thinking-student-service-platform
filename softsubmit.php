<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提交</title>
</head>
<?php
include("connection.php");
function tz()
{
	echo "<script language='javascript' 
type='text/javascript'>";  
echo "window.location.href='softprojectcount.asp'";  
echo "</script>"; 
exit(-1);
	}
$i=0;
$k = 0;
if(isset($_POST['sno1']) && strlen(trim($_POST['sno1']))>0)
{
	$str2 = "select sname,groupno from softprojectcontent where sno ='".$_POST['sno1']."'";
	$result = mysql_query($str2,$conn); //查询
	if(mysql_num_rows($result))
	{
		$rst = mysql_fetch_array($result);
		if($rst['groupno']<>0)
		{
				
				echo "<script> alert('学号为".$_POST['sno1'].",姓名".$rst['sname']."的学生已经结组，请返回重新提交。');</script>"; 
				 tz();
			}
			else
			{
				$type[$k] = $_POST['cho1'];
				$content[$k] = $_POST['worktype'];
				$cars[$k] = $_POST['sno1'];
				$k = $k+1;
			}
	}
	else
	{
		echo "<script> alert('找不到学号为".$_POST['sno1']."的学生，请重新提交。');</script>";
		 tz();
	}
	
	}
	
	
	if(isset($_POST['sno2']) && strlen(trim($_POST['sno2']))>0)
{
	$str2 = "select sname,groupno from softprojectcontent where sno ='".$_POST['sno2']."'";
	$result = mysql_query($str2,$conn); //查询
	if(mysql_num_rows($result))
	{
		$rst = mysql_fetch_array($result);
		if($rst['groupno']<>0)
		{
				
				echo "<script> alert('学号为".$_POST['sno2'].",姓名".$rst['sname']."的学生已经结组，请返回重新提交。');</script>"; 
				 tz();
			}
			else
			{
				$type[$k] = $_POST['cho2'];
				$content[$k] = $_POST['worktype2'];
				$cars[$k] = $_POST['sno2'];
				
				$k = $k+1;
			}
	}
	else
	{
		echo "<script> alert('找不到学号为".$_POST['sno2']."的学生，请重新提交。');</script>";
		 tz();
	}
	
	}
	
	
	
	if(isset($_POST['sno3']) && strlen(trim($_POST['sno3']))>0)
{
	$str2 = "select sname,groupno from softprojectcontent where sno ='".$_POST['sno3']."'";
	$result = mysql_query($str2,$conn); //查询
	if(mysql_num_rows($result))
	{
		$rst = mysql_fetch_array($result);
		if($rst['groupno']<>0)
		{
				
				echo "<script> alert('学号为".$_POST['sno3'].",姓名".$rst['sname']."的学生已经结组，请返回重新提交。');</script>"; 
				 tz();
			}
			else
			{
				$type[$k] = $_POST['cho3'];
				$content[$k] = $_POST['worktype3'];
				$cars[$k] = $_POST['sno3'];
				
				$k = $k+1;
			}
	}
	else
	{
		echo "<script> alert('找不到学号为".$_POST['sno3']."的学生，请重新提交。');</script>";
		 tz();
	}
	
	}
	
	
	if(isset($_POST['sno4']) && strlen(trim($_POST['sno4']))>0)
{
	$str2 = "select sname,groupno from softprojectcontent where sno ='".$_POST['sno4']."'";
	$result = mysql_query($str2,$conn); //查询
	if(mysql_num_rows($result))
	{
		$rst = mysql_fetch_array($result);
		if($rst['groupno']<>0)
		{
				
				echo "<script> alert('学号为".$_POST['sno4'].",姓名".$rst['sname']."的学生已经结组，请返回重新提交。');</script>"; 
				 tz();
			}
			else
			{
				$type[$k] = $_POST['cho4'];
				$content[$k] = $_POST['worktype4'];
				$cars[$k] = $_POST['sno4'];
				$k = $k+1;
			}
	}
	else
	{
		echo "<script> alert('找不到学号为".$_POST['sno4']."的学生，请重新提交。');</script>";
		 tz();
	}
	
	}
	
	
	if(isset($_POST['sno5']) && strlen(trim($_POST['sno5']))>0)
{
	$str2 = "select sname,groupno from softprojectcontent where sno ='".$_POST['sno5']."'";
	$result = mysql_query($str2,$conn); //查询
	if(mysql_num_rows($result))
	{
		$rst = mysql_fetch_array($result);
		if($rst['groupno']<>0)
		{
				
				echo "<script> alert('学号为".$_POST['sno5'].",姓名".$rst['sname']."的学生已经结组，请返回重新提交。');</script>"; 
				 tz();
			}
			else
			{
				$type[$k] = $_POST['cho5'];
				$content[$k] = $_POST['worktype5'];
				$cars[$k] = $_POST['sno5'];
				$k = $k+1;
			}
	}
	else
	{
		echo "<script> alert('找不到学号为".$_POST['sno5']."的学生，请重新提交。');</script>";
		 tz();
	}
	
	}
	if(isset($_POST['sno6']) && strlen(trim($_POST['sno6']))>0)
{
	$str2 = "select sname,groupno from softprojectcontent where sno ='".$_POST['sno6']."'";
	$result = mysql_query($str2,$conn); //查询
	if(mysql_num_rows($result))
	{
		$rst = mysql_fetch_array($result);
		if($rst['groupno']<>0)
		{
				
				echo "<script> alert('学号为".$_POST['sno6'].",姓名".$rst['sname']."的学生已经结组，请返回重新提交。');</script>"; 
				 tz();
			}
			else
			{
				$type[$k] = $_POST['cho6'];
				$content[$k] = $_POST['worktype6'];
				$cars[$k] = $_POST['sno6'];
				$k = $k+1;
			}
	}
	else
	{
		echo "<script> alert('找不到学号为".$_POST['sno6']."的学生，请重新提交。');</script>";
		 tz();
	}
	
	}
	$str2 = "select max(groupno) as m from softprojectcontent";
	$result = mysql_query($str2,$conn); //查询
	$rst = mysql_fetch_array($result);
	$t = $rst['m'];
	for ($i=0;$i<$k;$i++) {
		if($_POST['choice']==4)
		$str = "update softprojectcontent set groupno=1+".$t.",workcontent='".$content[$i]."',leaderornot = '".$type[$i]."',softtype='".$_POST['xs']."',tasktype ='".$_POST['zzxt']."' where sno='".$cars[$i]."'";
		else
		$str = "update softprojectcontent set groupno=1+".$t.",workcontent='".$content[$i]."',leaderornot = '".$type[$i]."',softtype='".$_POST['xs']."',tasktype ='".$_POST['choice']."' where sno='".$cars[$i]."'";
		mysql_query($str,$conn);
} 
$str = "insert into suggest(sno,content) values('".$_POST['sno1']."','".$_POST['content']."')";
		mysql_query($str,$conn);
		
echo "<script> alert('选题成功！');</script>";
echo "<script language='javascript' 
type='text/javascript'>";  
echo "window.location.href='softprojectcount.asp'";  
echo "</script>"; 
?>
<body>
</body>
</html>