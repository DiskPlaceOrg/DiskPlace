$(document).ready(function() {
    // AJAX Delete File function ->
    $(".destroy").on('click', function () {
        if (confirm('Are you sure ?')) {
            $.ajax({
                url: '/users/2/resources/' + this.parentElement.id,
                type: 'DELETE',

                success: function (r) {
                }
            });
            this.parentElement.remove();
        }
    });
});