<?php
require_once '../../Modelo/FunCl05.php';
require_once '../../Modelo/UsuCl01.php';
$busq =$_GET['ced'];
$fun = new FunCl05(); 
$result = $fun->FunCl05_BuscaFun($busq);
  if($result){
?>

<?php foreach ($result as $r): ?>
<form role="form" id="actualizar" method="post">
	<h2>Editando Funcionario: <?php echo $r["Cedula"];?> </h2>
	<div class="form-group">
		<label for="nombre">Nombre</label>
		<input type="text" class="form-control" name="nombre" value="<?php echo $r['Nombre']; ?>">
	</div>
	<div class="form-group">
		<label for="Apellido1">1° Apellido</label>
		<input type="text" class="form-control" name="Apellido1" value="<?php echo $r['Apellido1']; ?>">
	</div>
	<div class="form-group">
		<label for="Apellido2">2° Apellido</label>
		<input type="text" class="form-control" name="Apellido2" value="<?php echo $r['Apellido2']; ?>">
	</div>
	<div class="form-group">
		<label for="Direccion">Domicilio</label>
		<input type="text" class="form-control" name="direccion" value="<?php echo $r['Direccion']; ?>">
	</div>
	<div class="form-group">
		<label for="Telefono">Telefono</label>
		<input type="text" class="form-control" name="telefono" value="<?php echo $r['Telefono']; ?>">
	</div>
	<div class="form-group">
		<label for="email">Correo electronico</label>
		<input type="text" class="form-control" name="email" value="<?php echo $r['Email']; ?>">
	</div>
	<div class="form-group">
		<label for="Clave">Contraseña</label>
		<input type="password" class="form-control" name="clave" value="<?php echo $r['Clave']; ?>">
	</div>
	<div class="form-group">
    <label for="Fecha Nac">Fecha de Nacimiento</label>
    <input type="date" class="form-control" name="fecha_nac" value="<?php echo $r['Fecha_Nac']; ?>">
  </div>
	<input type="hidden" name="cedula" value="<?php echo $r['Cedula']; ?>">
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
		$.post("./Controlador/Funcionario/ActualizarFunc.php", $("#actualizar").serialize(), function(data) {
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