<?php
require_once '../../Modelo/EspecialidadCl15.php';
$busq =$_GET['Id'];
  $esp = new EspecialidadCl15(); 
  $result = $esp->EspecialidadCl15_BuscaEsp($busq);
  if($result){
?>

<?php foreach ($result as $r): ?> 
<form role="form" id="actualizar" method="post">
	<h2>Editando Especialidad: <?php echo $r["Nom_Especialidad"];?> </h2>
	<div class="form-group">
		<label for="Nombre">Nombre</label>
		<input type="text" class="form-control" value="<?php echo $r["Nom_Especialidad"]; ?>" name="Nombre">
	</div>
	<div class="form-group">
		<label for="Apellido1">Cupo</label>
		<input type="text" class="form-control" value="<?php echo  $r["Cupo_Especialidad"]; ?>" name="Apellido1">
	</div>
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
		$.post("./Controlador/Especialidad/ActualizarEsp.php", $("#actualizar").serialize(), function(data) {
			if(data!=1){swal('Ups...', 'Algo salió mal!', 'error');}
			else{$('#Modal_Editar').modal('hide');
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