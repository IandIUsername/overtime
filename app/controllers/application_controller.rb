class ApplicationController < ActionController::Base
  include Pundit
 before_action :authenticate_user!
 #before_action :authenticate_admin
 protect_from_forgery with: :exception
 
 
 rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
 
 
  def user_not_authorized
     flash[:alert] = "You are not authorized to perform this action"
     redirect_to(root_path)
  end  
 
 
 
 
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
end
