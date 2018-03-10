$(document).ready(function() {

    // AJAX sort by created_at and file_file_name
    $('.toggle').on('click', function() {
            var classes1 = this.classList;
            $.ajax({
                url: '/users/2/resources?sort='+classes1[2],
                type: 'GET',
                success: function(r) {
                }
            });
    });

    $('#file, #image, #video, #audio, #folder, #all').on('click', function() {
        $.ajax({
            url: '/users/2/resources?filter='+this.id,
            type: 'GET',
            success: function(r) {
            }
        });
    });
// file_key handle
    $("#get-files").on('click', function () {
        var key_value = document.getElementById('key-value').value;
        $.ajax({
           url: '/users/2/resources?file_key=' + key_value,
           type: 'GET',
           success: function (r) {

           }
        });
    });

//top-menu
    $("html, body").animate({ scrollTop: 0 }, "slow");
    $(window).scroll(function() {
        if($(document).scrollTop() > 50) {
            $('#top-menu').addClass('shrink');
            $('#inner-menu a').addClass('shrink');
            $('#generatedkey').addClass('shrink');
            $('.btn').addClass('shrink');
            $('input.toggle:checked').addClass('shrink');
            $('input.toggle').addClass('shrink');
            $('#scrollup').show();



        }
        else {
            $('#top-menu').removeClass('shrink');
            $('#inner-menu a').removeClass('shrink');
            $('#generatedkey').removeClass('shrink');
            $('.btn').removeClass('shrink');
            $('input.toggle:checked').removeClass('shrink');
            $('input.toggle').removeClass('shrink');
            $('#scrollup').hide();

        }
    });



    $('#scrollup').click(function(){

        $("html, body").animate({ scrollTop: 0 }, "slow");

    });
    $('#select').click(function(){

        $('.media').toggleClass('checked');

    });
    $('#content').click(function(){

        $('.media').removeClass('checked');

    });
    $(this).keydown(function(e1){


        if(e1.ctrlKey&&e1.which===65){$('.media').addClass('checked');

        }

    });



    $("#leftside-navigation .sub-menu > a").click(function(e) {
        $("#leftside-navigation ul ul").slideUp(), $(this).next().is(":visible") || $(this).next().slideDown(),
            e.stopPropagation()
    });
});






