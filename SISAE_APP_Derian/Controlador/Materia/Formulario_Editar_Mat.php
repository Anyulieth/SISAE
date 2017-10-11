<?php
include "../conexion.php";

$sql1 = "CALL PaMateriaTb17_BuscarMateria($_GET[idm])";
$query = $con -> query($sql1);

if ($query -> num_rows > 0) {
	while ($mat = $query -> fetch_object()) {
		break;
	}
}
?>

<?php if($mat!=null):
?>

<form role="form" id="actualizar" method="post">
	<div class="form-group">
		<label for="id">Id Materia</label>
		<input type="text" class="form-control" name="id" value="<?php echo $mat -> id; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="nombre">Nombre</label>
		<input type="text" class="form-control" name="nombre" value="<?php echo $mat -> nombre; ?>">
	</div>
	<input type="hidden" name="id" value="<?php echo $mat -> id; ?>">
	<button type="submit" class="btn btn-default">
		Actualizar
	</button>
</form>

<script>
	$("#actualizar").submit(function(e) {
		e.preventDefault();
		$.post("./Controlador/Materia/ActualizarMat.php", $("#actualizar").serialize(), function(status) {
		});
		$('#Modal_Editar').modal('hide');
		$('body').removeClass('modal-open');
		$('.modal-backdrop').remove();		  
	});

</script>

<?php else: ?>
<p class="alert alert-danger">
	No se encuentra
</p>
<?php endif; ?>
