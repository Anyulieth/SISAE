<?php
require_once '../../Modelo/EspecialidadCl15.php';
$busq =$_GET['Id'];
  $esp = new EspecialidadCl15(); 
  $result = $esp->EspecialidadCl15_BuscaEsp($busq);
  if($result){
?>

<?php foreach ($result as $r): ?> 
<form role="form" id="actualizar" method="post">
	<h2>Editando Especialidad: <?php echo $r["Id"];?> </h2>
	<div class="form-group">
		<label for="nombre">Nombre</label>
		<input type="text" class="form-control" name="nombre" value="<?php echo $r["Nombre"]; ?>">
	</div>
	<div class="form-group">
		<label for="Apellido1">Cupo</label>
		<input type="text" class="form-control" name="Cupo" value="<?php echo $r["Cupo"]; ?>">
	</div>
	<input type="hidden" name="cedula" value="<?php echo $r['Id']; ?>">
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