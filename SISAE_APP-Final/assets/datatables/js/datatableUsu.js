$('#Usu').DataTable( {


  info: false,
  "searching": false,
    dom: 'Bfrtip',
    buttons: [
      {
             extend: 'excelHtml5',
             className: 'green',
             exportOptions: {

                 columns: [ 0, 1,2]
             }
         },

         {

             extend: 'pdfHtml5',
             orientation: 'portrait',
             pageSize: 'LETTER',
             className: 'red',
             exportOptions: {

                 columns: [ 0, 1,2]

             }
         },
     ],
     "initComplete": function(settings, json) {
     $(this).DataTable().buttons().container().appendTo( $('#btnusu') );
   }


} );
