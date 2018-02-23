// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    $(window).scroll(function() {
        if($(document).scrollTop() > 75) {
            $('#top-menu').addClass('shrink');
            $('#inner-menu a').addClass('shrink');
            $('#inner-menu a:after').addClass('shrink');
            $('#inner-menu a:hover').addClass('shrink');
            $('.searchbox input').addClass('shrink');
            $('li select').addClass('shrink');
            $('.btn').addClass('shrink');
            $('input.toggle:checked').addClass('shrink');
            $('input.toggle').addClass('shrink');



        }
        else {
            $('#top-menu').removeClass('shrink');
            $('#inner-menu a').removeClass('shrink');
            $('#inner-menu a:after').removeClass('shrink');
            $('#inner-menu a:hover').removeClass('shrink');
            $('.searchbox input').removeClass('shrink');
            $('li select').removeClass('shrink');
            $('.btn').removeClass('shrink');
            $('input.toggle:checked').removeClass('shrink');
            $('input.toggle').removeClass('shrink');


        }
    });
    $('#sall').click(function(){ $('#content').append('<div class="file"><img src="images/fileimage.png"></img></div>');   });
    $('#unsall').click(function(){$('#content div').last().remove();});
    $("#leftside-navigation .sub-menu > a").click(function(e) {
        $("#leftside-navigation ul ul").slideUp(), $(this).next().is(":visible") || $(this).next().slideDown(),
            e.stopPropagation()
    })
});