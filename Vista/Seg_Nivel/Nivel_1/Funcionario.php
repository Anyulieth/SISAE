<html lang="en">
<head>
</head>
<body>
<div class="container">
          <h1 class="page-header" style="background-color:blue;color:white; ">Funcionarios</h1>

         <form class="form-inline" role="search" id="buscar">
      <div class="form-group">
        <input type="text" name="busqueda" class="form-control" placeholder="Buscar">
      </div>
      <button type="submit" class="btn btn-default">&nbsp;<i class="glyphicon glyphicon-search"></i>&nbsp;</button>
  <a data-toggle="modal" href="#newModal" class="btn btn-default">Agregar</a>
    </form>

<br>
  <!-- Modal -->
 <!-- Modal -->
  <div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="newModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Agregar</h4>
        </div>
        <div class="modal-body">
<form role="form" id="agregar" method="post">
  <div class="form-group">
    <label for="cedula">Cedula</label>
    <input type="text" class="form-control" name="cedula">
  </div>
  <div class="form-group">
    <label for="nombre">Nombre</label>
    <input type="text" class="form-control" name="nombre" >
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
    <input type="text" class="form-control" name="direccion">
  </div>
  <div class="form-group">
    <label for="Genero">Genero</label>
    <label><input type="radio" name="femenino" value="" id="F" checked="true"> Femenino</label>
    <label><input type="radio" name="masculino" value="" id="M"> Masculino</label>
  </div>
  <div class="form-group">
    <label for="Telefono">Telefono</label>
    <input type="text" class="form-control" name="telefono" >
  </div>
  <div class="form-group">
    <label for="email">Correo electronico</label>
    <input type="email" class="form-control" name="email" >
  </div>
  <div class="form-group">
    <label for="Clave">Contraseña</label>
    <input type="password" class="form-control" name="clave">
  </div>
  <div class="form-group">
    <label for="Fecha Nac">Fecha de Nacimiento</label>
    <input type="date" class="form-control" name="fecha nac">
  </div>
  <div class="form-group">
    <label for="Estado">Estado</label>
    <label><input type="radio" name="Activo" value="" id="A" checked="true"> Activo</label>
    <label><input type="radio" name="Inactivo" value="" id="I"> Inactivo</label>
  </div>
  <div class="modal-footer">
          <button type="submit" class="btn btn-success">Agregar</button>         
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
  </div>
</form>
        </div>

      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->


<div id="tabla">
  
</div>
</div>
<script type="text/javascript">

	$('#agregar').submit(function(e){
  e.preventDefault();
  $.post('Controlador/Funcionario/AgregarFunc.php',$('#agregar').serialize(),function(status){});
  $('#agregar')[0].reset();
  $('#Modal').modal('hide');
  $('#tabla').html('');
  CargarTabla();
});

	function CargarTabla(){
  $('#tabla').load('Vista/Seg_Nivel/Nivel_1/TablaFunc.php');
}
CargarTabla();

$('#buscar').submit(function(e){
  e.preventDefault();
  $.get('Controlador/Profesor/BuscarProf.php',$('#buscar').serialize(),function(data){$('#tabla').html(data);});
});

</script>
  </body>
</html>
