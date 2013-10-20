module CommentsHelper

  def comment_display(comment)
    raw("<span class='comment_name'>#{comment.commenter}</span> said: \"<span class='comment_text'>#{comment.body}</span>\" on <span class='comment_date'>#{formatted_time(comment)}</span>.")
  end
end
