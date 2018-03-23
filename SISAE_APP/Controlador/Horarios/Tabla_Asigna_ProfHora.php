<?php $idHo= $_GET['idH']; ?>
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#tabProf">Profesores</a></li>
  <li><a data-toggle="tab" href="#tabMate">Materias</a></li>
  <li><a data-toggle="tab" href="#tabSec">Secciones</a></li>
</ul>


<div class="tab-content" id="tabs">

<div id="tabProf" class="tab-pane fade in active">   
<?php 
require_once '../../Modelo/ProfCl03.php';
  $prof = new ProfCl03(); 
  $result = $prof->ProfCl03_ListaProfs();
  if($result->num_rows>0):?> 
  <br>
<table class="table table-bordered table-hover" style="font-size:13px;">
<thead> 
	<th>Cédula</th>
	<th>Profesor</th>
	<th>Seleccionar</th>
</thead>
<?php while ($r=$result->fetch_array()):?>
<tr>
	<td><?php echo $r["Cedula"]; ?></td>
	<td><?php echo $r["Profesor"]; ?></td>
  <td><label><input type="radio" value="<?php echo $r['Cedula'];?>" id="<?php echo $r['Cedula'];?>" name="idP"></label></td>
</tr>
<?php endwhile;?>
</table>
<?php else:?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif;?>
  </div> 

  <div id="tabMate" class="tab-pane fade">
  	<br>
 <label for="Periodo">Periodo</label>
<select id="idPer" name="Periodo" class="form-control">
</select>
<br>
	<label for="Materia">Materia</label>
	<select name="Materia" id="idMat">
	</select>
</div>

  <div id="tabSec" class="tab-pane fade">
  	<form class="form-inline" style="margin-bottom:10px;float:left">
  		<div class="form-group">
  	<br>
   <label for="Grado">Grado</label>
	<select name="Grado" id="idGra" class="form-control">
	</select>
  	<br>
   <label for="seccion">Sección</label>
	<select name="seccion" id="idSec" class="form-control">
	</select>
</div>
</form>
  </div>
</div>

  <script type="text/javascript">
  	var gra;
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

  	function secciones(prof,gra){
$.ajax({
	url:'Controlador/Horarios/CargarSeccionProf.php',
	data:prof, gra,
	success:function(data){
		$('#idSec').html(data);
	}
});
}

function grado(prof){  
var gra= { 'idG':$('select[id=idGra]').val() };
	console.log(gra);
   $.ajax({
	url:'Controlador/Profesor/CargarGrado.php',
	data:prof,
	success:function(data){
		$('#idGra').html(data);	
		secciones(prof, gra);
	}
})/*.done(function(){
		
  secciones(prof,gra);
  			console.log("grado:"+gra);

});*/ 
}

function materias(prof){
$.ajax({
	url:'Controlador/Horarios/CargarMateriaProf.php',
	data:prof,
	success:function(data){
		$('#idMat').html(data);		
		grado(prof);
	}
});
}

$(":radio[name='idP']").change(function(event) {
	var prof = {'ced':$(this).val()};
	$.ajax({
	url:'Controlador/Horarios/CargarMateriaProf.php',
	data:prof,
	success:function(data){
		$('#idMat').html(data);
		materias(prof);
	}
});
});

$("select[id=idGra]").change(function(){
	var gra= { 'idG':$('select[id=idGra]').val(), 'ced':$(':radio[name=idP]').val()};
	console.log(gra);
	$.ajax({
	url:'Controlador/Horarios/CargarSeccionProf.php',
	data:gra,
	success:function(data){
		$('#idSec').html(data);
	}
});
});

$('.guardar').click(function(e) {
e.preventDefault();
var parametros = {'idPer':$('#idPer').val(),'idMat':$('#idMat').val(),'idGra':$('#idGra').val(),
		'idSec':$('#idSec').val(),'idHo':<?php echo $idHo;?>,'idProf':$(":radio[name='idP']").val()}; 
		$.ajax({			
			url:"Controlador/Profesor/Asignar_Matri.php",
    		data: parametros,
    		success:function(data){
       $('#Modal_Matri').modal('hide');
       $('body').removeClass('modal-open');
       $('.modal-backdrop').remove();
       swal('Agregado!', 'El registro fue agregado.', 'success')
    }
});
	});
</script>