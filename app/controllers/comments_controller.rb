class CommentsController < ApplicationController
  include SessionsHelper
  before_filter :signed_in_user, except: [:index] 

  def index
    @comments = Comment.all
  end

  def new 
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    if @comment.save

      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id]) 
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    render :show
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to comments_path
  end

end