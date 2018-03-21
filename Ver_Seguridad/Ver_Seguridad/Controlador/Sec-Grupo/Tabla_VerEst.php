<?php
require_once '../../Modelo/SeccionCl19.php';
$secc =$_GET['Id_sec'];
$sec = new SeccionCl19(); 
/*FALTA OBTENER GRADO*/
$result = $sec -> SeccionCl19_ListaEstSec($gra,$secc);

if($result->num_rows>0):?>
<table class="table table-bordered table-hover" style="font-size:13px;">
<thead> 
	<th>Cédula</th>
	<th>Estudiante</th>
	<th>Especialidad</th>
</thead>
<?php while ($r=$result->fetch_array()):?>
<tr>
	<td><?php echo $r["Cedula"]; ?></td>
	<td><?php echo $r["Estudiante"]; ?></td>
	<td><?php echo $r["Especialidad"]; ?></td>
</tr>
<?php endwhile;?>
</table>
<?php else:?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif;?>