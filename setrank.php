<?php
include("connections.php");
mysqli_query($link,"call updaterank()"); //首先删除已经存在的表信息
	echo "<script>
alert('更新成功！');
 window.location.href='scoreadmin.php';</script>";//跳转到提交成功页面

?>