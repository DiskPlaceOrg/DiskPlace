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

    $('.download').on('click', function () {
        alert('Here: '+this.id);
        $.ajax({
            url: '1/resources/'+this.id,
            type: 'GET',
            success: function (r) {

            }
        });
    });
});