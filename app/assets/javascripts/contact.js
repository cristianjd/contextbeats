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
