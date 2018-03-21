		  <?php
   require_once '../../Modelo/GradoCl12.php';
                    $gra = new GradoCl12();
                    $query = $gra -> GradoCl12_ListaTodo();
                    while ($valores = mysqli_fetch_array($query)) {
                      $result= "<option value= \"$valores[id_grado]\"> $valores[Nombre]</option>";
                      print $result;
                    }
                    ?>  
