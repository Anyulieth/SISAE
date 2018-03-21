<?php
require_once '../../Modelo/SeccionCl19.php';
$busq =$_GET['id_sec'];
$sec = new SeccionCl19(); 
 $result = $sec->SeccionCl19_BuscaSec($busq);
if($result){
?>

<?php foreach ($result as $r): ?> 
<form role="form" id="actualizar" method="post">
    <h2>Editando Sección/Grupo: <?php echo $r["ID_Seccion"];?> </h2>
  <div class="form-group">
    <label for="num_grupo">Número Grupo</label>
    <input type="text" class="form-control" name="num_grupo" value="<?php echo $r['Num_grupo'];?>">
  </div>
  <div  class="form-group">
    <label for="cupo">Cupo</label>
    <input type="text" class="form-control" name="cupo" value="<?php echo $r['cupo'];?>">
  </div>
  <input type="hidden" name="id" value="<?php echo $r["ID_Seccion"]; ?>">
  <button type="submit" class="btn btn-default">Actualizar</button>
</form>
<?php endforeach ?>     
<?php
}?>

<script>
    $("#actualizar").submit(function(e){
    e.preventDefault();
    $.post("./Controlador/Sec-Grupo/EditarSeccion.php",$("#actualizar").serialize(),function(data){
    if(data!=1){swal('Ups...', 'Algo salió mal!', 'error');}
    else{
$('#Modal_Editar').modal('hide');
$('body').removeClass('modal-open');
$('.modal-backdrop').remove();
$('#tabla').html('');
CargarTabla(1);
swal('Editado', 'El registro fue modificado', 'success');
    }
    });
  });
</script>