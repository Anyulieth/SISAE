<?php 
require_once '../../../Modelo/AsistClaseCl17.php';
$res = $_REQUEST['est'];
$idma = $_REQUEST['idma'];
$arr = array_filter(explode(';',$res));
date_default_timezone_set('America/Costa_Rica');
$fecha = Date('Y-m-d');
$Hora = Date('G:i:s');
$asis = new AsistClaseCl17();
for($i=0;$i<count($arr);$i++) {
list($est,$ced)=explode(':',$arr[$i]);
$result = $asis->AsistClaseCl17_AddAsis2($fecha,$Hora,$est,$idma,$ced);
if($result!=1){break;}	
}
print $result;
?>