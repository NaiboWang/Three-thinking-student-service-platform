<?php
   include("connection.php");
    $q=mysql_query("SELECT name,type,telephone,sno FROM applyend WHERE state = '未处理'");
    while($e=mysql_fetch_assoc($q))
        $output[]=$e;
	if (isset($output))
		 echo json_encode($output);
    mysql_close();
?>