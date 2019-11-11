<?php
if(isset($_POST['pass']) && $_POST['pass']){
	if($_POST['pass'] <> "dsxxfbxg")
	{
		echo "非授权用户登陆";
		exit();
	}
}
else
{
	echo "非授权用户登陆";
exit();
	
	}
?>