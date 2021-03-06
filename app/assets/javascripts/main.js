$(document).ready(function(){
    $("#menu li > a").click(function(event){
        var $navnew = $(this);
        var $navold = $(".activenav");
        event.preventDefault();
        $navold.animate({color: "#a0a0a0"}, 400, function(){
            $navold.removeClass("activenav");
            $navold.removeAttr("style");
        });
        $navnew.animate({color: "#0088cc"}, 400, function(){
            $navnew.addClass("activenav");
        });
        loadContent($navnew.attr("href"));
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

var $track_name = "";

$(document).on('onPlayerTrackSwitch.scPlayer', function(event, track){
    var $track_info = $('#music-info, .sc-time-span, .sc-time-indicators');
    var $track_key = track.key_signature;
    if ($track_key === "") {
        $track_key = "No Key";
    }
    else if ($track_key.search("m") === -1){
        $track_key = $track_key + " Major";
    }
    else {
        $track_key = $track_key.replace("m", " Minor");
    }
    if ($track_name !== track.title) {
        $track_info.fadeOut(400, function(){
            $('#music-info h3').html(track.title);
            $('#music-info ul').html("<li>" + (track.bpm || "No Tempo") + " BPM</li><li>" + ($track_key || "No Key") + "</li>");
        });
        $track_info.fadeIn(400);
    }
    $track_name = track.title;
});

$(window).load(function(){
    $(".sc-trackslist").mCustomScrollbar({
        scrollInertia: 200
    });
});
