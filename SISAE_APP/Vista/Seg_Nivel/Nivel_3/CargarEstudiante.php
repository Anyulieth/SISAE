<?php require_once '../../../Modelo/conexion.php' ;
$con = new conexion();
$query = "CALL PaEstEncTb07_CargarEst(\"$_REQUEST[idenc]\")";
$result = $con->query($query);
while ($valores = mysqli_fetch_array($result)) {
$resultado = "<option value= \"$valores[Cedula]\">$valores[Cedula] </option>";
print $resultado;
} 
?>