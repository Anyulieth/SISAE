<?php
require_once '../../Modelo/HorarioCl27.php';
$busq =$_GET['idH'];
 $ho = new HorarioCl27();
  $result = $ho->HorarioCl27_BuscaHo($busq);
  if($result){
?>

<?php foreach ($result as $r): ?> 
<form role="form" id="actualizar" method="post">
	<h2>Editando Horario: <?php echo $r["Id"];?> </h2>
<form role="form" id="actualizar" method="post"> 
	<div class="form-group">
		<label for="Dia">Día</label>
		<input type="text" class="form-control" name="Dia" value="<?php  echo $r["Dia"];?>">
	</div>
	<div class="form-group">
		<label for="Hora_Inicio">Hora Inicio</label>
		<input type="text" class="form-control" name="Hora_Inicio" value="<?php  echo $r["Hora_Inicio"]; ?>">
	</div>	
	<div class="form-group">
		<label for="Hora_Fin">Hora Fin</label>
		<input type="text" class="form-control" name="Hora_Fin" value="<?php  echo $r["Hora_Fin"]; ?>">
	</div>	
	<input type="hidden" name="id" value="<?php echo  $r["Id"]; ?>">
	<button type="submit" class="btn btn-default">
		Actualizar
	</button>
</form>
<?php endforeach ?>     
<?php
}?>

<script>
		$("#actualizar").submit(function(e) {
		e.preventDefault();
		$.post("./Controlador/Horarios/ActualizarHo.php", $("#actualizar").serialize(), function(data) {
		if(data!=1){swal('Ups...', 'Algo salió mal!', 'error');}
		else{
		$('#Modal_Editar').modal('hide');
		$('body').removeClass('modal-open');
		$('body').removeAttr("style"); 
		$('.modal-backdrop').remove();
		$('#tabla').html('');	
		CargarTabla(1);
		swal('Editado!','El registro fue modificado.','success');
		}
		});		  
	});
</script>