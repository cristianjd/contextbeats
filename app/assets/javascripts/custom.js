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
                if ($navnew.attr("href") !== "/contact") {
                    $("#content").mCustomScrollbar({
                        scrollInertia: 200,
                        advanced: {updateOnContentResize: true}
                    });
                }
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

var $track_name = "";

$(document).on('onPlayerTrackSwitch.scPlayer', function(event, track){
    var $track_info = $('#music-info, .sc-time-span, .sc-time-indicators')
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

function IsNotBlank(field) {
    if ($(field).val() == "") {
        return false;
    } else if ($(field).val() != "") {
        return true;
    }
}

function IsEmail(email) {
    var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test($(email).val());
}

function validator() {
    if (IsNotBlank("#message_name") && IsNotBlank("#message_email") && IsNotBlank("#message_subject") && IsNotBlank("#message_body") && IsEmail("#message_email")) {
        return true;
    } else {
        return false;
    }
}

$(document).on("click", '.comment_link', function(event){
    event.preventDefault();
    var post_div = '#' + $(this).parent().attr("id") + ' ';
    $(post_div + '.comment_container').slideToggle(600);
    $(".comment_submit").on("click", function(event){
        event.preventDefault();
        var post_subdiv = '#' + $(this).parent().parent().parent().parent().parent().attr("id") + ' ';
        $(post_subdiv +".errors_2").fadeOut(400, function(){
            if (!IsNotBlank(post_subdiv +".comment_commenter")) {
                $(post_subdiv +".errors_2").html("Name can not be blank.");
            }
            else if (!IsNotBlank(post_subdiv +".comment_body")){
                $(post_subdiv +".errors_2").html("Comment can not be blank.");
            }
            else {
                $(post_subdiv +".errors_2").html("");
                $(post_subdiv +".comment_form").submit(function(){
                    $(this).on("ajax:complete", function(){
                        $(post_subdiv +".comment_body").val("");
                        $(post_subdiv +".comment_commenter").val("");
                    });
                });
                $(post_subdiv +".comment_form").submit();
            }
        });
        $(post_subdiv +".errors_2").fadeIn(400);
    });
});

$(document).on("click", "#contact_submit", function(event){
    event.preventDefault();
    $("#errors").fadeOut(400, function(){
        if (!IsNotBlank("#message_name")) {
            $("#errors").html("Name can not be blank.");
        }
        else if (!IsNotBlank("#message_email")){
            $("#errors").html("Email can not be blank.");
        }
        else if (!IsEmail("#message_email")){
            $("#errors").html("Invalid email.");
        }
        else if (!IsNotBlank("#message_subject")){
            $("#errors").html("Subject can not be blank.");
        }
        else if (!IsNotBlank("#message_body")){
            $("#errors").html("Message can not be blank.");
        }
        else {
            $("#errors").html("");
            $("#contact_form").submit(function(){
                $(this).on("ajax:beforeSend", function(){
                    $("#errors").html("Sending message...");
                });
                $(this).on("ajax:complete", function(){
                    $("#errors").html("Message sent!");
                    $("#message_body").val("");
                    $("#message_subject").val("");
                    $("#message_email").val("");
                    $("#message_name").val("");
                });
            });
            $("#contact_form").submit();
        }
    });
    $("#errors").fadeIn(400);
});

function loadContent(url) {
    $("#content").fadeOut(200, function(){
        $("#content").load(url, function(){
            $("#content").mCustomScrollbar({
                scrollInertia: 200,
                advanced: {updateOnContentResize: true}
            });
            $("#content").fadeIn(1000, function(){
            });
        });
    });
}