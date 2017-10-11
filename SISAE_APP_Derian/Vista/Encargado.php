<html lang="en">
	<head></head>
	<body>
		<div class="container col-md-8">
			<div class="col-sm-6 col-sm-offset-4 col-md-11 col-md-offset-1">
				<h1 class="page-header" style="background-color:blue;color:white; width:1050px">Encargados</h1>

				<form class="form-inline" role="search" id="buscar">
					<div class="form-group">
						<input type="text" name="busqueda" class="form-control" placeholder="Buscar">
					</div>
					<button type="submit" class="btn btn-default">
						&nbsp;<i class="glyphicon glyphicon-search"></i>&nbsp;
					</button>
					<a data-toggle="modal" href="#Modal" class="btn btn-default">Agregar</a>
				</form>

				<br>
				<!-- Modal -->
				<!-- Modal -->
				<div class="modal fade" id="Modal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
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

				<div id="tabla">

				</div>
			</div>
		</div>
		<script type="text/javascript">
			$('#agregar').submit(function(e) {
				e.preventDefault();
				$.post('Controlador/Encargado/AgregarEnc.php', $('#agregar').serialize(), function(status) {
				});
				$('#agregar')[0].reset();
				$('#Modal').modal('hide');
				$('#tabla').html('');
				CargarTabla();
			});

			function CargarTabla() {
				$('#tabla').load('Vista/TablaEnc.php');
			}

			CargarTabla();

			$('#buscar').submit(function(e) {
				e.preventDefault();
				$.get('Controlador/Encargado/BuscarEnc.php', $('#buscar').serialize(), function(data) {
					$('#tabla').html(data);
				});
			});
		</script>
	</body>
</html>
