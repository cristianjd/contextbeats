$(document).ready(function(){
    $("#menu li a").click(function(event){
        event.preventDefault();
        $("#content").load($(this).attr("href"));
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