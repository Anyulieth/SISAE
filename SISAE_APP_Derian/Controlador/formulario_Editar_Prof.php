<?php
include "conexion.php";

$sql1= "CALL PaProfTb04_BuscarProf($_GET[ced])";
$query = $con->query($sql1);
if($query->num_rows>0){
while ($profesor=$query->fetch_object()){
  break;
}

  }
?>

<?php if($profesor!=null):?>

<form role="form" id="actualizar" method="post">
  <div class="form-group">
    <label for="cedula">Cedula</label>
    <input type="text" class="form-control" name="cedula" value="<?php echo $profesor->Cedula; ?>" readonly>
  </div>
  <div class="form-group">
    <label for="nombre">Nombre</label>
    <input type="text" class="form-control" name="nombre" value="<?php echo $profesor->Nombre; ?>">
  </div>
  <div class="form-group">
    <label for="Apellido1">1° Apellido</label>
    <input type="text" class="form-control" name="Apellido1" value="<?php echo $profesor->Apellido1; ?>">
  </div>
  <div class="form-group">
    <label for="Apellido2">2° Apellido</label>
    <input type="text" class="form-control" name="Apellido2" value="<?php echo $profesor->Apellido2; ?>">
  </div>
  <div class="form-group">
    <label for="Direccion">Domicilio</label>
    <input type="text" class="form-control" name="direccion" value="<?php echo $profesor->Direccion; ?>">
  </div>
  <div class="form-group">
    <label for="Telefono">Telefono</label>
    <input type="text" class="form-control" name="telefono" value="<?php echo $profesor->Telefono; ?>">
  </div>
  <div class="form-group">
    <label for="email">Correo electronico</label>
    <input type="text" class="form-control" name="email" value="<?php echo $profesor->Correo_Electronico; ?>">
  </div>
  <div class="form-group">
    <label for="Clave">Contraseña</label>
    <input type="password" class="form-control" name="clave" value="<?php echo $profesor->Clave; ?>">
  </div>
  <div class="form-group">
  <label for="fecha_nac">Fecha de Nacimiento</label>
    <div class='input-group date' id='fecha'>
    <input type='text' class="form-control" name="fecha_nac" value="<?php echo $profesor->Fecha_Nac; ?>" readonly>
    <span class="input-group-addon">
    <span class="glyphicon glyphicon-calendar"></span>
    </span>
    </div>
  </div>
<input type="hidden" name="id" value="<?php echo $person->id; ?>">
  <button type="submit" class="btn btn-default">Actualizar</button>
</form>

<script>
    $("#actualizar").submit(function(e){
    e.preventDefault();
    $.post("Controlador/ActualizarProf.php",$("#actualizar").serialize(),function(status){
    alert(status);
    });
    $('#Modal_Editar').modal('hide');
$('body').removeClass('modal-open');
$('.modal-backdrop').remove();
  });

</script>


<?php else:?>
  <p class="alert alert-danger">No se encuentra</p>
<?php endif;?>
