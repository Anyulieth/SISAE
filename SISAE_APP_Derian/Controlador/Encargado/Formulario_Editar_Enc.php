<?php
include "../conexion.php";

$sql1 = "call PaEncTb05_BuscarEnc($_GET[ced])";
$query = $con -> query($sql1);

if ($query -> num_rows > 0) {
	while ($enc = $query -> fetch_object()) {
		break;
	}
}
?>

<?php if($enc!=null):
?>
<form role="form" id="actualizar" method="post">
	<div class="form-group">
		<label for="Cedula">Cedula</label>
		<input type="text" class="form-control" value="<?php echo $enc -> Cedula; ?>" name="Cedula" readonly>
	</div>
	<div class="form-group">
		<label for="Nombre">Nombre</label>
		<input type="text" class="form-control" value="<?php echo $enc -> Nombre; ?>" name="Nombre">
	</div>
	<div class="form-group">
		<label for="Apellido1">1°Apellido</label>
		<input type="text" class="form-control" value="<?php echo $enc -> Apellido1; ?>" name="Apellido1">
	</div>
	<div class="form-group">
		<label for="Apellido2">2°Apellido</label>
		<input type="text" class="form-control" value="<?php echo $enc -> Apellido2; ?>" name="Apellido2">
	</div>
	<div class="form-group">
		<label for="Direccion">Domicilio</label>
		<input type="text" class="form-control" value="<?php echo $enc -> Direccion; ?>" name="Direccion">
	</div>
	<div class="form-group">
		<label for="Telefono">Telefono</label>
		<input type="text" class="form-control" value="<?php echo $enc -> Telefono; ?>" name="Telefono" >
	</div>
	<div class="form-group">
		<label for="Email">Email</label>
		<input type="email" class="form-control" value="<?php echo $enc -> Email; ?>" name="Email" >
	</div>
	<input type="hidden" name="id" value="<?php echo $enc -> id; ?>">
	<button type="submit" class="btn btn-default">
		Actualizar
	</button>
</form>

<script>
	$("#actualizar").submit(function(e) {
		e.preventDefault();
		$.post("./Controlador/Encargado/ActualizarEnc.php", $("#actualizar").serialize(), function(status) {
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
