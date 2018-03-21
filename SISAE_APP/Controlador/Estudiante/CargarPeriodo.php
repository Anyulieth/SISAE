	  <?php
   require_once '../../Modelo/EstCl02.php';
                    $est = new EstCl02();
                    $query = $est -> EstCl02_ListaPeriodo();
                    while ($valores = mysqli_fetch_array($query)) {
                      $result= "<option value= \"$valores[Id]\"> $valores[Periodo]</option>";
                      print $result;
                    }
                    ?>  