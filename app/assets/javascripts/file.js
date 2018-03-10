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

    // $('#share').click(function(){
    //     var id_array = [];
    //     alert('a');
    //     id_array.push($('.media.checked').find('.secondmedia').attr('id'));
    //     alert('id_array: ' + id_array[1]);
    //     alert('id_array: ' + id_array[0]);
    // });

    // $('#share').click(function() {
    //     var i = 0;
    //     var ids = [];
    //     $('.secondmedia').each(function () {
    //        ids[i++] = $(this).attr('id');
    //     });
    //     for(var a = 0; a < ids.length; a++) {
    //         alert('element['+a+']: '+ ids[a]);
    //     }
    // });

});