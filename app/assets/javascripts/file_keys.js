// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$('.file_key_delete').on('click', function () {
    if(confirm('r u sure ?')) {
       $.ajax({
           url: '/users/1/resources/1/file_keys/' + this.id,
           type: 'DELETE',
           success: function (r) {

           }
       });
       this.parentElement.remove();
   }
});
