<html lang="en">
	<head></head>
	<body>
		<div class="container col-md-8">
			<div class="col-sm-6 col-sm-offset-4 col-md-11 col-md-offset-1">
				<h1 class="page-header" style="background-color:blue;color:white; width:1050px">Materias</h1>

				<form class="form-inline" role="search" id="buscar">
					<div class="form-group">
						<input type="text" name="busqueda" class="form-control" placeholder="Buscar">
					</div>
					<button type="submit" class="btn btn-default">
						&nbsp;<i class="glyphicon glyphicon-search"></i>&nbsp;
					</button>
					<a data-toggle="modal" href="#AddModal" class="btn btn-default">Agregar</a>
				</form>

				<br>
				<!-- Modal -->
				<!-- Modal -->
				<div class="modal fade" id="AddModal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;	</button>
								<h4 class="modal-title">Agregar</h4>
							</div>
							<div class="modal-body">
								<form role="form" id="agregar" method="post">
									<div class="form-group">
										<label for="id">Id Materia</label>
										<input type="text" class="form-control" name="id">
									</div>
									<div class="form-group">
										<label for="nombre">Nombre</label>
										<input type="text" class="form-control" name="nombre">
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
				$.post('Controlador/Materia/AgregarMat.php', $('#agregar').serialize(), function(status) {
				});
				$('#agregar')[0].reset();
				$('#AddModal').modal('hide');
				$('#tabla').html('');
				CargarTabla();
			});

			function CargarTabla() {
				$('#tabla').load('Vista/TablaMat.php');
			}

			CargarTabla();

			$('#buscar').submit(function(e) {
				e.preventDefault();
				$.get('Controlador/Materia/BuscarMat.php', $('#buscar').serialize(), function(data) {
					$('#tabla').html(data);
				});
			});
		</script>
	</body>
</html>
