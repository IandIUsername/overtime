class ApplicationController < ActionController::Base
  includ Pundit
 before_action :authenticate_user!
  # github radrails9 chicken5snakes
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
