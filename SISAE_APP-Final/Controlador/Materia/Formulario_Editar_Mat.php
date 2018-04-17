<?php
require_once '../../Modelo/MateriaCl16.php';
$busq =$_GET['idm'];
  $mat = new MateriaCl16();
  $result = $mat->MateriaCl16_BuscaMat($busq);
  if($result){
?>

<?php foreach ($result as $r): ?> 
<form role="form" id="actualizar" method="post">
	<h2>Editando Materia: <?php echo $r["Id"];?> </h2>
<form role="form" id="actualizar" method="post"> 
	<div class="form-group">
		<label for="nombre">Nombre</label>
		<input type="text" class="form-control" name="nombre" value="<?php echo $r["Nombre"]; ?>">
	</div>
	<input type="hidden" name="id" value="<?php echo $r["Id"];?>">
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
		$.post("./Controlador/Materia/ActualizarMat.php", $("#actualizar").serialize(), function(data) {
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