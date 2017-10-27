<?php
include "../conexion.php";

$sql1 = "CALL PaEspecialidadTb16_BuscarEspecialidad($_GET[IdEsp])";
$query = $con -> query($sql1);

if ($query -> num_rows > 0) {
	while ($asist = $query -> fetch_object()) {
		break;
	}
}
?>

<?php if($espec!=null):
?>

<form role="form" id="actualizar" method="post">
	<div class="form-group">
		<label for="IdEsp">Id Especialidad</label>
		<input type="text" class="form-control" name="IdAsistCole" value="<?php echo $espec -> IdEsp; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="NomEsp">Nombre Especialidad</label>
		<input type="text" class="form-control" name="HoraEntrada" value="<?php echo $espec -> NomEsp; ?>">
	</div>
	<div class="form-group">
		<label for="Cupo">Cupo</label>
		<input type="text" class="form-control" name="FechaEntrada" value="<?php echo $espec -> Cupo; ?>">
	</div>
	<input type="hidden" name="id" value="<?php echo $espec -> IdEsp; ?>">
	<button type="submit" class="btn btn-default">
		Actualizar
	</button>
</form>

<script>
	$("#actualizar").submit(function(e) {
		e.preventDefault();
		$.post("./Controlador/Especialidad/ActualizarEspec.php", $("#actualizar").serialize(), function(status) {
		});
		$('#editModal').modal('hide');
		$('body').removeClass('modal-open');
		$('.modal-backdrop').remove();		  
	});

</script>

<?php else: ?>
<p class="alert alert-danger">
	No se encuentra
</p>
<?php endif; ?>
