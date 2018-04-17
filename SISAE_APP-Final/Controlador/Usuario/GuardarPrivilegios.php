<?php require_once '../../Modelo/UsuCl01.php';
$msg = 'Fallo';
$cadena = $_REQUEST['priv'];
$ced = $_REQUEST['ced'];
$arr = array_filter(explode(';',$cadena));
$usu = new UsuCl01();
for($i=0;$i<count($arr);$i++) {
list($id,$est)=explode(',',$arr[$i]);
$result = $usu->ActualizarPrivilegios($ced,$id,$est);
if($result!=1){break;print $msg;}	
}
print $result;
 ?>