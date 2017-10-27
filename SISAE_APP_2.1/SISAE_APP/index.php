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
function profesor(){
$("#contenido").load('Vista/Seg_Nivel/Nivel_1/Profesor.php');
}
function principal(){
$("#contenido").load('Vista/Seg_Nivel/Nivel_1/principal.php');
}
function seccion(){
$("#contenido").load('Vista/Seg_Nivel/Nivel_1/Seccion-Grupo.php');
}     
function encargado(){
$("#contenido").load('Vista/Seg_Nivel/Nivel_1/Encargado.php');
}
function funcionario(){
$("#contenido").load('Vista/Seg_Nivel/Nivel_1/Funcionario.php');
}
function estudiante(){
$("#contenido").load('Vista/Seg_Nivel/Nivel_1/Estudiante.php');
}
function materia(){
$("#contenido").load('Vista/Seg_Nivel/Nivel_1/Materia.php');
}
function asistClase(){
$("#contenido").load('Vista/Seg_Nivel/Nivel_1/AsistClase.php');
}
function matricula(){
$("#contenido").load('Vista/Seg_Nivel/Nivel_1/Matricula.php');
}
function asistCole(){
$("#contenido").load('Vista/Seg_Nivel/Nivel_1/AsistCole.php');
}
function especialidad(){
$("#contenido").load('Vista/Seg_Nivel/Nivel_1/Especialidad.php');
}
</script>
  </head>

  <body onload="principal();">
 <div id="header">
 <p>Administrador</p>
 </div>

<div class="sidebar" style="background-color:black;">
<span style="font-size:30px;cursor:pointer;color:white;right:5px;" id="hamb" onclick="openNav()">&#9776;</span>
<div>
  <li><a class="glyphicon glyphicon-home" style="margin-top:25px; " href="index.php"></a></li>
  <li><a class="glyphicon glyphicon-blackboard" style="margin-top:15px; " href="#" onclick="profesor();"></a></li>
  <li><a class="glyphicon glyphicon-education" style="margin-top:15px; " href="#" onclick="estudiante();"></a></li>
  <li><a class="glyphicon glyphicon-user" style="margin-top:15px; " href="#" onclick="funcionario();"></a></li>
  <li><a class="glyphicon glyphicon-eye-open" style="margin-top:15px; " href="#" onclick="encargado();"></a></li>
  <li><a class="glyphicon glyphicon-sound-7-1" style="margin-top:15px; " href="#" onclick="seccion();"></a></li>
  <li><a class="glyphicon glyphicon-book" style="margin-top:15px; " href="#" onclick="materia();"></a></li>
  <li><a class="glyphicon glyphicon-calendar" style="margin-top:15px; " href="#"></a></li>
  <li><a class="glyphicon glyphicon-phone-alt" style="margin-top:15px; " href="index.php"></a></li>
  <li><a class="glyphicon glyphicon-file" style="margin-top:15px; " href="index.php"></a></li>
  <li><a class="glyphicon glyphicon-list-alt" style="margin-top:15px; " href="index.php"></a></li>
 </div>
 </div>

 <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="index.php">Inicio</a>
  <a href="#" onclick="profesor();">Profesores</a>
  <a href="#" onclick="estudiante();">Estudiantes</a>
  <a href="#" onclick="funcionario();">Funcionarios</a>
  <a href="#" onclick="encargado();">Padres</a>
  <a href="#" onclick="seccion();">Secciones</a>
  <a href="#" onclick="materia();">Materias</a>
  <a href="#" onclick="asistCole();">Asistencia Colegio</a>
  <a href="#" onclick="especialidad();">Especialidad</a>
  <a href="">Horarios</a>
  <a href="">Comunicados</a>
  <a href="">Reportes</a>
  <a href="">Asistencia</a>
</div>
<div id="contenido">
</div>
  </body>
  <script>
function openNav() {
    document.getElementById("mySidenav").style.width = "150px";
    document.getElementById("contenido").style.marginLeft = "150px";
    
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("contenido").style.marginLeft= "0";
    document.getElementById("hamb").style.display = "block";
}
</script>
</html>
            
