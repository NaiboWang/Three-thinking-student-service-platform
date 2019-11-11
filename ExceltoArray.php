<?php
class ExcelToArrary{
 public function __construct() {
     /*导入phpExcel核心类    注意 ：你的路径跟我不一样就不能直接复制*/
     include_once('./Classes/PHPExcel.php');
 }
public function read($filename,$encode='utf-8'){
          $objReader = PHPExcel_IOFactory::createReader('Excel5'); 
          $objReader->setReadDataOnly(true); 
          $objPHPExcel = $objReader->load($filename); 
          $objWorksheet = $objPHPExcel->getActiveSheet();
	$highestRow = $objWorksheet->getHighestRow(); 
$highestColumn = $objWorksheet->getHighestColumn(); 
$highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn); 
$excelData = array(); 
for ($row = 1; $row <= $highestRow; $row++) { 
for ($col = 0; $col < $highestColumnIndex; $col++) { 
$excelData[$row][] =(string)$objWorksheet->getCellByColumnAndRow($col, $row)->getValue();
} 
} 
        return $excelData; 
    }
}
?>