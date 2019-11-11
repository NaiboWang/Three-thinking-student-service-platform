<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>推免系统信息</title>
</head>
<script src="js/jquery.min.js"></script>
<body>
<p align="center">
 
</p>
 <?php
include("connection.php");
$str1 = "select num from num2";
$result = mysql_query($str1,$conn); //查询
$rst = mysql_fetch_array($result);

	
?> 

<form id="form1" name="form1" method="post" action="pushdeal.php" onSubmit="return check()">
  <p align="center">推免系统信息</p>
  <p align="center">————————————————————————————————————————————  </p>
  <p align="center">推免系统页面访问次数：<?php echo $rst['num'] ?>次</p>
  <p align="center">————————————————————————————————————————————</p>
  <p align="center">增加推免系统信息</p>
  <p align="center">类型：
    <label for="ty"></label>
    <select name="ty" id="ty" onChange="F_Select(this);">
      <option value="1" selected="selected" >推免系统</option>
      <option value="2">推免介绍</option>
    </select>
  </p>
  <p align="center">标题：
    <label for="title"></label>
    <input type="text" name="title" id="title" />
  </p>
  <p align="center">链接：
    <input type="text" name="link" id="link"  placeholder="必须有http://" />
  </p>
  <p align="center">大学：
    <input type="text" name="university" id="university" />
  </p>
  <div id="jss" name="jss">
  <p align="center">报名截止日期：
    <input name="radio" type="radio" id="c1" value="1" checked="checked" />
    <label for="c1"></label>
<input type="date" name="deadline" id="deadline" />
    <label for="type"></label>
    <input type="radio" name="radio" id="c2" value="2" />
    不确定
  </p>
  <p align="center">面试开始时间：
    <input name="radio2" type="radio" id="c3" value="1" checked="checked" />
<input type="date" name="startime" id="startime" />
  <input type="radio" name="radio2" id="c4" value="2" />
  不确定
  </p>
  </div>
  <p align="center">知名度：
    <input name="popularity" type="text" id="popularity"  placeholder="数字,看下方表格" />
  </p>
  <p align="center">注：知名度越高排序越靠前，同一学校要保证知名度相同。</p>
  <p align="center">
    <input type="submit" name="submit" id="submit" value="提交" />
    <input type="reset" name="reset" id="reset" value="重置" />
  </p>
</form>
<script>
function F_Select(select) 
{ 

   for(iIndex=0;iIndex < select.length;iIndex++) 
        { 
                  if(select.options[iIndex].selected) 
                  { 
                             if(select.options[iIndex].value=="1") 
                              { 
          document.getElementById('jss').style.display="";
							  }
							  else
  							  {
								  document.getElementById('jss').style.display="none";
		   	  
							}
                  }                   
        } 
} 


function check() //注册提交检测
{
	
 
    if (document.getElementById('title').value == "") {
        alert("请输入标题")
		 return false;
    }

	 ss = document.getElementById('link').value;
		re = /^http:\/\/.*$/
		if (re.test(ss)) {} else {
			alert("请输入正确的链接格式");
			return false;
		}

	
	 if (document.getElementById('university').value == "") {
        alert("请输入大学")
		 return false;
    }
	if( document.getElementById('jss').style.display=="")
	{

		var radios = document.getElementsByName("radio");
		 var planid;
		 var result = false;
		 for ( var i = 0; i < radios.length; i++) {
		  if (radios[i].checked) {
		   planid = radios[i].value;
		   result = true;
		   break;
		  }
		 }
		 // alert(planid);
		 if (!result) {
		  alert("单选框不能为空！")
		 } else {
		 if (planid == "1") {
				   if (document.getElementById('deadline').value == "") {
					alert("请输入报名截止时间");
					 return false;
				}
				
				}
				
				
		
 }
 
	var radios = document.getElementsByName("radio2");
		 var planid;
		 var result = false;
		 for ( var i = 0; i < radios.length; i++) {
		  if (radios[i].checked) {
		   planid = radios[i].value;
		   result = true;
		   break;
		  }
		 }
		 // alert(planid);
		 if (!result) {
		  alert("单选框不能为空！")
		 } else {
		 if (planid == "1") {
				   if (document.getElementById('startime').value == "") {
					alert("请输入面试开始时间");
					 return false;
				}
				
				}
				
				
		
 }
 
var radios = document.getElementsByName("radio");
		 var planid;
		 var result = false;
		 for ( var i = 0; i < radios.length; i++) {
		  if (radios[i].checked) {
		   planid = radios[i].value;
		   result = true;
		   break;
		  }
		 }
		 // alert(planid);
		 if (!result) {
		  alert("单选框不能为空！")
		 } else {
		 if (planid == "1") {
				  
				  
				  var radios = document.getElementsByName("radio2");
		 var planid;
		 var result = false;
		 for ( var i = 0; i < radios.length; i++) {
		  if (radios[i].checked) {
		   planid = radios[i].value;
		   result = true;
		   break;
		  }
		 }
		 // alert(planid);
		 if (!result) {
		  alert("单选框不能为空！")
		 } else {
		 if (planid == "1") {
				   if (document.getElementById('startime').value <=document.getElementById('deadline').value) {
					alert("面试开始时间应在报名截止时间之后");
					 return false;
				}
				
				}
				
				
		
 }
 
				  
				  
				
				}
				
				
		
 }
 



			
		
		
	}
	
	
	 ss = document.getElementById('popularity').value;
		re = /^\d{1,}$/
		if (re.test(ss)) {} else {
			alert("请输入正确的知名度格式");
			return false;
		}

	
	
					
if(confirm("是否确认提交推免信息？"))
{
	return true;
	
	}
	else
	{
		return false;
		}
}


</script>

 <p>
  
 </p>
 <div  align="center"class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
   <p>&nbsp;</p>
   <p>最近访问推免页面行为</p>
    <?php
$sql = "select * from recordtm order by ID desc";
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

   <p>已发布推免信息</p>
   <table class="datatable">
     <thead>
       <tr >
         <th>ID</th>
         <th>标题</th>
         <th>大学</th>
         <th>类型</th>
         <th>报名截止时间</th>
         <th>面试开始时间</th>
         <th>知名度</th>
         <th>状态</th>
         <th>操作</th>
       </tr>
     </thead>
     <tbody id = "mainbody">
       <?php
$str1 = "select * from pushfree order by popularity desc";
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
         <?php if($rst['identity'] == 1){ ?>
         <td><?php echo $rst['deadline']?></td>
         <?php } else{?>
                  <td > 不确定 </td>
                 
                  <?php } ?>
                  <?php if($rst['identity2'] == 1){ ?>
          <td><?php echo $rst['startime']?></td>
           <?php } else{?>
                  <td > 不确定 </td>
                 
                  <?php } ?>
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
                <td><a href="deletepush.php?ID=<?php echo $rst['ID']?>"  onclick="return con()" >删除</a></td>  
       </tr>
       <?php 
		$i = $i + 1;
		} ?>
     </tbody>
   </table>
 </div>
 <script>
 function con()
 {
	 if(confirm("是否确认要删除？"))
	 {
		 return true;
		 }
		 else
		 {
			 return false;
			 }
	 }
 </script>
<p align="center">&nbsp;</p>
</body>

</html>