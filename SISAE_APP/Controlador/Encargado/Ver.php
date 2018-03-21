<?php
$idEnc= $_GET['ced'];  
require_once '../../Modelo/EncCl04.php';
$enc = new EncCl04();
$result = $enc->EncCl04_ListaEst($idEnc);

  if($result){ ?>
<table class="table table-bordered table-hover" style="font-size:13px;">
<thead>
  <th>Cédula</th>
  <th>Estudiante</th>
  <th>Sección</th>
  </thead>
<tbody>
<?php foreach ($result as $r){ ?>
<tr>
  <td><?php echo $r["Cedula"]; ?></td>
  <td><?php echo $r["Estudiante"]; ?></td>
  <td><?php echo $r["Seccion"]; ?></td>
</tr>
 <?php }?>       
</tbody>
</table>    
     <?php
}else {?>
<p class="alert alert-warning">No hay resultados</p>
<?php 
}
?>