$('#prof').DataTable( {

  info: false,
  "searching": false,
    dom: 'Bfrtip',
    buttons: [
      {
             extend: 'excelHtml5',
             className: 'green',
             exportOptions: {

                 columns: [ 0, 1, 2,3,4,5,6,7,8,9 ]
             }
         },

         {

             extend: 'pdfHtml5',
             orientation: 'landscape',
             pageSize: 'LETTER',
             className: 'red',
             exportOptions: {

                 columns: [ 0, 1, 2,3,4,5,6,7,8,9 ]

             }
         },
         {

            extend: 'print',
            text: 'Imprimir',
            className: 'blue',
                exportOptions: {
                    columns: [ 0, 1, 2,3,4,5,6,7,8,9 ]
                }
            },
     ],
     "initComplete": function(settings, json) {
     $(this).DataTable().buttons().container().appendTo( $('#btnPdf') );
   }


} );
