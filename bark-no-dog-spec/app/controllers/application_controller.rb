class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_dog
    @current_dog ||= Dog.find(session[:dog_id]) if session[:dog_id]
  end

  helper_method :current_dog
end
