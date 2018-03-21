<html lang="en">
  <head>
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> <!--Responsive-->
  </head>
  <body>
    <div class="container">
        <h1 class="page-header" style="background-color:blue;color:white;">Horarios</h1>
        <form class="form-inline" role="search" id="buscar" style="float:left;">
          <div class="form-group">
            <input type="text" name="busqueda" class="form-control" placeholder="Buscar" onkeyup="bus();" id="busc">
          </div>
          <button type="submit" class="btn btn-default">
            &nbsp;<i class="glyphicon glyphicon-search"></i>&nbsp;
          </button>
          <a data-toggle="modal" href="#Modal" class="btn btn-default">Agregar</a>
        </form>

        <br>
        <!-- Modal -->
        <!-- Modal -->
        <div class="modal fade" id="Modal" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times; </button>
                <h4 class="modal-title">Agregar</h4>
              </div>
              <div class="modal-body">
                <form role="form" id="agregar" method="post">
                  <div class="form-group">
                    <label for="Dia">Día</label>
                    <select name="Dia" class="form-control">
                      <option value="Lunes">Lunes</option>
                      <option value="Martes">Martes</option>
                      <option value="Miercoles">Miércoles</option>
                      <option value="Jueves">Jueves</option>
                      <option value="Viernes">Viernes</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="Hora_Inicio">Hora Inicio</label>
                    <select name="Hora_Inicio" class="form-control">
                      <option value="07:00">07:00</option>
                      <option value="07:40">07:40</option>
                      <option value="08:25">08:25</option>
                      <option value="09:05">09:05</option>
                      <option value="10:00">10:00</option>
                      <option value="10:40">10:40</option>
                      <option value="12:10">12:10</option>
                      <option value="12:50">12:50</option>
                      <option value="01:45">01:45</option>
                      <option value="02:25">02:25</option>
                      <option value="03:10">03:10</option>
                      <option value="03:50">03:50</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="Hora_Fin">Hora Fin</label>
                    <select name="Hora_Fin" class="form-control">
                      <option value="07:40">07:40</option>
                      <option value="08:20">08:20</option>
                      <option value="09:05">09:05</option>
                      <option value="09:45">09:45</option>
                      <option value="10:40">10:40</option>
                      <option value="11:20">11:20</option>
                      <option value="12:50">12:50</option>
                      <option value="01:30">01:30</option>
                      <option value="02:25">02:25</option>
                      <option value="03:05">03:05</option>
                      <option value="03:45">03:45</option>
                      <option value="04:30">04:30</option>
                    </select>
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
    </div>
    <script type="text/javascript">
      $('#agregar').submit(function(e) {
        e.preventDefault();
        $.post('Controlador/Horarios/AgregarHorario.php', $('#agregar').serialize(), function(data) {
        if(!data){
          swal('Ups...', 'Algo salió mal!', 'error')
          } else {
            $('#agregar')[0].reset();
            $('#Modal').modal('hide');
            $('#tabla').html('');
            swal('Éxito!','El registro se ha guardado!','success')
            CargarTabla(1);
          }
        });
      });

  function CargarTabla(pagina) {
        var parametros = {
          "pagina" : pagina
        };
        $("#animacion").fadeIn('slow');
        $.ajax({
          url : 'Vista/Seg_Nivel/Nivel_1/TablaHorarios.php',
          data : parametros,
          success : function(data) {
            $("#tabla").html(data).fadeIn('slow');
            $("#animacion").html("");
          }
        })
      }

$(document).ready(function(){
  CargarTabla(1);
});

      function bus() {
        var par = {
          'busqueda' : $('#busc').val()
        };
        $.ajax({
          url : "Controlador/Horarios/BuscarHorario.php",
          data : par,
          success : function(data) {
            $('#tabla').html(data);
          }
        })
      }
    </script>
  </body>
</html>