<?php include "C:/xampp/htdocs/SISAE_APP/Controlador/ListarProf.php";
if($result->num_rows>0):?>
<table class="table table-bordered table-hover">
<thead>
  <th>Cedula</th>
  <th>Nombre</th>
  <th>1° Apellido</th>
  <th>2° Apellido</th>
  <th>Direccion</th>
  <th>Genero</th>
  <th>Telefono</th>
  <th>Email</th>
  <th>Clave</th>
  <th>Fecha Nacimiento </th>
  <th>Estado</th>
  <th></th>
</thead>
<?php while ($r=$result->fetch_array()):?>
<tr>
  <td><?php echo $r["Cedula"]; ?></td>
  <td><?php echo $r["Nombre"]; ?></td>
  <td><?php echo $r["Apellido1"]; ?></td>
  <td><?php echo $r["Apellido2"]; ?></td>
  <td><?php echo $r["Direccion"]; ?></td>
  <td><?php echo $r["Genero"]; ?></td>
  <td><?php echo $r["Telefono"]; ?></td>
  <td><?php echo $r["Email"]; ?></td>
  <td><?php echo $r["Clave"]; ?></td>
  <td><?php echo $r["Fecha Nac"]; ?></td>
  <td><?php echo $r["Estado"]; ?></td>
  
  <td style="width:150px;">
    <a data-id="<?php echo $r["id"];?>" class="btn btn-edit btn-sm btn-warning" style="width:60px">Editar</a>
    <a href="#" id="bor-<?php echo $r["Cedula"];?>" class="btn btn-sm btn-danger" style="width:60px">Eliminar</a>
    <script>
    $('#bor-'+<?php echo $r['Cedula']?>).click(function(e){
      e.preventDefault();
      p = confirm('Esta Seguro??');
      if(p){$.get('Controlador/EliminarProf.php','ced='+<?php echo $r['Cedula']?>,function(data){
        $('#tabla').html('');
        CargarTabla();
      });}
    });
</script>
      </td>
</tr>
<?php endwhile;?>
</table>
<?php else:?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif;?>