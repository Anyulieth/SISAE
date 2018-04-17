<?php 
require_once '../../Modelo/conexion.php';
$con = new conexion();
$query = "CALL PaProfTb04_ListarMatProf(\"$_REQUEST[ced]\")";
$result = $con->query($query);
while ($valores = mysqli_fetch_array($result)) {
$resultado = "<option value= \"$valores[Id]\"> $valores[Materia] </option>";
print $resultado;
}
?>  