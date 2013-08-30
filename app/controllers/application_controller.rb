class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   # Authorization: signed_in_user is called in a before_filter
  # callback in each controller, see books/ingredients/recipe controllers
  # Ensures access to create/edit functions on if signed in.
  def signed_in_user
    if session[:user_id].nil?
      # If not signed in, save current location in session object
      # to be able to redirect after successful sign in.
      #session[:return_to] = request.url
      # prompt sign in page
      redirect_to login_path
    end
  end
  helper_method :signed_in_user

  def user_authorization
    
    redirect_to(posts_path) unless current_user.id.to_s == params[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not Authorized" if current_user.nil?
  end 
end
