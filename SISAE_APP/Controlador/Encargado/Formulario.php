<?php
include "../Controlador/conexion.php";
include "../Modelo/EncCl04.php";

$sql1 = "select * from EncTb04 where id = " . $_GET["id"];
$query = $con -> query($sql1);
$enc = null;
if ($query -> num_rows > 0) {
	while ($r = $query -> fetch_object()) {
		$enc = $r;
		break;
	}
}
?>

<?php if($enc!=null):
?>
<!-- Modal -->
<!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="newModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">Editar</h4>
			</div>
			<div class="modal-body">
				<form role="form" id="actualizar" >
					<div class="form-group">
						<label for="Nombre">Nombre</label>
						<input type="text" class="form-control" value="<?php echo $enc -> PStCL01_Nombre; ?>" name="Nombre" required>
					</div>
					<div class="form-group">
						<label for="Apellido1">1°Apellido</label>
						<input type="text" class="form-control" value="<?php echo $enc -> PStCL01_Apellido1; ?>" name="Apellido1" required>
					</div>
					<div class="form-group">
						<label for="Apellido2">2°Apellido</label>
						<input type="text" class="form-control" value="<?php echo $enc -> PStCL01_Apellido2; ?>" name="Apellido2" required>
					</div>
					<div class="form-group">
						<label for="Direccion">Domicilio</label>
						<input type="text" class="form-control" value="<?php echo $enc -> PStCL01_Direccion; ?>" name="Direccion" required>
					</div>
					<div class="form-group">
						<label for="Genero">Género</label>
						<label>
							<input type="radio" name="femenino" value="<?php echo $enc -> PCrCL01_Sexo; ?>" id="F" checked="true">
							Femenino</label>
						<label>
							<input type="radio" name="masculino" value="" id="M">
							Masculino</label>
						/div>
						<div class="form-group">
							<div class="form-group">
								<label for="Telefono">Telefono</label>
								<input type="text" class="form-control" value="<?php echo $enc -> PStCL01_Telefono; ?>" name="phone" >
							</div>
							<div class="form-group">
								<label for="Email">Email</label>
								<input type="email" class="form-control" value="<?php echo $enc -> PStCL01_Email; ?>" name="Email" >
							</div>
							<div class="form-group">
								<label for="Clave">Clave</label>
								<input type="text" class="form-control" value="<?php echo $enc -> phone; ?>" name="Clave" >
							</div>
							<input type="hidden" name="id" value="<?php echo $enc -> PStEncCl04_IdEncargado; ?>">
							<button type="submit" class="btn btn-default">
								Actualizar
							</button>
				</form>
			</div>

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
	$("#actualizar").submit(function(e) {
		e.preventDefault();
		$.post("../Controlador/Encargado/Actualizar.php", $("#actualizar").serialize(), function(data) {
		});
		alert("Agregado exitosamente!");
		$("#actualizar")[0].reset();
		$('#editModal').modal('hide');
		$('body').removeClass('modal-open');
		$('.modal-backdrop').remove();
		loadTabla();
	}); 
</script>

<?php else: ?>
<p class="alert alert-danger">
	404 No se encuentra
</p>
<?php endif; ?>