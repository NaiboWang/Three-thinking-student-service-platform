<title>退出组</title>
<?php
include("connection.php");
if($_POST['type'] == "组长")
{
	$str2 = "update softprojectcontent set groupno=0,tasktype=null,leaderornot = '组员',softtype=null,workcontent=null where groupno =".$_POST['groupo'];

	}
	else
	{
		$str2 = "update softprojectcontent set groupno=0,tasktype=null,leaderornot = '组员',softtype=null,workcontent=null  where sno ='".$_POST['sno']."'";
		
		 
		}
		$result = mysql_query($str2,$conn); //查询
	echo "<script> alert('退出成功，如果您是组长，请通知其他组内其他同学。');</script>"; 
	echo "<script language='javascript' 
type='text/javascript'>";  
echo "window.location.href='softprojectcount.asp'";  
echo "</script>"; 
?>