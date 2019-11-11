<?php
date_default_timezone_set('prc');
require_once('tcpdf.php'); 
//实例化 
header("Content-type:text/html;charset=utf-8");
$mysql_server_name='localhost'; //改成自己的mysql数据库服务器
$mysql_username='root'; //改成自己的mysql数据库用户名
$mysql_password='q982311099'; //改成自己的mysql数据库密码
$mysql_database='student'; //改成自己的mysql数据库名
$conn=mysql_connect($mysql_server_name,$mysql_username,$mysql_password) or die("error connecting") ; //连接数据库
mysql_query("set names 'utf8'"); //数据库输出编码 应该与你的数据库编码保持一致.南昌网站建设公司百恒网络PHP工程师建议用UTF-8 国际标准编码.
mysql_select_db($mysql_database); //打开数据库
$xh = $_POST['users'];
$sql2 ="insert into record(sno,time) values('" . $xh . "','".date('y-m-d h:i:s',time())."')"; //SQL语句
$sql ="select * from 身份信息（不可泄露） where 学号 = '" . $xh . "'"; //SQL语句
$result = mysql_query($sql,$conn); //查询
$sql22 ="select * from 保研排名 where 学号 = '" . $xh . "'"; //SQL语句
$result22 = mysql_query($sql22,$conn); //查询

$rrrrr = mysql_query($sql2,$conn); //插入
$row = mysql_fetch_array($result);
$row2 = mysql_fetch_array($result22);
$sqlss ="select * from 方向配置 where 年级 = '{$row['年级']}' and 方向名 = '{$row['培养方向']}'"; //SQL语句
$results = mysql_query($sqlss,$conn); //查询
$sh = mysql_fetch_array($results);//成绩证明开放开关
$switch = $sh['允许下载'];
if(!isset($sh['小方向']))
	$xfx = "";
elseif(strlen($sh['小方向'])<2)
	$xfx = "";
else
	$xfx = "（".$sh['小方向']."）";
$totall = $row2['学业成绩'] + $row2['综合素质能力'];
if($switch <> 1)
	$str1 =  "系统不允许下载成绩排名";
else if($row['md5'] <> $_POST['md5'] )
	$str1 =  "权限错误！";
else
$str1 =  "		兹证明，". $row['姓名']."，".$row['性别']."，身份证号".$row['身份证号']."，系我院".$sh['大方向']."专业".$row['教学班']."班学生，学号".$row['学号']."，大学期间学业成绩分数为：".$row2['学业成绩']."分，综合素质能力成绩分数为：".$row2['综合素质能力']."分，总分为：".$totall."分，总排名为：".$row2['名次']."/".$sh['人数'].$xfx."。";
$pdf = new TCPDF('P', 'mm', 'A4', true, 'UTF-8', true); 
// 设置文档信息 
$pdf->SetCreator('Three-Thinking'); 
$pdf->SetAuthor('Three-Thinking'); 
$pdf->SetTitle('rankpdf'); 
$pdf->SetSubject('rank'); 
$pdf->SetKeywords('TCPDF, PDF, PHP'); 
// 设置默认等宽字体 
$pdf->setPrintHeader(false);//页眉
$pdf->setPrintFooter(false);//页脚
$pdf->SetDefaultMonospacedFont('courier'); 
// 设置间距 
$pdf->SetMargins(32, 25, 32); 
$pdf->SetHeaderMargin(5); 
$pdf->SetFooterMargin(10);
$pdf->setImageScale(62); 
$pdf->setFontSubsetting(true); 
//设置字体 
$pdf->SetFont('simhei', '', 16); 
$pdf->AddPage();
$pdf->Write(0,"证  明",'', 0, 'C', true, 0, false, false, 0); 
$pdf->Ln(6);
//$pdf->SetTextColor(255,255,255);
$pdf->SetFont('stsongstdlight', '', 14);
//$pdf->Cell(10, 10, $txt='缩进',0,0);
//$pdf->SetTextColor(0,0,0);
$pdf->Write(10,$str1,'', 0, 'L', true, 0, false, false, 0); 
$pdf->Ln(16);
$pdf->Write(10,"西安电子科技大学计算机学院",'', 0, 'R', true, 0, false, false, 0); 
$time = time();
$pdf->Write(10,date("20y年m月d日",$time),'', 0, 'R', true, 0, false, false, 0); 
$pdf->Ln(30);
$pdf->Write(10,"辅导员签字：",'', 0, 'L', true, 0, false, false, 0); 
$pdf->Ln(110);

$pdf->Write(10,"成绩证明真实性校验码(防止伪造成绩排名)：".($sh['人数'] -$row2['名次']) % (substr(date("d",$time),1,1)+10),'', 0, 'L', true, 0, false, false, 0); 
//输出PDF 
$na = $row['学号'].$row['姓名']."成绩排名证明.pdf";
$pdf->Output($na, 'D'); 
?> 