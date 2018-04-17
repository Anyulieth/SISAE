<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!--Responsive-->
	</head>
	<body>
		<div class="container">
			<h2 class="page-header">Administrar Acceso a Usuarios</h2>
			<form class="form-group" id="btn-export"></form>
			<form class="form-inline" role="search" id="buscar" style="float:left;">
				<div class="form-group">
					<input type="text" name="busqueda" class="form-control round" placeholder="Buscar" onkeyup="bus();" id="busc">
				</div>
			</form>
			<br>
			<br>
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
						CargarTabla();
						swal('Agregado!', 'El registro fue agregado.', 'success')
					}
				});
			});

			function CargarTabla() {
				$("#animacion").fadeIn('slow');
				$.ajax({
					url : 'Vista/Seg_Nivel/Nivel_1/TablaPrivilegios.php',
					success : function(data) {
						$("#tabla").html(data).fadeIn('slow');
						$("#animacion").html("");
					}
				})
			}

			$(document).ready(function() {
				CargarTabla();
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