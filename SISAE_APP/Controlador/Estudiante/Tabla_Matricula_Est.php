
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#info">Info</a></li>
  <li><a data-toggle="tab" href="#menu1">Materias</a></li>
  <li><a data-toggle="tab" href="#menu2">Secciones</a></li>
</ul>

<div class="tab-content">
<div id="info" class="tab-pane fade in active">   
<?php
require_once '../../Modelo/EstCl02.php';
require_once '../../Modelo/UsuCl01.php';
$busq =$_GET['ced'];
  $est = new EstCl02(); 
  $result = $est->EstCl02_InfoEst($busq);
  if($result){
?>

<?php foreach ($result as $r): ?> 
<form role="form" id="infoEst" method="post">
	<h2> Estudiante: <?php echo $r["Cedula"];?> </h2>
	<div class="form-group">
		<label for="nombre">Nombre Completo</label>
		<input type="text" class="form-control" name="nombre" value="<?php echo $r["Nombre_Est"]; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="Direccion">Residencia</label>
		<input type="text" class="form-control" name="direccion" value="<?php echo $r["Direccion"]; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="Telefono">Telefono</label>
		<input type="text" class="form-control" name="telefono" value="<?php echo $r["Telefono"]; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="Genero">Género</label>
		<input type="text" class="form-control" name="Genero" value="<?php echo $r["Genero"]; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="email">Correo electrónico</label>
		<input type="text" class="form-control" name="email" value="<?php echo $r["Email"]; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="fecha_nac">Fecha de Nacimiento</label>
		<div class='input-group date' id='fecha'>
			<input type='text' class="form-control" name="fecha_nac" value="<?php echo $r["Nacimiento"]; ?>" readonly>
			<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span> </span>
		</div>
	</div>
	<div class="form-group">
		<label for="Adecuacion">Adecuación</label>
		<input type="text" class="form-control" name="Adecuacion" value="<?php echo $r["Adecuacion"]; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="Estado">Estado</label>
		<input type="text" class="form-control" name="Estado" value="<?php echo $r["Estado"]; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="Encargado">Encargado</label>
		<input type="text" class="form-control" name="Encargado" value="<?php echo $r["Encargado"]; ?>" readonly>
	</div>
	<input type="hidden" name="cedula" value="<?php echo $r['Cedula']; ?>">
</form>
<?php endforeach ?>     
<?php
}?>
  </div>

  <div id="menu1" class="tab-pane fade">
    <?php 
require_once '../../Modelo/MateriaCl16.php';
$mat = new MateriaCl16(); 
$idEst= $_GET['ced'];
$result = $mat->MateriaCl16_ListaTodo();
?>
<?php if($result):?>
<table class="table table-bordered table-hover" style="font-size:13px;">
<thead> 
  <th>Id</th>
  <th>Materia</th>
  <th>Asignar</th>
</thead>
<?php foreach ($result as $r):?>
<tr>
  <td><?php echo $r["Id"]; ?></td>
  <td><?php echo $r["Nombre"]; ?></td>
  <td><label><input type="checkbox" value="<?php echo $r['Id'];?>" id="" name=""></label></td>
</tr>
<?php endforeach;?>
</table>
<?php else:?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif;?>
</div>

  <div id="menu2" class="tab-pane fade">
    <?php 
require_once '../../Modelo/SeccionCl19.php';
$sec = new SeccionCl19(); 
/*$idSec= $_GET['sec'];*/
$result = $sec->SeccionCl19_ListaTodo();
?>
<?php if($result):?>
<table class="table table-bordered table-hover" style="font-size:13px;">
<thead> 
  <th>Cupo</th>
  <th>Grado</th>
  <th>Grupo</th>
  <th>Asignar</th>
</thead>
<?php foreach ($result as $r):?>
<tr>
  <td><?php echo $r["Cupo"]; ?></td>
  <td><?php echo $r["Grado"]; ?>
</td>
  <td><?php echo $r["Grupo"]; ?>
</td> 
  <td><label><input type="radio" value="<?php echo $r['ID_Seccion'];?>" name="Seccion"></label></td>
</tr>
<?php endforeach;?>
</table>
<?php else:?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif;?>
  </div>

  <script type="text/javascript">
$('.btn-agre').click(function(){
idMat = $(this).data('id');
var parametros = {"idEst":"<?php echo $idEst;?>","idMat":idMat,"idSec":idSec};
$.ajax({
    url:"Controlador/Estudiante/Asignar_Matri.php",
    data: parametros,
    success:function(data){
       $('#Modal_Matri').modal('hide');
       $('body').removeClass('modal-open');
       $('.modal-backdrop').remove();
       alert(data);
    }
});
});
</script>
  </div> 