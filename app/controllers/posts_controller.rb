class PostsController < ApplicationController
  include SessionsHelper
  before_filter :signed_in_user, except: [:index] 

  def index
    @posts = Post.includes(:comments).all 
  end

  def show
    current_user = current_user
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    render :show
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

end
