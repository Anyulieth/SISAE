<?php
include "../conexion.php";

$sql1 = "CALL PaAsistColeTb08_BuscarAsistCole($_GET[IdAsistCole])";
$query = $con -> query($sql1);

if ($query -> num_rows > 0) {
	while ($asist = $query -> fetch_object()) {
		break;
	}
}
?>

<?php if($asist!=null):
?>

<form role="form" id="actualizar" method="post">
	<div class="form-group">
		<label for="IdAsistCole">Id Asistencia Cole</label>
		<input type="text" class="form-control" name="IdAsistCole" value="<?php echo $asist -> IdAsistCole; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="HoraEntrada">Hora Entrada</label>
		<input type="text" class="form-control" name="HoraEntrada" value="<?php echo $asist -> HoraEntrada; ?>">
	</div>
	<div class="form-group">
		<label for="FechaEntrada">Fecha Entrada</label>
		<input type="text" class="form-control" name="FechaEntrada" value="<?php echo $asist -> FechaEntrada; ?>">
	</div>
	<div class="form-group">
		<label for="HoraSalida">Hora Salida</label>
		<input type="text" class="form-control" name="HoraSalida" value="<?php echo $asist -> HoraSalida; ?>">
	</div>
	<div class="form-group">
		<label for="FechaSalida">Fecha Salida</label>
		<input type="text" class="form-control" name="FechaSalida" value="<?php echo $FechaSalida -> Id_Materia; ?>">
	</div>
    <div class="form-group">
		<label for="IdEstudiante">Id Estudiante</label>
		<input type="text" class="form-control" name="IdEstudiante" value="<?php echo $asist -> IdEstudiante; ?>">
	</div>
	<input type="hidden" name="id" value="<?php echo $asist -> IdAsistCole; ?>">
	<button type="submit" class="btn btn-default">
		Actualizar
	</button>
</form>

<script>
	$("#actualizar").submit(function(e) {
		e.preventDefault();
		$.post("./Controlador/AsistCole/ActualizarAsistCole.php", $("#actualizar").serialize(), function(status) {
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
