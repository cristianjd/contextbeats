class StaticPagesController < ApplicationController
  def home
  end

  def music
    render layout: false
  end

  def news
    @posts = Post.all
    render layout: false
  end

  def about
    render layout: false
  end

end
