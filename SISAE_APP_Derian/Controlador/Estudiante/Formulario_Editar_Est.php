<?php
include "../conexion.php";

$sql1 = "CALL PaEstTb03_BuscarEst($_GET[ced])";
$query = $con -> query($sql1);

if ($query -> num_rows > 0) {
	while ($est = $query -> fetch_object()) {
		break;
	}
}
?>

<?php if($est!=null):
?>
<form role="form" id="actualizar" method="post">
	<div class="form-group">
		<label for="cedula">Cedula</label>
		<input type="text" class="form-control" name="cedula" value="<?php echo $est -> Cedula; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="nombre">Nombre</label>
		<input type="text" class="form-control" name="nombre" value="<?php echo $est -> Nombre; ?>">
	</div>
	<div class="form-group">
		<label for="Apellido1">1° Apellido</label>
		<input type="text" class="form-control" name="Apellido1" value="<?php echo $est -> Apellido1; ?>">
	</div>
	<div class="form-group">
		<label for="Apellido2">2° Apellido</label>
		<input type="text" class="form-control" name="Apellido2" value="<?php echo $est -> Apellido2; ?>">
	</div>
	<div class="form-group">
		<label for="Direccion">Domicilio</label>
		<input type="text" class="form-control" name="direccion" value="<?php echo $est -> Direccion; ?>">
	</div>
	<div class="form-group">
		<label for="Telefono">Telefono</label>
		<input type="text" class="form-control" name="telefono" value="<?php echo $est -> Telefono; ?>">
	</div>
	<div class="form-group">
		<label for="email">Correo electronico</label>
		<input type="text" class="form-control" name="email" value="<?php echo $est-> Email; ?>">
	</div>
	<div class="form-group">
		<label for="fecha_nac">Fecha de Nacimiento</label>
		<div class='input-group date' id='fecha'>
			<input type='date' class="form-control" name="fecha_nac" value="<?php echo $est -> Fecha_Nac; ?>" readonly>
			<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span> </span>
		</div>
	</div>
	<div class="form-group">
		<label for="Adecuacion">Adecuacion: </label>
				<select name="Adecuacion">
				<option value="<?php echo $est -> Adecuacion; ?>"</option>
			</select>
		<input type="" class="form-control" name="Adecuacion" value="<?php echo $est -> Adecuacion; ?>">
	</div>
	<div class="form-group">		
		<label for="Id_Especialidad">Especialidad</label>
		<input type="" class="form-control" name="Id_Especialidad" value="<?php echo $est -> IdEspecialidad; ?>">
	</div>
	<input type="hidden" name="id" value="<?php echo $est -> id; ?>">
	<button type="submit" class="btn btn-default">
		Actualizar
	</button>
</form>

<script>
	$("#actualizar").submit(function(e) {
		e.preventDefault();
		$.post("./Controlador/Estudiante/ActualizarEst.php", $("#actualizar").serialize(), function(status) {
		});
		$('#Modal_Editar').modal('hide');
		$('body').removeClass('modal-open');
		$('.modal-backdrop').remove();		  
	});

	<!-- onclick="alert(document.getElementById('selectid').options[document.getElementById('selectid').selectedIndex].text);"  -->
</script>

<?php else: ?>
<p class="alert alert-danger">
	No se encuentra
</p>
<?php endif; ?>
