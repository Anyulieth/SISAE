<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> <!--Responsive-->
	</head>
	<body>
		<div class="container">
			<h2 class="page-header" style="background-color:#6b6bec;color:white;">Administrar Acceso a Usuarios</h2>
			<form class="form-inline" role="search" id="buscar" style="float:left;">
				<div class="form-group">
					<input type="text" name="busqueda" class="form-control" placeholder="Buscar" onkeyup="bus();" id="busc">
				</div>
				<button type="submit" class="btn btn-default">
					<i class="glyphicon glyphicon-search"></i>
				</button>
				<a data-toggle="modal" href="#Modal" class="btn btn-default">Agregar</a>
			</form>
 
			<br>
			<!-- Modal -->
			<div class="modal fade" id="Modal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							</button> 
							<h4 class="modal-title">Agregar</h4>
						</div>
						<div class="modal-body">
							<form role="form" id="agregar" method="post">
								<?php require_once '../../../Modelo/UsuCl01.php';
								$usu = new UsuCl01();
								$result = $usu->UsuCl01_ListaUsu();
								if($result->num_rows>0):?>
							<table class="table table-bordered table-hover" style="font-size:13px;">
								<thead> 
									<th>Cédula</th>
									<th>Nombre</th>
									<th>Tipo de Usuario</th>
  									<th>Opciones</th>
								</thead>
								<?php while ($r=$result->fetch_array()):?>
									<tr>
										<td><?php echo $r["Cedula"]; ?></td>
										<td><?php echo $r["Nombre"]; ?></td>
										<td> 
											<select name="TipoUsu">
										<option value="1">Administrador</option>
										<option value="2">Profesor</option>
										<option value="3">Encargado Familia</option>
										<option value="4">Funcionario</option>
											</select>
										</td>
  	<td><a href="#" data-id="<?php echo $r["Cedula"]; ?>" class="btn btn-agre btn-md btn-success" style="width:80px;">Asignar</a></td>
  									</tr>
						<?php endwhile; ?>
							</table>
						<?php else: ?>
					  <p class="alert alert-warning">No hay resultados</p>
						<?php endif; ?>

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
				$.post('Controlador/Usuario/AgregarUsu.php', $('#agregar').serialize(), function(data) {
					if (data != 1) {
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
					url : 'Vista/Seg_Nivel/Nivel_1/TablaUsu.php',
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
					'busqueda' : $('#busc').val()
				};
				$.ajax({
					url : "Controlador/Usuario/BuscarUsu.php",
					data : par,
					success : function(data) {
						$('#tabla').html(data);
					}
				})
			}
		</script>
	</body>
</html>