<?php
include("connection.php");

if(isset($_POST['tz']))//如果要求推送通知
{
$sql2 = "select *  from timeinfor";
$result = mysql_query($sql2,$conn); //查询
$rst = mysql_fetch_array($result);

$sqlll = mysql_real_escape_string($rst['text1'].$_POST["title"].$rst['text2'].$_POST["instruction"].$rst['text3']);
$sql1 ="insert into informa(title,content,time,publisher) values ('统计：".$_POST["title"]."（重要）"."','".$sqlll."','".date("20y-m-d",time())."','".$_POST["publisher"]."')";
$result = mysql_query($sql1,$conn); //查询
}


$sql1 ="insert into countinfor(title,content,time) values ('".$_POST["title"]."','".mysql_real_escape_string($_POST["instruction"])."','".date("20y-m-d",time())."')";
//echo $sql1;
$result = mysql_query($sql1,$conn); //查询
$sql2 = "select max(ID) as tid from countinfor";

$result = mysql_query($sql2,$conn); //查询
$rst = mysql_fetch_array($result);

$sql3 = "update countinfor set tablename = 'countable".$rst['tid']."',inforname = 'counttableinfor".$rst['tid']."' where ID =".$rst['tid'];

$result = mysql_query($sql3,$conn); //查询
$sql4 = "DROP TABLE IF EXISTS counttableinfor".$rst['tid'];
$sql5 = "DROP TABLE IF EXISTS countable".$rst['tid'];
$result = mysql_query($sql4,$conn); //查询
$result = mysql_query($sql5,$conn); //查询

$sql100 = "update countinfor set md5pass='".md5("countinfor".$rst['tid'])."' where ID = ".$rst['tid'];
$result = mysql_query($sql100,$conn); //查询


$sql6="CREATE TABLE counttableinfor".$rst['tid']." (
ID  integer NULL AUTO_INCREMENT ,
title  char(255) NULL ,
ifreadonly  enum('yes','no') NULL DEFAULT 'no' ,
ifnature  enum('yes','no') NULL DEFAULT 'no' ,
PRIMARY KEY (ID)
)";
$result = mysql_query($sql6,$conn); //查询
$sql6="insert into counttableinfor".$rst['tid']."(title,ifreadonly,ifnature) values('学号','yes','yes')";
$result = mysql_query($sql6,$conn); //查询
$sql6="insert into counttableinfor".$rst['tid']."(title,ifreadonly,ifnature) values('姓名','yes','yes')";
$result = mysql_query($sql6,$conn); //查询
if(isset($_POST['checkbox']))
$arr = $_POST["checkbox"];
if(isset($_POST['checkbox2']))
$arr2 = $_POST["checkbox2"];
if(isset($_POST['checkbox']))
{
	foreach ($arr as $key=>$value )
	{
		if(isset($_POST['checkbox2']))
		{
			if(in_array($value,$arr2))
			{
				$sql6="insert into counttableinfor".$rst['tid']."(title,ifreadonly,ifnature) values('".$value."','no','yes')";
			}
			else
			{
					$sql6="insert into counttableinfor".$rst['tid']."(title,ifreadonly,ifnature) values('".$value."','yes','yes')";
			}
		}
		else
		{
			$sql6="insert into counttableinfor".$rst['tid']."(title,ifreadonly,ifnature) values('".$value."','yes','yes')";
		}
		$result = mysql_query($sql6,$conn); //查询
	}
}

if(isset($_POST['nameofnature']) &&isset($_POST['natureornot']))
{
	$arr3 = $_POST["nameofnature"];
	$arr4 = $_POST["natureornot"];
	foreach ($arr3 as $key=>$value ){
		
		if($arr4[$key] == "加入学生基本属性")
		{
			$sql6="insert into counttableinfor".$rst['tid']."(title,ifreadonly,ifnature) values('".$value."','no','yes')";
			$sql7="alter table 学生信息重要 add ".$value." char(255) default NULL";
			$result = mysql_query($sql7,$conn); //查询
			$sql7="insert into naturereference(name) values('".$value."')";
			$result = mysql_query($sql7,$conn); //查询
			$sql7="insert into infortable(title) values('".$value."')";
			$result = mysql_query($sql7,$conn); //查询
		}
		else
		$sql6="insert into counttableinfor".$rst['tid']."(title,ifreadonly,ifnature) values('".$value."','no','no')";
	$result = mysql_query($sql6,$conn); //查询
	}
}

$sql8 = "CREATE TABLE countable".$rst['tid']." (
";
$sql = "select * from counttableinfor".$rst['tid'];
$result = mysql_query($sql,$conn); //查询
while($rst = mysql_fetch_array($result))
{
	$sql8 =$sql8.$rst['title']." char(255) NULL,";
	}
$sql8 =$sql8."PRIMARY KEY (学号))";
$result = mysql_query($sql8,$conn); //查询
echo "<script>alert('发起统计成功')</script>";
echo '<script>window.close();</script>'; 
?>