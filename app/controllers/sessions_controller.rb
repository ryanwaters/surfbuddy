class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # sign_in_user
      redirect_to posts_path, notice: "Logged in!"
    else
      flash.now.alert = "Email or Password is invalid!"
      
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    # sign_out
    redirect_to root_url, notice: "Logged Out"
  end
end
