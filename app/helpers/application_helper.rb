module ApplicationHelper

  def formatted_time(item)
    item.created_at.strftime("%B %d %Y, %I:%M %p")
  end
end
