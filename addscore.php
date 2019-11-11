<?php
include("ExceltoArray.php");
include("connections.php");
if (!empty ( $_FILES ['file_stu'] ['name'] )) 
 {
    $tmp_file = $_FILES ['file_stu'] ['tmp_name'];
    $file_types = explode ( ".", $_FILES ['file_stu'] ['name'] );
    $file_type = $file_types [count ( $file_types ) - 1];
     /*判别是不是.xls文件,判别是不是excel文件*/
     if (strtolower ( $file_type ) != "xls")              
    {
          print( '不是Excel文件,重新上传' );
		return(-1);
     }
    /*设置上传路径*/
     $savePath = 'Excel/';
    /*以时间来命名上传的文件*/
     $str = date ( 'Ymdhis' ); 
     $file_name = $str . "." . $file_type;
     /*是否上传成功*/
     if (! copy ( $tmp_file, $savePath . $file_name )) 
      {
          print( '上传失败' );
		  return(-1);
      }
    /*
       *对上传的Excel数据进行处理生成编程数据,这个函数会在下面第三步的ExcelToArray类中
      注意：这里调用执行了第三步类里面的read函数,把Excel转化为数组并返回给$res,再进行数据库写入

    */
	 $c = new ExcelToArrary();
  $res = $c->read ( $savePath . $file_name );

   /*

        重要代码 解决Thinkphp M、D方法不能调用的问题   

        如果在thinkphp中遇到M 、D方法失效时就加入下面一句代码

    */
   //spl_autoload_register ( array ('Think', 'autoload' ) );

   /*对生成的数组进行数据库的写入*/
mysqli_autocommit($link,false); // 开始事务
$ok = 1;
  for ($i= 2;$i<= count($res); $i++){ 
      $str= $res[$i]; 
      $sql = "insert into 成绩(学号,课程号,成绩) values('{$str[0]}','{$str[1]}','{$str[2]}')";
	  $result = mysqli_query($link,$sql); //首先删除已经存在的表信息
	  if(!$result)//如果失败
	  {
		  echo mysqli_errno($link) . ": " . mysqli_error($link). "\n";
		  mysqli_rollback($link);
		  mysqli_autocommit($link,true); // 开启自动commit
		  $ok = 0;
		  break;
	  }
    } 
}
if($ok)
{
	mysqli_commit($link);
	mysqli_autocommit($link,true); // 开始自动commit
	echo "<script>
alert('提交成功！');
 window.location.href='uploadspre.html';</script>";//跳转到提交成功页面
	}
	else
	{
		echo "<script>
alert('提交失败，请关注上方错误信息！');
 window.location.href='uploadspre.html';</script>";//跳转到提交成功页面
		}

?>