<!doctype html>
<html>
<head>
<?php
include("connection.php");
include("teacherconfirm.php");
$sql ="select title,content from teacher where ID = '".$_POST["ID"]."'"; //SQL语句
$result = mysql_query($sql,$conn); //查询
$row = mysql_fetch_array($result);	
?>
	<meta charset="utf-8" />
	<title>修改导师信息</title>
	<link rel="stylesheet" href="../themes/default/default.css" />
	<link rel="stylesheet" href="../plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor.js"></script>
	<script charset="utf-8" src="../lang/zh-CN.js"></script>
	<script charset="utf-8" src="../plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '../plugins/code/prettify.css',
				uploadJson : '../php/upload_json.php',
				fileManagerJson : '../php/file_manager_json.php',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
</head>
<body>
	<form name="example" method="post" action="updateteachersuccess.php" target="_blank">
		<p align="center">导师信息修改</p>
		<p align="center">标题：
		  <label for="title、"></label>
		  <input name="title" type="text" id="title"  style="width:30%" value="<?php echo $row['title']; ?>">
		</p>
		<div align="center">
		  <textarea name="content1" id="content1"style="width:900px;height:400px;visibility:hidden;"><?php echo htmlspecialchars($row['content']); ?></textarea>
            <input name="ID" type="hidden" id="ID" value="<?php echo $_POST["ID"]; ?>">
            <br />
            <input onClick="return confirm2()" style="width:200px; height:50px"type="submit" name="button" value="保存修改" />
          </p>
        </div>
	</form>
	<script>
	   function confirm2()
	   {
		  
		   if(document.getElementById("title").value=="")
		   	{
				alert("请输入标题内容。")
					return false
			}
		
		   if(confirm('确认要修改吗？'))
			   return true
			  else
			  return false
		 }
	   </script>
<p>&nbsp;</p>
</body>
</html>

