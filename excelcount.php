<?php
include("connection.php");
include './Classes/PHPExcel.php';
$str1 = "select * from countinfor where ID ='".$_POST['ID']."'";
$result = mysql_query($str1,$conn); //查询
$rst = mysql_fetch_array($result);
$tablename = $rst['tablename'];
$inforname = $rst['inforname'];
$tabletitle = $rst['title'];

$str="select * from ".$inforname." order by 学号";
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
$excel->getActiveSheet()->setTitle($tabletitle);
//Excel表格式,这里简略写了8列
$letter = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
//表头数组
$tableheader = array();
$str1 = "select * from ".$inforname." order by ID asc";
$result = mysql_query($str1,$conn); //查询
while($rst = mysql_fetch_array($result))
{
	$tableheader[] = $rst['title'];
}
//填充表头信息
for($i = 0;$i < count($tableheader);$i++) {
$excel->getActiveSheet()->setCellValue("$letter[$i]1","$tableheader[$i]");
}
$k = 0;
$str1 = "select * from ".$tablename." order by 学号";
$result = mysql_query($str1,$conn); //查询

while($rst2 = mysql_fetch_array($result))
{
	for($i = 0;$i < count($tableheader);$i++) {
		$data[$k][$i] = $rst2[$tableheader[$i]];
			}
	$k = $k + 1;
}

//填充表格信息
for ($i = 2;$i <= count($data) + 1;$i++) {
$j = 0;
	foreach ($data[$i - 2] as $key=>$value) {
	$excel->getActiveSheet()->setCellValueExplicit("$letter[$j]$i","$value",PHPExcel_Cell_DataType::TYPE_STRING);
	$j++;
	}
}

$k = $k + 1;

   $excel -> getActiveSheet() ->getStyle('A1:'.$letter[$j-1].$k)->applyFromArray($styleArray);//这里就是画出从单元格A5到N5的边框，看单元格最右边在哪哪个格就把这个N改为那个字母替代  
	$excel->getActiveSheet()->freezePane("A2");//冻结
$excel -> getActiveSheet() -> getColumnDimension('A') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('B') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('C') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('D') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('E') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('F') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('G') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('H') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('I') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('J') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('K') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('L') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('M') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('N') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('O') -> setWidth(15);
$excel -> getActiveSheet() -> getColumnDimension('P') -> setWidth(15);
$excel->getActiveSheet()->getStyle('A1:Z'.$k)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

//创建Excel输入对象
$write = new PHPExcel_Writer_Excel5($excel);
header("Pragma: public");
header("Expires: 0");
header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
header("Content-Type:application/force-download");
header("Content-Type:application/vnd.ms-execl");
header("Content-Type:application/octet-stream");
header("Content-Type:application/download");;
header('Content-Disposition:attachment;filename="'.$tabletitle.'.xls"');
header("Content-Transfer-Encoding:binary");
$write->save('php://output');
?>