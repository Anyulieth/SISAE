<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!--Responsive-->
	</head>
	<body>
		<div class="container">
			<h2 class="page-header">Encargados</h2>
			<form class="form-group" id="btn-export"></form>
			<form class="form-inline" role="search" id="buscar" style="float:left;">
				<div class="form-group">
					<input type="text" name="busqueda" class="form-control round" placeholder="Buscar" onkeyup="bus();" id="busc">
				</div>
				<a data-toggle="modal" href="#Modal" class="btn btn-success">Agregar</a>
			</form>
			<br>
			<br>
			<!-- Modal -->
			<div class="modal fade" id="Modal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
							<h4 class="modal-title">Agregar</h4>
						</div>
						<div class="modal-body">
							<form role="form" id="agregar" method="post">
								<div class="form-group">
									<label for="Cedula">Cedula</label>
									<input type="text" class="form-control" name="Cedula">
								</div>
								<div class="form-group">
									<label for="Nombre">Nombre</label>
									<input type="text" class="form-control" name="Nombre" >
								</div>
								<div class="form-group">
									<label for="Apellido1">1° Apellido</label>
									<input type="text" class="form-control" name="Apellido1">
								</div>
								<div class="form-group">
									<label for="Apellido2">2° Apellido</label>
									<input type="text" class="form-control" name="Apellido2">
								</div>
								<div class="form-group">
									<label for="Direccion">Domicilio</label>
									<input type="text" class="form-control" name="Direccion">
								</div>
								<div class="form-group">
									<label for="Genero">Genero</label>
									<label>
										<input type="radio" name="Genero" value="F">
										Femenino</label>
									<label>
										<input type="radio" name="Genero" value="M">
										Masculino</label>
								</div>
								<div class="form-group">
									<label for="Telefono">Telefono</label>
									<input type="text" class="form-control" name="Telefono" >
								</div>
								<div class="form-group">
									<label for="Email">Correo electronico</label>
									<input type="text" class="form-control" name="Email" >
								</div>
								<div class="form-group">
									<label for="Clave">Contraseña</label>
									<input type="password" class="form-control" name="Clave">
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-success">
										Agregar
									</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal">
										Cancelar
									</button>
								</div>
							</form>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			</div><!-- /.modal -->

			<div id="tabla"></div>
		</div>

		<script type="text/javascript">
			$('#agregar').submit(function(e) {
				e.preventDefault();
				$.post('Controlador/Encargado/AgregarEnc.php', $('#agregar').serialize(), function(data) {
					if (!data) {
						swal('Ups...', 'Algo salió mal!', 'error')
					} else {
						$('#agregar')[0].reset();
						$('#Modal').modal('hide');
						$('#tabla').html('');
						swal('Éxito!', 'El registro se ha guardado!', 'success')
						CargarTabla();
					}
				});
			});

			function CargarTabla() {
				$("#animacion").fadeIn('slow');
				$.ajax({
					url : 'Vista/Seg_Nivel/Nivel_1/TablaEnc.php',
					success : function(data) {
						$("#tabla").html(data).fadeIn('slow');
						$("#animacion").html("");
					}
				})
			}


			$(document).ready(function() {
				CargarTabla();
			});

			$('#buscar').submit(function(e) {
				e.preventDefault();
				$.get('Controlador/Encargado/BuscarEnc.php', $('#buscar').serialize(), function(data) {
					$('#tabla').html(data);
				});
			});

			function bus() {
				var par = {
					'busqueda' : $('#busc').val()
				};
				$.ajax({
					url : "Controlador/Encargado/BuscarEnc.php",
					data : par,
					success : function(data) {
						$('#tabla').html(data);
					}
				})
			}
		</script>
	</body>
</html>