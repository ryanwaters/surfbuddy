class UsersController < ApplicationController
  before_filter :signed_in_user, except: [:new, :create]
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
     if @user
      @name = @user.name
      @email = @user.email
      
      render :show
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "Thanks for signing up!"
    else
     
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
    
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    render :show
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

end
