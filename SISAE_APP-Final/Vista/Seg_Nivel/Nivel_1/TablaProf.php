<?php  require_once '../../../Modelo/ProfCl03.php'; 
$prof = new ProfCl03(); 
$result = $prof->ProfCl03_ListaProf();
?>
<br><br>
<table class="table table-bordered table-hover" style="font-size:13px;" id="prof">
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
  <th>Fecha Nacimiento </th>
  <th>Estado</th>
  <th>Opciones</th>
</thead>
<?php while ($r=$result->fetch_array()){
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
  <td><?php echo $r["Fecha_Nac"]; ?></td>
  <td><?php echo $r["Estado"]; ?></td>
  <td style="width:160px;">
    <a data-id="<?php echo $r["Cedula"]; ?>" class="btn btn-edit btn-sm btn-warning" style="width:60px">Editar</a>
    <a href="#" id="bor-<?php echo $r["Cedula"]; ?>" class="btn btn-sm btn-danger" style="width:60px">Eliminar</a><br><br>
    <a href="#" data-id="<?php echo $r["Cedula"]; ?>" style="width:60px" class="btn btn-matri btn-sm btn-success">Sección</a>
    <a href="#" data-id="<?php echo $r["Cedula"]; ?>" style="width:60px" class="btn btn-Ver btn-sm btn-info">Ver</a>
    <script>
      				$('#bor-'+<?php echo $r['Cedula']?>).click(function(e){
        e.preventDefault();
        swal({
          title: '¿Está seguro?',
          text: "No se podrá recuperar el dato!",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Sí, Eliminar',
          }).then(function () {
        swal({
          title: 'Procesando...',
          text: 'Su petición se esta procesando',
          imageUrl: './Public/img/Loading.gif',
          showConfirmButton:false,
          imageWidth: 130,
          animation:false,
          });        
      $.ajax({   //ELIMINA
        url:'./Controlador/Profesor/EliminarProf.php',
        type:'GET',
        data:'ced='+<?php echo $r['Cedula']?>,
        success:function(data){
          if(data!=1){swal('Ups...', 'Algo salió mal!', 'error')}
            else{
    $('#tabla').html('');
    CargarTabla(<?php echo $pagina; ?>
		);
		swal('Eliminado!', 'El registro fue eliminado', 'success');
		}
		}
		});
		});
		});
</script> 
           </td>
</tr>
<?php } ?>
</table>

<script>
	$(".btn-edit").click(function() {
		id = $(this).data("id");
		$.get("Controlador/Profesor/Formulario_Editar_Prof.php", "ced=" + id, function(data) {
			$("#form-Editar").html(data);
		});
		$('#Modal_Editar').modal('show');
	});

	$(".btn-pag").click(function(e) {
		pg = $(this).data("id");
		CargarTabla(pg);
	});

	$(".btn-matri").click(function() {
		id = $(this).data("id");
		$.get("Controlador/Profesor/Tabla_Sec_Prof.php", "ced=" + id, function(data) {
			$("#tabla-matri").html(data);
		});
		$('#Modal_Matri').modal('show');
	});

	$(".btn-Ver").click(function() {
		id = $(this).data("id");
		$.get("Controlador/Profesor/Ver.php", "ced=" + id, function(data) {
			$("#tabla-ver").html(data);
		});
		$('#Modal_Ver').modal('show');
	}); 
</script>
<script src="assets/datatables/js/datatableProf.js" type="text/javascript"></script>
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

  <div class="modal fade" id="Modal_Matri" tabindex="-1"  role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Asignar Sección a Profesor</h4>
        </div>
        <div class="modal-body">
          <div id="tabla-matri"></div>
        </div><div class="modal-footer">
     <button type="button" class="btn btn-primary guardar" data-dismiss="modal">Guardar</button>
      </div>
      </div><!-- /.modal-content -->  
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

  <div class="modal fade" id="Modal_Ver" role="dialog" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Matrícula del profesor</h4>
        </div>
        <div class="modal-body"> 
        <div id="tabla-ver"></div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->