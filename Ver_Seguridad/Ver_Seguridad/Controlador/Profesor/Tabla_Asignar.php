<?php
require_once '../../Modelo/SeccionCl19.php';
$ids =$_GET['Id_sec'];
$sec = new SeccionCl19(); 
$result = $sec -> SeccionCl19_Asignacion();

if($result->num_rows>0):?>
<table class="table table-bordered table-hover" style="font-size:13px;">
<thead> 
	<th>Cédula</th>
	<th>Profesor</th>
	<th>Opciones</th>
</thead>
<?php while ($r=$result->fetch_array()):?>
<tr>
	<td><?php echo $r["Cedula"]; ?></td>
	<td><?php echo $r["Profesor"]; ?></td>
   <td><a href="#" data-id="<?php echo $r["Cedula"]; ?>" class="btn btn-agreS btn-md btn-success" style="width:80px;">Asignar</a></td>
</tr>
<?php endwhile;?>
</table>
<?php else:?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif;?>

<script type="text/javascript">
		$('.btn-agreS').click(function(){
	idp = $(this).data('id');
var parametros = {"ids":"<?php echo $ids;?>","idp":idp};                                        
		$.ajax({
		url:"Controlador/Profesor/Asignar_SecProf.php",
		data: parametros,
		success:function(data){
		$('#Modal_Asigna').modal('hide');
		$('body').removeClass('modal-open');
		$('.modal-backdrop').remove();
		swal('Éxito!','Asignado con éxito.','success');
		}
		});
		});
</script>