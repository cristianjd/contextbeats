class PostsController < ApplicationController
layout false
before_filter :signed_in_user, :except => :index

  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.haml
      format.js { render js: "loadContent('/posts')" }
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.js { render js: "loadContent('/posts/#{@post.id}')" }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.haml
      format.js { render js: "loadContent('/posts/new')" }
    end
  end

  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render js: "loadContent('/posts/#{@post.id}/edit')" }
    end
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.js { render js: "loadContent('/posts')" }
      else
        format.html { render action: "new" }
        format.js { render js: "loadContent('/posts/new')" }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.js { render js: "loadContent('/posts')" }
      else
        format.html { render action: "edit" }
        format.js { render js: "loadContent('/posts/#{post.id}/edit')" }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js { render js: "loadContent('/posts')" }
    end
  end

  private

    def signed_in_user
      redirect_to root_path unless signed_in?
    end
end
