<?php
require_once 'Modelo/conexion.php';
session_start();
if (!isset($_POST['u']) || !isset($_POST['p'])) {
	if (!isset($_SESSION['usuario']) || !isset($_SESSION['contraseña'])) {header('Location:Login.php');
	}
} else {$_SESSION['usuario'] = $_POST['u'];
	$_SESSION['contraseña'] = $_POST['p'];
}
$query = "CALL PaSeguridadTb31_Validar_Usu(\"$_SESSION[usuario]\",\"$_SESSION[contraseña]\")";
$con = new conexion();
$result = $con -> query($query);
$funciones = array();
$iconos = array();
$sidenav = array();
while ($r = $result -> fetch_array()) {
	$funciones[] = $r['Funcion'];
	$iconos[] = $r['Iconos'];
	$sidenav[] = $r['SideNav'];
}
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!--Responsive-->
		<title>SISAE</title>
		<link rel="stylesheet" href="assets/Bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/Bootstrap/css/styles.css">
		<link rel="stylesheet" href="Public/css/dash.css" >
		<link rel="stylesheet" href="assets/jquery-ui/jquery-ui.css" >
		<link rel="stylesheet" href="assets/SweetAlert/css/sweetalert2.css" >
		<link rel="stylesheet" href="assets/SweetAlert/css/sweetalert2.min.css" >
		<link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css" >
		<script type="text/javascript">
			function principal() {
				$("#contenido").load('principal.php');
			}
<?php
	foreach ($funciones as $fun) {
		echo $fun;
	}
?></script>
	</head>

	<body onload="principal();">
		<div class="divNav" id="MyNav">
			<nav class="navbar">
				<ul class="nav navbar-nav">
					<span id="hamb" onclick="openNav()" class="icon_hamb" data-toggle="tooltip" title="Expandir" data-placement="bottom">&#9776;</span>
					<span id="full" onclick="" class="glyphicon glyphicon-fullscreen" data-toggle="tooltip" title="Pantalla completa" data-placement="bottom" ></span>
				</ul>
				<a href="Login.php" class="icon_cerrar"><i class="glyphicon glyphicon-log-out"></i> Cerrar Sesion</a>
			</nav>
		</div>

		<div class="sidebar">
			<div>
				<li>
					<a class="glyphicon glyphicon-home" style="margin-top:25px; " href="index.php"></a>
				</li>
				<?php
					foreach ($iconos as $icon) {
						echo $icon;
					}
 ?>
			</div>
		</div>
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="index.php">Inicio</a>
			<?php
				foreach ($sidenav as $sid) {
					echo $sid;
				}
 ?>
		</div>
		<div id="contenido"></div>
		<script src="assets/Bootstrap/js/jquery.min.js"></script>
		<script src="assets/jquery-ui/jquery-ui.js"></script>
		<script src="assets/Bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/SweetAlert/js/sweetalert2.js"></script>
		<script src="assets/SweetAlert/js/sweetalert2.min.js"></script>
	</body>

	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "150px";
			document.getElementById("contenido").style.marginLeft = "190px";
			document.getElementById("MyNav").style.marginLeft = "200px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("contenido").style.marginLeft = "40px";
			document.getElementById("MyNav").style.marginLeft = "60px"
		}


		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});

		/* Pasa por todos los botones desplegables para alternar entre ocultarse y mostrar su contenido desplegable:
		 * esto permite que el usuario tenga varias listas desplegables sin ningún conflicto */
		var dropdown = document.getElementsByClassName("dropdown-btn");
		var i;

		for ( i = 0; i < dropdown.length; i++) {
			dropdown[i].addEventListener("click", function() {
				/*this.classList.toggle("active");*/
				var dropdownContent = this.nextElementSibling;
				if (dropdownContent.style.display === "block") {
					dropdownContent.style.display = "none";
				} else {
					dropdownContent.style.display = "block";
				}
			});
		}
	</script>
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js" type="text/javascript"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js" type="text/javascript"></script>
	<script src="assets/datatables/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
</html>