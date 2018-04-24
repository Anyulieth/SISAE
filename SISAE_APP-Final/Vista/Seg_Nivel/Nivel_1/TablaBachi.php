<?php
require_once '../../../Modelo/BachillerCl13.php';
$bac = new BachillerCl13();
$result = $bac -> BachillerCl13_ListaBac();
?>
<table class="table table-bordered table-hover" style="font-size:13px;" id="Bach">
<thead>
  <th>Id</th>
  <th>Bachiller</th>  
  <th>Opciones</th>
</thead>
<?php while ($r=$result->fetch_array()){
?>
<tr>
  <td><?php echo $r["Id"]; ?></td>
  <td><?php echo $r["Bachiller"]; ?></td> 
  <td style="width:150px;">
    <a data-id="<?php echo $r["Id"]; ?>" class="btn btn-edit btn-sm btn-warning" style="width:60px">Editar</a>
    <a href="#" id="bor-<?php echo $r["Id"]; ?>" class="btn btn-sm btn-danger" style="width:60px">Eliminar</a>
    <script>
    		$('#bor-'+<?php echo $r['Id']?>).click(function(e){
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
      url:'Controlador/Bachiller/EliminarBachi.php',
      type:'GET',
      data:'id='+<?php echo $r['Id']?>
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
<?php } ?>
</table>

<script>
	$(".btn-edit").click(function() {
		id = $(this).data("id");
		$.get("Controlador/Bachiller/Formulario_Editar_Bachi.php", "id=" + id, function(data) {
			$("#form-Editar").html(data);
		});
		$('#Modal_Editar').modal('show');
	});
</script>
<script src="assets/datatables/js/dataTableBachi.js" type="text/javascript"></script>
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