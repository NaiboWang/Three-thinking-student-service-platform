<?php
include("connection.php");
include './Classes/PHPExcel.php';
$str="select ID,content from suggest order by content";
$result = mysql_query($str,$conn); //查询



$styleArray = array(  
        'borders' => array(  
            'allborders' => array(  
                //'style' => PHPExcel_Style_Border::BORDER_THICK,//边框是粗的  
                'style' => PHPExcel_Style_Border::BORDER_THIN,//细边框  
                //'color' => array('argb' => 'FFFF0000'),  
            ),  
        ),  
    );  


//创建对象
$excel = new PHPExcel();
$excel->setActiveSheetIndex(0);
$excel->getActiveSheet()->setTitle('留言统计');
//Excel表格式,这里简略写了8列
$letter = array('A','B','C','D','E','F','F','G');
//表头数组
$tableheader = array('留言');
//填充表头信息
$excel->getActiveSheet()->getTabColor()->setARGB( '#FF00FFFF');     //设置标签颜色
for($i = 0;$i < count($tableheader);$i++) {
$excel->getActiveSheet()->setCellValue("$letter[$i]1","$tableheader[$i]");
}
$k = 0;

while($rst = mysql_fetch_array($result))
{
	$data[$k]=array($rst['content']);
	$k = $k + 1;
}

//填充表格信息
for ($i = 2;$i <= count($data) + 1;$i++) {
$j = 0;
foreach ($data[$i - 2] as $key=>$value) {
$excel->getActiveSheet()->setCellValue("$letter[$j]$i","$value");
$j++;
}
}
$k = $k + 1;
$excel -> getActiveSheet() -> getColumnDimension('A') -> setWidth(200);

   $excel -> getActiveSheet() ->getStyle('A1:A'.$k)->applyFromArray($styleArray);//这里就是画出从单元格A5到N5的边框，看单元格最右边在哪哪个格就把这个N改为那个字母替代  
	$excel->getActiveSheet()->getStyle('A1:A'.$k)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

	$excel->getActiveSheet()->freezePane("A2");

$excel->createSheet(); 
$excel->setActiveSheetIndex(1);
$excel->getActiveSheet()->setTitle('大作业统计');

$letter = array('A','B','C','D','E','F','G','H');
//表头数组
$tableheader = array('组号','题目','形式','学号','姓名','职务','负责内容');
//填充表头信息
for($i = 0;$i < count($tableheader);$i++) {
$excel->getActiveSheet()->setCellValue("$letter[$i]1","$tableheader[$i]");
}
$excel->getActiveSheet()->getTabColor()->setARGB( 'FF0094FF');     //设置标签颜色
$excel->getActiveSheet()->getStyle('C'.$j)->getNumberFormat()->setFormatCode("@");

//表格数组
$k = 0;
unset($data);
$str="select * from softprojectcontent order by groupno asc,leaderornot desc,sno asc";
$result = mysql_query($str,$conn); //查询
$no = -1;
$non = 0;
while($rst = mysql_fetch_array($result))
{
	
	if($no <>$rst['groupno'])
	{
		$non = $non +1;
		$no = $rst['groupno'];
	}
	if($rst['groupno'] <> 0)
	$data[$k]=array($non,$rst['tasktype'],$rst['softtype'],$rst['sno'],$rst['sname'],$rst['leaderornot'],$rst['workcontent']);
	else
	$data[$k]=array("尚未提交",$rst['tasktype'],$rst['softtype'],$rst['sno'],$rst['sname'],$rst['leaderornot'],$rst['workcontent']);
	$k = $k + 1;
}

//填充表格信息
for ($i = 2;$i <= count($data) + 1;$i++) {
$j = 0;
foreach ($data[$i - 2] as $key=>$value) {
$excel->getActiveSheet()->setCellValueExplicit("$letter[$j]$i","$value",PHPExcel_Cell_DataType::TYPE_STRING);
$excel->getActiveSheet()->getStyle($letter[$j].$i)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);

if($data[$i - 2][0] % 2 <> 0)
$excel->getActiveSheet()->getStyle($letter[$j].$i)->getFill()->getStartColor()->setARGB('FFECFFFF');
else
$excel->getActiveSheet()->getStyle($letter[$j].$i)->getFill()->getStartColor()->setARGB('0F00FFFF');

$j++;
}
}
$k = $k + 1;
 
    $excel -> getActiveSheet() ->getStyle('A1:G'.$k)->applyFromArray($styleArray);//这里就是画出从单元格A5到N5的边框，看单元格最右边在哪哪个格就把这个N改为那个字母替代  
	$excel->getActiveSheet()->freezePane("A2");
	


$excel -> getActiveSheet() -> getColumnDimension('A') -> setWidth(10);
$excel -> getActiveSheet() -> getColumnDimension('B') -> setWidth(20);
$excel -> getActiveSheet() -> getColumnDimension('D') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('E') -> setWidth(17);
$excel -> getActiveSheet() -> getColumnDimension('F') -> setWidth(10);
$excel -> getActiveSheet() -> getColumnDimension('C') -> setWidth(13);
$excel -> getActiveSheet() -> getColumnDimension('G') -> setWidth(50);
$excel->getActiveSheet()->getStyle('A1:G'.$k)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);


$excel->setActiveSheetIndex(0); 
//创建Excel输入对象
$write = new PHPExcel_Writer_Excel5($excel);
header("Pragma: public");
header("Expires: 0");
header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
header("Content-Type:application/force-download");
header("Content-Type:application/vnd.ms-execl");
header("Content-Type:application/octet-stream");
header("Content-Type:application/download");;
header('Content-Disposition:attachment;filename="软件工程大作业统计情况.xls"');
header("Content-Transfer-Encoding:binary");
$write->save('php://output');
?>