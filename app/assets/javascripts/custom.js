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
                $("#content").fadeIn(1000, function(){
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

$(document).on('onPlayerTrackSwitch.scPlayer', function(event, track){
    var $track_info = $('#music-info, .sc-time-span, .sc-time-indicators')
   $track_info.fadeOut(400, function(){
        $('#music-info h3').html(track.title);
        $('#music-info p:nth-child(2)').html('<span class="info-label">Tempo: </span>' + (track.bpm || "No Tempo") + " BPM");
        $('#music-info p:nth-child(3)').html('<span class="info-label">Key: </span>' + (track.key_signature || "No Key"));
        $('#music-info p:nth-child(4)').html('<span class="info-label">Description: </span>' + (track.description || "No Description"));
    });
    $track_info.fadeIn(400);
});

$(window).load(function(){
    $(".sc-trackslist").mCustomScrollbar({
        scrollInertia: 200
    });
});