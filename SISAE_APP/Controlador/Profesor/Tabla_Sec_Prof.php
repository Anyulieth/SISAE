<?php  $idProf = $_GET['ced']; ?>
<div class="form-group">
	<label for="Grado">Grado</label>
<select id="idGra" name="Grado" class="form-control">
	<?php require_once '../../Modelo/GradoCl12.php';
                    $gra = new GradoCl12();
                    $query = $gra -> GradoCl12_ListaTodo();
                    while ($valores = mysqli_fetch_array($query)) {
                      $result= "<option value= \"$valores[id_grado]\"> $valores[Nombre]</option>";
                      print $result; 
                    } ?>
                </select>
</div>

<div class="form-group">
<label for="Seccion">Sección</label>
<select id="idSec" name="Seccion" class="form-control">
	</select>
	</div>

<script type="text/javascript">
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
	e.preventDefault();
	var parametros = {'idProf':<?php echo $idProf;?>,'idGra':$('#idGra').val(),'idSec':$('#idSec').val()}; 
		$.ajax({			
			url:"Controlador/Profesor/Asignar_SecProf.php",
    		data: parametros,
    		success:function(data){
       $('#Modal_Matri').modal('hide');
       $('body').removeClass('modal-open');
       $('.modal-backdrop').remove();
     swal('Agregado!', 'El registro fue agregado.', 'success');
    }
})		
	});
</script>