
     <div class="col-sm-6 col-sm-offset-4 col-md-11 col-md-offset-1">
          <h1 class="page-header" style="background-color:blue;color:white; ">Estudiantes</h1>

         <form class="form-inline" role="search" id="buscar">
      <div class="form-group">
        <input type="text" name="s" class="form-control" placeholder="Buscar">
      </div>
      <button type="submit" class="btn btn-default">&nbsp;<i class="glyphicon glyphicon-search"></i>&nbsp;</button>
  <a data-toggle="modal" href="#newModal" class="btn btn-default">Agregar</a>
    </form>

<br>
  <!-- Modal -->
 <!-- Modal -->
  <div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="newModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Agregar</h4> 
        </div>
				<div class="modal-body">
					<form role="form" id="agregar" method="post">
						<div class="form-group">
							<label for="Cedula">Cedula</label>
							<input type="text" class="form-control" name="Cedula">
						</div>
						<div class="form-group">
							<label for="Nombre">Nombre</label>
							<input type="text" class="form-control" name="Nombre" >
						</div>
						<div class="form-group">
							<label for="Apellido1">1° Apellido</label>
							<input type="text" class="form-control" name="Apellido1">
						</div>
						<div class="form-group">
							<label for="Apellido2">2° Apellido</label>
							<input type="text" class="form-control" name="Apellido2">
						</div>
						<div class="form-group">
							<label for="Direccion">Domicilio</label>
							<input type="text" class="form-control" name="Direccion">
						</div>
						<div class="form-group">
							<label for="Genero">Genero</label>
							<label>
								<input type="radio" name="femenino" value="" id="F" checked="true">
								Femenino</label>
							<label>
								<input type="radio" name="masculino" value="" id="M">
								Masculino</label>
						</div>
						<div class="form-group">
							<label for="Telefono">Teléfono</label>
							<input type="text" class="form-control" name="Telefono" >
						</div>
						<div class="form-group">
							<label for="Email">Correo electronico</label>
							<input type="text" class="form-control" name="Email" >
						</div>
						<div class="form-group">
							<label for="Id_Estudiante">Id Estudiante</label>
							<input type="password" class="form-control" name="Id_Estudiante">
						</div>
						<div class="form-group">
							<label for="Fecha_Nac">Fecha Nacimiento</label>
							<input type="password" class="form-control" name="Fecha_Nac">
						</div>
						<div class="form-group">
							<label for="Adecuacion">Adecuacion</label>
							<input type="password" class="form-control" name="Adecuacion">
						</div>
						<div class="form-group">
							<label for="Estado">Estado</label>
							<input type="password" class="form-control" name="Estado">
						</div>
						<div class="form-group">
							<label for="Id_Especialidad">Id Especialidad</label>
							<input type="password" class="form-control" name="Id_Especialidad">
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">
								Agregar
							</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">
								Cancelar
							</button>
						</div>
					</form>
				</div>

			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<div id="tabla">

	</div>
	
<?php include "../Controlador/Estudiante/ListarEst.php";
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
  <th>Id Estudiante</th>
  <th>Fecha Nacimiento</th>
  <th>Adecuacion</th>
  <th>Estado</th>
  <th>Id Especialidad</th>
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
  <td><?php echo $r["IdEstudiante"]; ?></td>
  <td><?php echo $r["FechaNac"]; ?></td>
  <td><?php echo $r["Adecuacion"]; ?></td>
  <td><?php echo $r["Estado"]; ?></td>
  <td><?php echo $r["IdEspecialidad"]; ?></td>
  
 <td style="width:150px;">
    <a data-id="<?php echo $r["id"]; ?>" class="btn btn-edit btn-sm btn-warning">Editar</a>
    <a href="#" id="del-<?php echo $r["VcUsuTb01_Cedula"]; ?>" class="btn btn-sm btn-danger">Eliminar</a>
    <script>
  			$("#del-"+<?php echo $r["VcUsuTb01_Cedula"]; ?>).click(function(){
    e=confirm("Esta seguro??");
    if(e){$.get("../Controlador/Estudiante/EliminarEst.php","id="+<?php echo $r["VcUsuTb01_Cedula"]; ?>
		);}
		});
</script>
      </td>
</tr>
<?php endwhile; ?>
</table>
<?php else: ?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif; ?>
</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
   
<script>
	function loadTabla() {
		$('#editModal').modal('hide');
		$("#tabla").html(data); })
	}
	
	$("#F").click(function() {
		$("#M").removeAttr('checked');
		$("#M").value('');
		$("#F").value('F');
	});
	$("#M").click(function() {
		$("#F").removeAttr('checked');
		$("#F").value('');
		$("#M").value('M');
	});

	$("#agregar").submit(function(e) {
		e.preventDefault();
		$.post("../Controlador/Estudiante/AgregarEst.php",$("#agregar").serialize(),function(status){alert(status)});
  		$('#agregar')[0].reset();
  		$('#newModal').modal('hide');
  		loadTabla();
	});
	
	$("#buscar").submit(function(e) {
		e.preventDefault();
		$.get("./Controlador/Estudiante/BusquedaEst.php", $("#buscar").serialize(), function(data) {
		$("#tabla").html(data);
		$("#buscar")[0].reset(); });
	});
	
	$(".btn-edit").click(function(){
  		id = $(this).data("id");
  		$.get("../Controlador/Estudiante/Formulario.php","id="+id,function(data){
  			$("#form-edit").html(data);
  		});
  		$('#editModal').modal('show');
  	});

</script>
  </body>
</html>