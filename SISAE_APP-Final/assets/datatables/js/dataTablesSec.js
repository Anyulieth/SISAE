$('#secc').DataTable( {


  info: false,
  "searching": false,
    dom: 'Bfrtip',
    buttons: [
      {
             extend: 'excelHtml5',
             className: 'verdExe round',
             exportOptions: {

                 columns: [ 0, 1, 2,3]
             }
         },

         {

             extend: 'pdfHtml5',
             className: 'rojPdf round',
             orientation: 'landscape',
             pageSize: 'A5',

             exportOptions: {

                 columns: [ 0, 1, 2,3]

             }
         },
     ],
     "initComplete": function(settings, json) {
     $(this).DataTable().buttons().container().appendTo( $('#btn-export') );
   }


} );
