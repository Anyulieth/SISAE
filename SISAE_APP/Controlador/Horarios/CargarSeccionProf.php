<?php
   require_once '../../Modelo/ProfCl03.php';
                    $gra = new ProfCl03();
                    $idGra= $_GET['idG'];
                    $idProf= $_GET['ced'];
                    $query = $gra -> ProfCl03_SecProf($idProf,$idGra);
                    while ($valores = mysqli_fetch_array($query)) {
                      $result= "<option value= \"$valores[Id]\"> $valores[Seccion]</option>";
                      print $result;
                    }
                    ?>  