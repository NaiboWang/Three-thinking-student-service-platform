<title>添加组员</title>
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

	$str2 = "select sname,groupno from softprojectcontent where sno ='".$_POST['addsno']."'";
	$result = mysql_query($str2,$conn); //查询
	if(mysql_num_rows($result))
	{
		$rst = mysql_fetch_array($result);
		if($rst['groupno']<>0)
		{
				
				echo "<script> alert('学号为".$_POST['addsno'].",姓名".$rst['sname']."的学生已经结组，请返回重新提交。');</script>"; 
				 tz();
			}
			else
			{
				$str2 = "update softprojectcontent set groupno =".$_POST['groupno'].",tasktype ='".$_POST['tasktype']."',leaderornot ='组员',softtype='".$_POST['softtype']."',workcontent='".$_POST['addcontent']."' where sno = '".$_POST['addsno']."'";
	$result = mysql_query($str2,$conn); //查询
	echo "<script> alert('添加成功！');</script>";
	tz();
			}
	}
	else
	{
		echo "<script> alert('找不到学号为".$_POST['addsno']."的学生，请重新提交。');</script>";
		 tz();
	}
	
	
	
	
	
?>