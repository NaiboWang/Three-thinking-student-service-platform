<!doctype html>
<html>
<head>
<?php 
include("teacherconfirm.php");
?>
	<meta charset="utf-8" />
	<title>增加导师信息</title>
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
	<form name="example" method="post" action="insertteachersuccess.php" target="_blank">
		<p align="center">增加导师信息</p>
		<p align="center">标题：
		  <label for="title"></label>
		  <input  style="width:30%" type="text" name="title" id="title">
           <input type="hidden" id="adminname" name="adminname" value="<?php echo $_POST['adminname']?>" />
		</p>
		<div align="center">
          <p>在此输入具体内容</p>
          <p>
  <textarea name="content1" id="content1" style="width:900px;height:400px;visibility:hidden;"></textarea>
            <br />
            <input onClick="return confirm2()" style="width:200px; height:50px"type="submit" name="button" value="提交内容" />
          </p>
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
			
		   if(confirm('确认要增加吗？'))
			   return true
			  else
			  return false
			   
		   
		 }
	   </script>
<p>&nbsp;</p>
</body>
</html>

