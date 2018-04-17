
<?php $idEst= $_GET['ced']; ?>

<div id="tab-Est">
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#info">Información Académica</a></li>
  <li><a data-toggle="tab" href="#menu1">Secciones</a></li>
  <li><a data-toggle="tab" href="#menu2">Materias</a></li>
</ul>

<div class="tab-content">

<div id="info" class="tab-pane fade in active" role="tab-pane"> 
	<br>
<?php
require_once '../../Modelo/EstCl02.php';
  $est = new EstCl02(); 
  $result = $est->EstCl02_InfoEst($idEst);
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
}else echo 'Aún no tiene asignado un encargado';
?>
  </div>

  <div id="menu1" class="tab-pane fade" role="tab-pane">
  	<br>
 <label for="Periodo">Periodo</label>
<select id="idPer" name="Periodo" class="form-control">
</select>
<br>
<label for="Especialidad">Especialidad</label>
<select id="idEspe" name="Especialidad" class="form-control">
</select>
<br>
<label for="Grado">Grado</label>
<select id="idGra" name="Grado" class="form-control">
</select>
<br>
	<label for="Seccion">Sección</label>
<select id="idSec" name="Seccion" class="form-control">
</select>
  </div>

  <div id="menu2" class="tab-pane fade" role="tab-pane">
  	<br>
    <?php 
require_once '../../Modelo/MateriaCl16.php';
$mat = new MateriaCl16(); 
$result = $mat->MateriaCl16_ListaTodo();
?>
<?php if($result):?>
<table class="table table-bordered table-hover" style="font-size:13px;" >
<thead> 
  <th>Materia</th>
  <th>Asignar</th>
</thead>
<?php foreach ($result as $r):?>
<tr>
  <td><?php echo $r["Nombre"]; ?></td>
  <td><label><input type="checkbox" value="<?php echo $r['Id'];?>" id="idMat" name="Mat"></label></td>
</tr>
<?php endforeach;?>
</table>
<?php else:?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif;?>
</div>
</div>
</div> <!-- Div tab-Est-->

 <script type="text/javascript">

  	function periodo(){
	var param = '';
	$.ajax({
	url:'Controlador/Estudiante/CargarPeriodo.php',
	data:param,
	success:function(data){
		$('#idPer').html(data);
	}
});
}
periodo();

  	function secciones(){
	var param = {'idGra':$('#idGra').val()};
	$.ajax({
	url:'Controlador/Estudiante/CargarSeccion.php',
	data:param,
	success:function(data){
		$('#idSec').html(data);
	}
});
}

function grado(){
	var param = '';
	$.ajax({
	url:'Controlador/Estudiante/CargarGrado.php',
	data:param,
	success:function(data){
		$('#idGra').html(data);
		secciones();
	}
});
}
grado();

function especialidad(){
	var param = '';
	$.ajax({
	url:'Controlador/Estudiante/CargarEspecialidad.php',
	data:param,
	success:function(data){
		$('#idEspe').html(data);
	}
});
}
especialidad();

$('#idGra').change(function(){
var param = {'idGra':$('#idGra').val()};
$.ajax({
	url:'Controlador/Estudiante/CargarSeccion.php',
	data:param,
	success:function(data){
		$('#idSec').html(data);
	}
});
});


$('.guardar').click(function(e){
	var selected = [];
$(':checkbox[name=Mat]').each(function(){
if (this.checked) {
	selected.push($(this).val());
} 	
});
	e.preventDefault();
	var parametros = {'idEst':<?php echo $idEst;?>,'idPer':$('#idPer').val(),'idEsp':$('#idEspe').val(),'idGra':$('#idGra').val(),
		'idSec':$('#idSec').val()}; 
		$.ajax({			
			url:"Controlador/Estudiante/Asignar_Matri.php",
    		data: parametros,
    		success:function(data){
       $('#Modal_Matri').modal('hide');
       $('body').removeClass('modal-open');
       $('.modal-backdrop').remove();
      swal('Agregado!', 'El registro fue agregado.', 'success');
    }
}).done(function(){
   for(var i=0;i<selected.length;i++){	
var idp = {'idM':selected[i], 'idEst':<?php echo $idEst;?> };
$.ajax({			
			url:"Controlador/Estudiante/Asignar_Mate.php",
    		data: idp,
    		success:function(data){	
        }
}); 
    }swal('Agregado!', 'El registro fue agregado.', 'success');
});
		
	});
</script>
  </div> 