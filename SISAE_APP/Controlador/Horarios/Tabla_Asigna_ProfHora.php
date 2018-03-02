
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#tabProf">Profesores</a></li>
  <li><a data-toggle="tab" href="#tabMate">Materias</a></li>
  <li><a data-toggle="tab" href="#tabSec">Secciones</a></li>
</ul>


<div class="tab-content">

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
  <td><label><input type="radio" value="<?php echo $r['Cedula'];?>" id="Cedula" onclick="radio();"></label></td>
</tr>
<?php endwhile;?>
</table>
<?php else:?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif;?>
  </div> 

  <div id="tabMate" class="tab-pane fade">
<br>
	<label for="Materia">Materia</label>
	<select name="Materia" id="idMat">
	</select>
</div>

  <div id="tabSec" class="tab-pane fade">
  	<br>
   <label for="seccion">Sección</label>
	<select name="seccion" id="idSec">
	</select>
  </div></div>

  <script type="text/javascript">
function materias(){
var param = {'ced': x= document.getElementById("Cedula").value; };
$.ajax({
	url:'Vista/Seg_Nivel/Nivel_1/CargarMateriaProf.php',
	data:param,
	success:function(data){
		$('#idMat').html(data);
		/*secciones();*/
	}
});
}

function radio(x) {
   x= document.getElementById("Cedula").value;
    	materias();
}
radio();



/*
function secciones(){
	var param = {'idMater':$('#mater').val(),'idProf':<?php echo $_SESSION['usuario'];?>};
$.ajax({
	url:'Vista/Seg_Nivel/Nivel_2/CargarSeccion.php',
	data:param,
	success:function(data){
		$('#sec').html(data);
	}
});
}*/
</script>