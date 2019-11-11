<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>夏令营信息</title>
</head>
<script src="js/jquery.min.js"></script>
<body>
<p align="center">
 
</p>
 <?php
include("connection.php");
$str1 = "select num from num";
$result = mysql_query($str1,$conn); //查询
$rst = mysql_fetch_array($result);

	
?> 

<form id="form1" name="form1" method="post" action="">
  <p align="center">夏令营信息</p>
  <p align="center">————————————————————————————————————————————</p>
  <p align="center">注意：此页面<strong>不可刷新</strong>，否则会导致重复插入，删除信息后，请关闭此页面重新进入。</p>
  <p align="center">夏令营页面访问次数：<?php echo $rst['num'] ?>次</p>
  <p align="center">————————————————————————————————————————————</p>
  <p align="center">增加夏令营</p>
  <p align="center">标题：
    <label for="title"></label>
    <input type="text" name="title" id="title" />
  </p>
  <p align="center">链接：
    <input type="text" name="link" id="title2" />
  </p>
  <p align="center">大学：
    <input type="text" name="university" id="title3" />
  </p>
  <p align="center">截止日期：
    <input type="date" name="deadline" id="title5" />
    <label for="type"></label>
  </p>
  <p align="center">知名度：
    <input type="text" name="popularity" id="title4" />
  </p>
  <p align="center">类型：
    <input name="box[]"  value="zs" type="checkbox" id="type" checked="checked" />
    直硕 
    <input name="box[]"  value="zb" type="checkbox" id="type2" checked="checked" />
    直博
    <input name="box[]"  value="yy" type="checkbox"/>
    优研
    <input name="box[]"  value="qt" type="checkbox"/>
    其他
  </p>
  <p align="center">
    <input type="submit" name="submit" id="submit" value="提交" />
    <input type="reset" name="reset" id="reset" value="重置" />
<input type="hidden" id="pass" name="pass" value="xlyfbxg" />
  </p>
</form>
 <p>
   <?php
if(isset($_POST['submit']) && $_POST['submit']){
        $sql = "insert into summercamp(title,link,University,deadline,pubdate,authority,type,popularity) values('".$_POST['title']."','" .$_POST['link']."','" .$_POST['university']."','".$_POST['deadline']."','".date("20y-m-d",time())."',1,('";//从数据库中查询数据
		$a = 0;
		
		if(isset($_POST['box']))
		{
			$array = $_POST['box'];
			if(in_array('zs',$array))
			{
				if($a <>0)
				$sql = $sql.",";
				else
				$a = $a +1;
				$sql = $sql."直硕";
			}
			if(in_array('zb',$array))
			{
				if($a <>0)
				$sql = $sql.",";
				else
				$a = $a +1;
				$sql = $sql."直博";
			}
			if(in_array('yy',$array))
			{
				if($a <>0)
				$sql = $sql.",";
				else
				$a = $a +1;
				$sql = $sql."优研";
			}
			if(in_array('qt',$array))
			{
				if($a <>0)
				$sql = $sql.",";
				else
				$a = $a +1;
				$sql = $sql."纯粹的交流";
			}
		}
		$sql = $sql."'),".$_POST['popularity'].")";
		
        	$query = mysql_query($sql);
			$sql = "call time()";
		
        	$query = mysql_query($sql);
			unset($_POST['submit']);
		echo "<script> alert('插入成功');</script>";
        	//$row = mysql_fetch_assoc($query);//数据结果集
    }
	
$sql = "select * from record";
$result = mysql_query($sql,$conn); //查询

$iid = array(); 
while($rst = mysql_fetch_array($result))

?>
 </p>
 <div  align="center"class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
   <p>&nbsp;</p>
   <p>最近访问夏令营行为</p>
    <?php
$sql = "select * from recordxly order by ID desc";
$result = mysql_query($sql,$conn); //查询
$n1 = 0;
?>
<div align="center" style="overflow:scroll; height:500px; width: 600px;">
<table width="495" border="1">
<tr align="center">
      <td height="24">ID</td>
      <td>IP</td>
      <td>记录</td>
      <td>行为</td>
      </tr>
      
<?
while($rst = mysql_fetch_array($result))
{
	if($n1 <300)
	{
?>
  
    <tr align="center">
      <td height="24"><?php print $rst['ID'] ?></td>
      <td><?php print $rst['IP'] ?></td>
      <td><?php print $rst['time'] ?></td>
      <td><?php print $rst['type'] ?></td>
      </tr>
 
    <?php
	
	}
	$n1++;
}
?>
 </table>
</div>

   <p>已发布夏令营信息</p>
   <table class="datatable">
     <thead>
       <tr >
         <th>ID</th>
         <th>标题</th>
         <th>大学</th>
         <th>类型</th>
         <th>材料投递截止时间</th>
         <th>知名度</th>
         <th>状态</th>
         <th>操作</th>
       </tr>
     </thead>
     <tbody id = "mainbody">
       <?php
$str1 = "select * from summercamp order by popularity desc";
$result = mysql_query($str1,$conn); //查询
$i = 1;
while($rst = mysql_fetch_array($result))
{
?>
       <tr id = "delCell">
         <td><?php echo $i?></td>
         <td style="text-align:left"><a href="<?php echo $rst['link']?>" target="_blank"><?php echo $rst['title']?></a></td>
         <td><?php echo $rst['University']?></td>
         <td><?php echo $rst['type']?></td>
         <td><?php echo $rst['deadline']?></td>
         <td><?php echo $rst['popularity']?></td>
         <?php if ($rst['states'] == "进行中")
				  { ?>
         <td style="color:#00F"><?php echo $rst['states']?></td>
         <?php }		  
				  elseif($rst['states'] == "即将截止")
				  {
				   ?>
         <td style="color:#F00"><?php echo $rst['states']?></td>
         <?php
				  }
				  else{ ?>
         <td style="color:#666"><?php echo $rst['states']?></td>
         <?php
				  }
				  ?>
                <td><a href="deletexly.php?ID=<?php echo $rst['ID']?>" target = "_blank">删除</a></td>  
       </tr>
       <?php 
		$i = $i + 1;
		} ?>
     </tbody>
   </table>
 </div>
<p align="center">&nbsp;</p>
</body>
</html>