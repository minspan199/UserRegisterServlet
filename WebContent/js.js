

$(document).ready(function () {
	  $('#dtBasicExample').DataTable();
	  $('.dataTables_length').addClass('bs-select');
});


function edit() {
    $.post('/UserRegister/edit', {"postfield1":"val1"}, function(resp) {
        //Do something with the AJAX response
    });
}
