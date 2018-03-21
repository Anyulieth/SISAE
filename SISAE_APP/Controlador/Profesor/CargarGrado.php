		  <?php
   require_once '../../Modelo/GradoCl12.php';
                    $gra = new GradoCl12();
                    $idProf= $_GET['ced'];
                    $query = $gra -> GradoCl12_Prof($idProf);
                    while ($valores = mysqli_fetch_array($query)) {
                      $result= "<option value= \"$valores[id_grado]\"> $valores[Nombre]</option>";
                      print $result;
                    }
                    ?>  