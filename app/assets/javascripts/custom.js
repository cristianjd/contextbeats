$(document).ready(function(){
    $("#menu li > a").click(function(event){
        var $navnew = $(this);
        var $navold = $(".activenav");
        event.preventDefault();
        $navold.animate({fontSize: '1em', color: "#a0a0a0"}, 400, function(){
            $navold.removeClass("activenav");
            $navold.removeAttr("style");
        });
        $navnew.animate({fontSize: '1.5em', color: "#0088cc"}, 400, function(){
            $navnew.addClass("activenav");
        });
        $("#content").fadeOut(200, function(){
            $("#content").load($navnew.attr("href"), function(){
                $("#content").fadeIn(1500, function(){
                });
            });
        });
    });
    $("#links a img")
        .mouseover(function() {
            var src = $(this).attr("src").replace("blue.png", "white.png");
            $(this).attr("src", src);
        })
        .mouseout(function() {
            var src = $(this).attr("src").replace("white.png", "blue.png");
            $(this).attr("src", src);
        });
});