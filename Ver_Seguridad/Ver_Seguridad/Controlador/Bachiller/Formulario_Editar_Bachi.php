<?php
require_once '../../Modelo/BachillerCl13.php';  
$busq =$_GET['id'];
   $bac = new BachillerCl13(); 
  $result = $bac->BachillerCl13_BuscaBac($busq);
  if($result){
?>

<?php foreach ($result as $r): ?> 
<form role="form" id="actualizar" method="post">
	<h2>Editando Bachiller: <?php echo $r["Id"];?> </h2> 
	<div class="form-group">
		<label for="NomB">Nombre</label>
		<input type="text" class="form-control" name="NomB" value="<?php echo $r["Bachiller"]; ?>">
	</div>
	
	<input type="hidden" name="id" value="<?php echo $r["Id"]; ?>">
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
		$.post("./Controlador/Bachiller/ActualizarBachi.php", $("#actualizar").serialize(), function(data) {
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