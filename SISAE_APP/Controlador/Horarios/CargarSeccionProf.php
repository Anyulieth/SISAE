<?php /*require_once '../../Modelo/conexion.php' ;
$con = new conexion();
//$query = "CALL PaProfTb04_ListarSecProf2(\"$_REQUEST[ced]\")";
$query = "CALL PaProfTb04_ListarSecProf(\"$_REQUEST[ced]\",\"$_REQUEST[id]\")";
$result = $con->query($query);
while ($valores = mysqli_fetch_array($result)) {
$resultado = "<option value= \"$valores[id]\">$valores[Seccion]</option>";
print $resultado;
} */
?>



<?php
   require_once '../../Modelo/ProfCl03.php';
                    $gra = new ProfCl03();
                    $idGra= $_GET['idG'];
                    $idProf= $_GET['ced'];
                    $query = $gra -> ProfCl03_SecProf($idProf,$idGra);
                    while ($valores = mysqli_fetch_array($query)) {
                      $result= "<option value= \"$valores[id]\"> $valores[Seccion]</option>";
                      print $result;
                    }
                    ?>  