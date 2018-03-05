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


//top-menu
    $("html, body").animate({ scrollTop: 0 }, "slow");
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
            $('#scrollup').show();



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
            $('#scrollup').hide();

        }
    });
    //adding new div
    $('#share').click(function(){ $('#content').append('<div class="file" ><img src="images/fileimage.png"></img><div id="myDropdown" class="dropdown-content"><a href="#">Download</a></div></div>');
    });

    $('#unsall').click(function(){

        $('.file').removeClass('checked');

    });
    $('#sall').click(function(){

        $('.file').addClass('checked');

    });
    $('#delete').click(function(){

        $('.file.checked').remove();

    });
    $('#scrollup').click(function(){

        $("html, body").animate({ scrollTop: 0 }, "slow");

    });

    $("#leftside-navigation .sub-menu > a").click(function(e) {
        $("#leftside-navigation ul ul").slideUp(), $(this).next().is(":visible") || $(this).next().slideDown(),
            e.stopPropagation()
    })
});
$(document).on("click", ".file", function(evt) { if ((evt.ctrlKey)&&($(evt.target).parent().hasClass('checked')===true)){
    $(evt.target).parent().removeClass('checked');
}else if ((evt.ctrlKey)&&($(evt.target).parent().hasClass('checked')===false)){
    $(evt.target).parent().addClass('checked');
}});





$(document).keydown(function(e) {
    if(e.which===46&&e.ctrlKey) {$("#delete").trigger("click");}});
$(document).keydown(function(e) {
    if(e.which===37&&e.ctrlKey) {$(".file.moving").after($(".file.moving").prev());	}});
$(document).keydown(function(e) {
    if(e.which===39&&e.ctrlKey) {$(".file.moving").before($(".file.moving").next());	}});
$(document).keydown(function(e) {
    if(e.which===65&&e.ctrlKey) {$(".file").toggleClass("checked");}});

$()
$(document).on("click", ".file", function(evt) { if ((evt.altKey)&&($(evt.target).parent().hasClass('moving')===true)){

    $(evt.target).parent().removeClass('moving');
}else if ((evt.altKey)&&($(evt.target).parent().hasClass('moving')===false)){
    $('.file').removeClass('moving');
    $(evt.target).parent().addClass('moving');
}});
$(document).on("click", "#avatar", function(evt) {
    if($(evt.target).parent().find(".dropdown-content").hasClass("show")===false ){
        $("#avatar .dropdown-content").removeClass("show");
        $(evt.target).parent().find(".dropdown-content").addClass("show");}else{$("#avatar .dropdown-content").removeClass("show");
    }
});

$(window).scroll(function() {$(".file .dropdown-content").removeClass("show");});