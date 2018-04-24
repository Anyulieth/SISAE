$('#btn-export').empty();
$('#Asis').DataTable( {
  info: false,
  paging: false,
  "searching": false,
    dom: 'Bfrtip',
    buttons: [
      {
             extend: 'excelHtml5',
             className: 'verdExe',
             exportOptions: {

                 columns: [ 0, 1, 2,3,4,5,6,7,8 ]
             }
         },

         {

             extend: 'pdfHtml5',
             orientation: 'portrait',
             pageSize: 'LETTER',
             className: 'rojPdf',
             exportOptions: {

                 columns: [ 0, 1, 2,3,4,5,6,7,8]

             }
         },
     ],
     "initComplete": function(settings, json) {
     $(this).DataTable().buttons().container().appendTo( $('#btn-export') );
   }


} );
