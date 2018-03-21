

<!-- ESTE ARCHIVO DEBE LLAMARSE CORREOPROF.PHP
	 DEBE ESTAR EN EL NIVEL_2
	 INTERFAZ QUE PERMITE AL PROFESOR ENVIAR COMUNICADOS A ENCARGADOS -->


<html lang="en">
  <head><meta charset="utf-8"></head>
  <body>
    <div class="container">
      <h1 class="page-header" style="background-color:blue;color:white;">Envío de comunicados a encargados</h1>
      <form class="form-inline" role="search" id="buscar" style="float:left;">
        <!-- <div class="form-group">
          <input type="text" name="busqueda" class="form-control" placeholder="Buscar" id="busc" onkeyup="bus();">
        </div>
        <button type="submit" class="btn btn-default">
          &nbsp;<i class="glyphicon glyphicon-search"></i>&nbsp;
        </button>
        <a data-toggle="modal" href="#Modal" class="btn btn-default">Agregar</a> -->
      </form>

      <div class="panel-group">
   <div class="panel panel-default">
    <div class="panel-heading"></div>
    <div class="panel-body">
        <form id="enviar" class="contact-form" method="POST">
           <div class="form-group">
              <label>Para *</label>
              <input type="email" id="email" name="email" class="form-control" >
           </div> 
           <div class="form-group">
               <label>Asunto *</label>
               <input type="text" id="subject" name="subject" class="form-control" >
           </div>
           <div class="form-group">
                <label>Mensaje *</label>
                <textarea name="mensaje" id="mensaje" class="form-control" rows="8"></textarea>
           </div>                        
           <div class="form-group">
                <input type="submit" id="submit" name="submit" class="btn btn-primary btn-lg" value="Enviar" />
           </div>                      
</form>   
      </div></div></div></div>

    
    <script type="text/javascript">
      $('#enviar').submit(function(e) {
        e.preventDefault();
        $.post('Controlador/Profesor/EnviarCorreo.php', $('#enviar').serialize(), function(data) {
          if (data != 1) {
            swal('Ups...', 'Algo salió mal!', 'error');
          } else {
            swal('Agregado!', 'El registro fue agregado.', 'success')
          }
        });
      });

    /*function bus() {
        var par = {
          'busqueda' : $('#busc').val()
        };
        $.ajax({
          url : "Controlador/Encargado/BuscarEnc.php",
          data : par,
          success : function(data) {
            $('#tabla').html(data);
          }
        })
      }*/
    </script>
  </body>
</html>
