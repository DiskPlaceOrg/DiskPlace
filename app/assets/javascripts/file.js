$(document).ready(function() {
    // AJAX Delete File function ->
    $(".destroy").on('click', function () {
        if (confirm('Are you sure ?')) {
            $.ajax({
                url: '/users/2/resources/' + this.parentElement.parentElement.id,
                type: 'DELETE',

                success: function (r) {
                }
            });
            this.parentElement.parentElement.remove();
        }
    });
    $('#delete').click(function(){

        $('.media.checked').find('.destroy').click();

    });
    $('.media').click(function(e){

        if(e.ctrlKey){$(this).toggleClass('checked');


        }else{
            $('.media').removeClass('checked');
            $(this).addClass('checked');

        }
        e.stopPropagation();
    });

    // key create
    $('#share, .generate').on('click', function () {
        var i = 0;
        var ids = [];
        alert('aaaa');
        $('.secondmedia').each(function () {
            ids[i++] = $(this).attr('id');
        });
        alert('bbbb');
        alert('to str: ' + ids.toString());
        $.ajax({
            url: '/users/2/resources/' + ids.toString() + '/file_keys',
            type: 'POST',

            success: function (r) {

            }
        });
    });
});