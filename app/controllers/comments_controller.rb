class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])

    respond_to do |format|
      format.html {redirect_to post_path(@post)}
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      format.js
    end
    @comment.destroy

  end

end
