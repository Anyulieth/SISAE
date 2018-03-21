<?php
require_once '../../Modelo/GradoCl12.php';
$busq =$_GET['id'];
 $gra = new GradoCl12();
  $result = $gra->GradoCl12_BuscaGra($busq);
  if($result){
?>

<?php foreach ($result as $r): ?> 
<form role="form" id="actualizar" method="post">
	<h2>Editando Grado: <?php echo $r["id_grado"];?> </h2>
<form role="form" id="actualizar" method="post"> 
	<div class="form-group">
		<label for="nombre">Nombre</label>
		<input type="text" class="form-control" name="nombre" value="<?php  echo $r["Nombre"];?>">
	</div>
	<div class="form-group">
		<label for="idbachi">Bachiller</label>
		<input type="text" class="form-control" name="idbachi" value="<?php  echo $r["Bachiller"]; ?>">
	</div>	
	<input type="hidden" name="id" value="<?php echo  $r["id_grado"]; ?>">
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
		$.post("./Controlador/Grado/ActualizarGrado.php", $("#actualizar").serialize(), function(data) {
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