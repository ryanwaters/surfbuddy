class SessionsController < ApplicationController
  before_filter :user_finder, :only => [:create]
  include SessionsHelper

  def new
  end

  def create
    @user = user_finder
    if @user
      sign_in(@user)
      redirect_to posts_path
    else
      flash[:error] = "Error"
      render :new
    end

  #   if request.env["omniauth.auth"]
  #     user = User.from_omniauth(env["omniauth.auth"])
  #     session[:user_id] = user.id
  #     sign_in(user)
  #     redirect_to posts_path

  #   else
  #     user = User.find_by_email(params[:email])
    
  #     if user && user.authenticate(params[:password])
  #       session[:user_id] = user.id
  #       # sign_in_user
  #       redirect_to posts_path, notice: "Logged in!"
  #     else
  #       flash.now.alert = "Email or Password is invalid!"
        
  #       render 'new'
  #   end
  # end
  end

  def destroy
  self.current_user = nil
  cookies.delete(:remember_token)
  redirect_to login_path
    session[:user_id] = nil
    # sign_out
    # redirect_to root_url, notice: "Logged Out"
  end
end
