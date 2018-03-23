<?php 
public function AsistClaseCl17_BuscaEst($Id_Est){
		$con = new conexion();
		$sql = "call VerificarAsis('".$Id_Est."')";
		$result = $con->query($sql);
		return $result;
	}
if($result){
?>

<?php echo $result['NombreEst'];?>

<?php
}?>