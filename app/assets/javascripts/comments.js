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