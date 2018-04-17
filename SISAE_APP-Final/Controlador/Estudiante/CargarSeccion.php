<?php require_once '../../Modelo/conexion.php' ;
$con = new conexion();
$query = "CALL PaSeccionTb20_SecGra(\"$_REQUEST[idGra]\")";
$result = $con->query($query);
while ($valores = mysqli_fetch_array($result)) {
$resultado = "<option value= \"$valores[id]\">$valores[Seccion]</option>";
print $resultado;
} 
?>