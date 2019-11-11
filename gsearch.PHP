<?php
   include("connection.php");
    $q=mysql_query("SELECT 学号,姓名,学籍所在地,接受单位名称,户口是否在校,协议返回情况,双选会 FROM applythree WHERE 学号 = '{$_GET['sno']}'");
    $e=mysql_fetch_assoc($q);
    $output[]=$e;
	if (isset($output))
		 echo json_encode($output);
    mysql_close();
?>