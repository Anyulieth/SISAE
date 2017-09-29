<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>SISAE</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link href="Vista/css/dash.css" rel="stylesheet">
		
		<script type="text/javascript">
			function profesor() {
				$("#contenido").load('Vista/Profesor.php');
			}

			function principal() {
				$("#contenido").load('Vista/principal.php');
			}
			
			function encargado(){
				$("#contenido").load('Vista/Encargado.php');
			}
			function funcionario(){
				$("#contenido").load('Vista/Funcionario.php');
			}
			function estudiante(){
				$("#contenido").load('Vista/Estudiante.php');
			}
			function materia(){
				$("#contenido").load('Vista/Materia.php');
			}
			function asistClase(){
				$("#contenido").load('Vista/AsistClase.php');
			}
		</script>
		
	</head>

	<body onload="principal();">
		<div class="col-sm-2 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li class="active">
					<a href="index.php">Inicio <span class="sr-only">(current)</span></a>
				</li>
				<li>
					<a href="#" onclick="profesor();">Profesores</a>
				</li>
				<li>
					<a href="#" onclick="encargado();">Encargados</a>
				</li>
				<li>
					<a href="#" onclick="funcionario();">Funcionarios</a>
				</li>
				<li>
					<a href="#" onclick="estudiante();">Estudiantes</a>
				</li>
			</ul>
			<ul class="nav nav-sidebar">
				<li>
					<a href="#" onclick="materia();">Materias</a>
				</li>
				<li>
					<a href="#" onclick="asistClase();">Asistencia Clase</a>
				</li>
				<li>
					<a href="">One more nav</a>
				</li>
				<li>
					<a href="">Another nav item</a>
				</li>
				<li>
					<a href="">More navigation</a>
				</li>
			</ul>

			<h2 class="sub-header">Administrador</h2>

		</div>
		<div id="header">
			<p>
				Administrador
			</p>
		</div>
		<div id="contenido" style="padding-left:237px" ></div>
	</body>
</html>