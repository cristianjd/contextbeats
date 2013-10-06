function loadContent(url) {
    $("#content").fadeOut(200, function(){
        $("#content").load(url, function(){
            if (url !== "/contact") {
                $("#content").mCustomScrollbar({
                    scrollInertia: 200,
                    advanced: {updateOnContentResize: true}
                });
            }
            $("#content").fadeIn(1000, function(){
            });
        });
    });
}

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

