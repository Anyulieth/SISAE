<?php
require_once '../../../Modelo/SeccionCl19.php';
$sec = new SeccionCl19();
$result = $sec -> SeccionCl19_ListaSec();
?>
<table class="table table-bordered table-hover" style="font-size:13px;" id="secc">
<thead>
  <th>Id Sección</th>
  <th>Grado</th>
  <th>Número de grupo</th>
  <th>Cupo</th>
  <th>Opciones</th>
</thead>
<tbody>
<?php while ($r=$result->fetch_array()){
?>
<tr>
  <td><?php echo $r["ID_Seccion"]; ?></td>
  <td><?php echo $r["Grado"]; ?></td>
  <td><?php echo $r["Num_grupo"]; ?></td>
  <td><?php echo $r["cupo"]; ?></td>  
  <td style="width:150px;"> 
    <a data-id="<?php echo $r["ID_Seccion"]; ?>" class="btn btn-edit btn-sm btn-warning" style="width:60px">Editar</a>
    <a href="#" id="bor-<?php echo $r["ID_Seccion"]; ?>" class="btn btn-sm btn-danger" style="width:60px">Eliminar</a>
    <!--<a href="#" data-id="<?php echo $r["ID_Seccion"];?>" class="btn btn-ver btn-md btn-info" style="width:40px;">Ver</a>-->
    <script>
    				$('#bor-'+<?php echo $r['ID_Seccion']?>).click(function(e){
      e.preventDefault();
      swal({
        title: 'Está seguro?',
        text: "No se puede recuperar el dato!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, Eliminar',
        }).then(function () {
          swal({
  title: 'Procesando',
  text: 'Su peticion se esta procesando',
  imageUrl: './Public/img/Loading.gif',
  showConfirmButton:false,
  imageWidth: 130,
  animation:false,
});
          //ELIMINA
      $.ajax({
      url:'./Controlador/Sec-Grupo/EliminarSeccion.php',
      type:'GET',
      data:'Id_sec='+<?php echo $r['ID_Seccion']?>
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
		$.get("Controlador/Sec-Grupo/Formulario_Edit_Sec.php", "Id_sec=" + id, function(data) {
			$("#form-Editar").html(data);
		});
		$('#Modal_Editar').modal('show');
	});

	$(".btn-ver").click(function() {
		ids = $(this).data("id");
		$.get("Controlador/Sec-Grupo/Tabla_VerEst.php", "Id_sec=" + ids, function(data) {
			$("#tabla-info").html(data);
		});
		$('#Modal_Ver').modal('show');
	});
</script>
<script src="assets/datatables/js/dataTablesSec.js" type="text/javascript"></script>

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

    <div class="modal fade" id="Modal_Ver" role="dialog" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Información completa</h4>
        </div>
        <div class="modal-body"> 
        <div id="tabla-info"></div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->