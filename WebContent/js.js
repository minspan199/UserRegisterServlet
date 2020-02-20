$(document).ready(function() {
	$('#dtBasicExample').DataTable();
	$('.dataTables_length').addClass('bs-select');
});

// function deleteEntry(email, firstName, url) {
// console.log(email, url);
// if (confirm("Are you sure to delete record of " + firstName + "?")) {
// // your deletion code
// $.ajax({
// method : "POST",
// url : url,
// data : {
// email : email
// },
// success : function(url) {
// window.location.href = link;
// },
// error : function(url) {
// alert(response.d);
// }
// }).done(function(msg) {
// console.log("posted")
// });
//
// }
// return false;
// }

function deleteEntry(firstName) {
	if (confirm("Are you sure to delete the record of " + firstName + "?")) {
		// bind 'myForm' and provide a simple callback function
		$('#deleteEntry').submit();
	} else
		return false;
}
