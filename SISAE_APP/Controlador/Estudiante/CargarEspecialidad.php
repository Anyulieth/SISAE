	  <?php
   require_once '../../Modelo/EspecialidadCl15.php';
                    $esp = new EspecialidadCl15();
					$query = $esp -> EspecialidadCl15_ListaTodo(); 
                    while ($valores = mysqli_fetch_array($query)) {
                      $result= "<option value= \"$valores[Id]\"> $valores[Nombre]</option>";
                      print $result;
                    }
                    ?>  