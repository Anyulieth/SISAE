<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!--Responsive-->
	</head>
	<body>
		<div class="container">
			<h2 class="page-header">Estudiantes</h2>
			<form class="form-group" id="btn-export"></form>
			<form class="form-inline" role="search" id="buscar" style="float:left;">
				<div class="form-group">
					<input type="text" name="busqueda" class="form-control round" placeholder="Buscar" onkeyup="bus();" id="busc">
				</div>
				<a data-toggle="modal" href="#Modal" class="btn btn-success">Agregar</a>
			</form>
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
									<label for="Cedula">Cédula</label>
									<input type="text" class="form-control" name="Cedula">
								</div>
								<div class="form-group">
									<label for="Nombre">Nombre</label>
									<input type="text" class="form-control" name="Nombre">
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
									<label for="Genero">Género</label>
									<label>
										<input type="radio" name="Genero" value="F">
										Femenino</label>
									<label>
										<input type="radio" name="Genero" value="M">
										Masculino</label>
								</div>
								<div class="form-group">
									<label for="Telefono">Teléfono</label>
									<input type="text" class="form-control" name="Telefono">
								</div>
								<div class="form-group">
									<label for="Email">Correo electrónico</label>
									<input type="text" class="form-control" name="Email">
								</div>
								<div class="form-group">
									<label for="Fecha_nac">Fecha de Nacimiento</label>
									<div class='input-group date' id='fecha'>
										<input type='date' class="form-control" name="Fecha_nac"/>
										<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span> </span>
									</div>
								</div>
								<div class="form-group">
									<label for="Adecuacion">Adecuación: </label>
									<select name="Adecuacion">
										<option value="No">No</option>
										<option value="No_Significativa">No Significativa</option>
										<option value="Significativa">Significativa</option>
										<option value="Acceso">Acceso</option>
									</select>
								</div>
								<div class="form-group">
									<label for="Estado">Estado</label>
									<label>
										<input type="radio" name="Estado" value="A">
										Activo</label>
									<label>
										<input type="radio" name="Estado" value="I">
										Inactivo</label>
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
				$.post('Controlador/Estudiante/AgregarEst.php', $('#agregar').serialize(), function(data) {
					if (!data) {
						swal('Ups...', 'Algo salió mal!', 'error');
					} else {
						$('#agregar')[0].reset();
						$('#Modal').modal('hide');
						$('#tabla').html('');
						CargarTabla(1);
						swal('Agregado!', 'El registro fue agregado.', 'success')
					}
				});
			});

			function CargarTabla(pagina) {
				var parametros = {
					"pagina" : pagina
				};
				$("#animacion").fadeIn('slow');
				$.ajax({
					url : 'Vista/Seg_Nivel/Nivel_1/TablaEst.php',
					data : parametros,
					success : function(data) {
						$("#tabla").html(data).fadeIn('slow');
						$("#animacion").html("");
					}
				})
			}


			$(document).ready(function() {
				CargarTabla(1);
			});

			function bus() {
				var par = {
					'busqueda' : $('#busc').val(),
				};
				$.ajax({
					url : "Controlador/Estudiante/BuscarEst.php",
					data : par,
					success : function(data) {
						$('#tabla').html(data);
					}
				})
			}
		</script>
	</body>
</html>