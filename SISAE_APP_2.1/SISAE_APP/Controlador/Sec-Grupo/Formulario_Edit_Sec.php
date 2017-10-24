<?php
include "conexion.php";

$sql1= "CALL PaSeccionTb20_BuscarSec($_GET[id_sec])";
$query = $con->query($sql1);
if($query->num_rows>0){
while ($seccion=$query->fetch_object()){
  break;
}

  }
?>

<?php if($seccion!=null):?>

<form role="form" id="actualizar" method="post">
  <div class="form-group">
    <label for="id_grupo">ID_Grupo</label>
    <input type="text" class="form-control" name="id_grupo" value="<?php echo $seccion->ID_Seccion;?>" readonly>
  </div>
  <div class="form-group">
    <label for="Grado">Grado</label>
    <input type="text" class="form-control" name="Grado" value="<?php echo $seccion->Grado;?>" readonly>
  </div>
  <div class="form-group">
    <label for="num_grupo">Numero Grupo</label>
    <input type="text" class="form-control" name="num_grupo" value="<?php echo $seccion->Num_grupo?>">
  </div>
  <div  class="from-group">
    <label for="cupo">Cupo</label>
    <input type="text" class="form-control" name="cupo" value="<?php echo $seccion->cupo;?>">
  </div>
  <button type="submit" class="btn btn-default">Actualizar</button>
</form>

<script>
    $("#actualizar").submit(function(e){
    e.preventDefault();
    $.post("./Controlador/Sec-Grupo/EditarSeccion.php",$("#actualizar").serialize(),function(data){
    if(!data){alert("Se produjo un error");}
    else{
$('#Modal_Editar').modal('hide');
$('body').removeClass('modal-open');
$('.modal-backdrop').remove();
$('#tabla').html('');
CargarTabla();
    }
    });
  });

</script>


<?php else:?>
  <p class="alert alert-danger">No se encuentra</p>
<?php endif;?>