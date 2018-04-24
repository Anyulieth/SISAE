<?php
require_once '../../../Modelo/EncCl04.php';
$enc = new EncCl04();
$result = $enc -> EncCl04_ListaEnc();
?>
<table class="table table-bordered table-hover" style="font-size:13px;" id="Enc">
<thead>
  <th>Cédula</th>
  <th>Nombre</th>
  <th>1° Apellido</th>
  <th>2° Apellido</th> 
  <th>Dirección</th>
  <th>Género</th>
  <th>Teléfono</th>
  <th>Email</th>
  <th>Clave</th>
  <th>Opciones</th>
</thead>
<tbody>
  <?php 
  while ($r = $result->fetch_array()) {
  ?>
<tr>
  <td><?php echo $r["Cedula"]; ?></td>
  <td><?php echo $r["Nombre"]; ?></td>
  <td><?php echo $r["Apellido1"]; ?></td>  
  <td><?php echo $r["Apellido2"]; ?></td>
  <td><?php echo $r["Direccion"]; ?></td>
  <td><?php echo $r["Genero"]; ?></td>
  <td><?php echo $r["Telefono"]; ?></td>
  <td><?php echo $r["Email"]; ?></td>
  <td><?php echo $r["Clave"]; ?></td>
  <td style="width:160px;"> 
    <a data-id="<?php echo $r["Cedula"]; ?>" class="btn btn-edit btn-sm btn-warning" style="width:60px">Editar</a>
    <a href="#" id="bor-<?php echo $r["Cedula"]; ?>" class="btn btn-sm btn-danger" style="width:60px">Eliminar</a>
    <a href="#" data-id="<?php echo $r["Cedula"]; ?>" style="width:60px;margin-top:5px" class="btn btn-Ver btn-sm btn-info">Ver</a>
    <a href="#" data-id="<?php echo $r["Cedula"]; ?>" style="width:60px;margin-top:5px" class="btn btn-asig btn-sm btn-success">Asignar</a>
    <script>
   		$('#bor-'+<?php echo $r['Cedula']?>).click(function(e){
      e.preventDefault();
      swal({
      	title: '¿Está seguro?',
      	text: "No se puede recuperar el dato!",
      	type: 'warning',
      	showCancelButton: true,
      	confirmButtonColor: '#3085d6',
      	cancelButtonColor: '#d33',
      	confirmButtonText: 'Si, Eliminar',
      	}).then(function () {
          swal({
  title: 'Procesando',
  text: 'Su petición se esta procesando',
  imageUrl: './Public/img/Loading.gif',
  showConfirmButton:false,
  imageWidth: 130,
  animation:false,
});
      		//ELIMINA
	 		$.ajax({
    	url:'./Controlador/Encargado/EliminarEnc.php',
    	type:'GET',
    	data:'ced='+<?php echo $r['Cedula']?>
			, success:function(data) {
				if (data != 1) {
					swal('Ups...', 'Algo salió mal!', 'error')
				} else {
					$('#tabla').html('');
					CargarTabla();
					swal('Eliminado!', 'El registro fue eliminado.', 'success')
				}
			}
			});
			});
			});
</script>
   </td>
</tr>
 <?php
}
          ?>
     </tbody>
</table>

<script>
	$(".btn-edit").click(function() {
		id = $(this).data("id");
		$.get("./Controlador/Encargado/Formulario_Editar_Enc.php", "ced=" + id, function(data) {
			$("#form-Editar").html(data);
		});
		$('#Modal_Editar').modal('show');
	});

	$(".btn-asig").click(function() {
		id = $(this).data("id");
		$.get("Controlador/Estudiante/Tabla_Asignar_Est.php", "ced=" + id, function(data) {
			$("#tabla-asignar").html(data);
		});
		$('#Modal_Asigna').modal('show');
	});

	$(".btn-Ver").click(function() {
		id = $(this).data("id");
		$.get("Controlador/Encargado/Ver.php", "ced=" + id, function(data) {
			$("#tabla-ver").html(data);
		});
		$('#Modal_Ver').modal('show');
	}); 
</script>
<script src="assets/datatables/js/datatableEnc.js" type="text/javascript"></script>

<div class="modal fade" id="Modal_Editar" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Actualizar</h4>
        </div>
        <div class="modal-body">
        <div id="form-Editar"></div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

<div class="modal fade" id="Modal_Asigna" role="dialog" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Asignar Estudiante al encargado</h4>
        </div>
        <div class="modal-body"> 
        <div id="tabla-asignar"></div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

<div class="modal fade" id="Modal_Ver" role="dialog" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Estudiantes asignados al encargado</h4>
        </div>
        <div class="modal-body"> 
        <div id="tabla-ver"></div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->