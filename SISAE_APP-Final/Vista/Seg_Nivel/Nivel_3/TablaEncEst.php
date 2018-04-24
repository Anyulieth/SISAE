<?php
require_once '../../../Modelo/conexion.php';
$ced = $_REQUEST['idest'];
$con = new conexion();
$result = $con -> query("CALL PaEstEncTb07_ListarEstEn(\"$ced\")");
$cont = 0;
?> 
<table class="table table-bordered table-hover" style="font-size:13px;">
<thead>
  <th>Cedula</th>
  <th>Nombre Completo</th>
  <th>Direccion</th>
  <th>Genero</th>
  <th>Telefono</th>
  <th>Email</th>
  <th>Fecha Nacimiento </th>
  <th>Adecuacion</th>
  <th>Estado</th>
</thead>
<tbody>
  <?php 
  while ($r = $result->fetch_array()) {
  ?>
<tr>
  <td><?php echo $r["Cedula"]; ?></td>
  <td><?php echo $r["Nombre Completo"]; ?></td>
  <td><?php echo $r["Direccion"]; ?></td>
  <td><?php echo $r["Genero"]; ?></td>
  <td><?php echo $r["Telefono"]; ?></td>
  <td><?php echo $r["Email"]; ?></td>
  <td><?php echo $r["FechaNac"]; ?></td>
  <td><?php echo $r["Adecuacion"]; ?></td>
  <td><?php echo $r["Estado"]; ?></td>
</tr>
</tr>
 <?php
}
          ?>
     </tbody>
</table>

<script>
	$('#ausen').click(function() {
		var para = {
			'est' : $('#est').val()
		}
	});

	$(".btn-pag").click(function(e) {
		pg = $(this).data("id");
		CargarTabla(pg);
	}); 
</script>

<div class="modal fade" id="Modal_Editar" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Estudiante</h4>
        </div>
        <div class="modal-body">
        <div id="form-Editar"></div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->