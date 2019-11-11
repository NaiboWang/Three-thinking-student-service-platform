<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导师信息管理</title>
</head>
 <?php
   include("connection.php");
include("teacherconfirm.php");
$str1 = "select news from count";
$result = mysql_query($str1,$conn); //查询
$rst = mysql_fetch_array($result);



?>
<style>
 .GoStyle
    {
         color:#00F;          
         background-color: #FFFFFF;
         border: 0px none;
         cursor:pointer;
         font-size: 16px;
		 text-decoration:underline;
    }
	
</style>
<script src="js/jquery.min.js"></script>
<body>
<p align="center">导师信息管理</p>
<p align="center">——————————————————————————————————————</p>
<p align="center">导师信息页面总访问次数：<?php echo $rst['news'] ?>次</p>
<p align="center">注：增加或删除完导师信息后，请<strong>手动刷新</strong>本页面。</p>
<form id="form1" name="form1" method="post" action="insertteacher.php" target="_blank">
  <div align="center">
    <input  style="width:200px; height:50px; font-size:20px"type="submit" name="button" id="button" value="增加导师信息" />
    <input type="hidden" id="adminname" name="adminname" value="<?php echo $_POST['adminname']?>" />
<input type="hidden" id="pass" name="pass" value="dsxxfbxg" />

  </div>
</form>
<p align="center">——————————————————————————————————————</p>
<p align="center"></p>
 <div align="center">
  
   已发布导师信息
</div>
 <div  align="center"class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
   <table class="datatable">
     <thead>
       <tr >
         <th>ID</th>
         <th>标题</th>
         <th>发布时间</th>
         <th>访问量</th>
         <th>操作</th>
          <th>操作2</th>
       </tr>
     </thead>
     <tbody id = "mainbody">
       <?php
$str1 = "select * from teacher order by ID desc";
$result = mysql_query($str1,$conn); //查询
$i = 1;
while($rst = mysql_fetch_array($result))
{
?>
       <tr id = "delCell">
         <td><div align="center"><?php echo $i?></div></td>
         <td style="text-align:left"><a href="teachernews.asp?ID=<?php echo $rst['ID']?>" target="_blank"><?php echo $rst['title']?></a></td>
         <td><div align="center"><?php echo $rst['time']?></div></td>
         <td><div align="center"><?php echo $rst['num']?></div></td>
            <td><div align="center">
            
            <form id="form2" name="form2" method="post" action="updateteacher.php" target="_blank">
  
    <input  type="submit" class = "GoStyle" name="button" id="button" value="修改" />
    <input type="hidden" id="adminname" name="adminname" value="<?php echo $_POST['adminname']?>" />
<input type="hidden" id="pass" name="pass" value="dsxxfbxg" />

 <input type="hidden" id="ID" name="ID" value="<?php echo $rst['ID']?>" />
</form>
            
            </div>
           
            
         </td>  
                <td><div align="center">
                  <form id="form3" name="form3" method="post" action="deleteteacher.php"  onsubmit="return confirm2()"  target="_blank">
  
    <input  type="submit" class = "GoStyle" name="button" id="button" value="删除" />
    <input type="hidden" id="adminname" name="adminname" value="<?php echo $_POST['adminname']?>" />
<input type="hidden" id="pass" name="pass" value="dsxxfbxg" />
<input type="hidden" id="ID" name="ID" value="<?php echo $rst['ID']?>" />
 
</form>

         </td>  
       </tr>
      
       <?php 
		$i = $i + 1;
		} ?>
         <script>
	   function confirm2()
	   {
		   if(confirm('确认要删除吗？'))
			   return true
			  else
			  return false
			   
		   
		 }
	   </script>
     </tbody>
   </table>
 </div>
<p align="center">&nbsp;</p>
</body>
</html>