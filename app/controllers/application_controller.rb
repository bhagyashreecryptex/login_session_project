  class ApplicationController < ActionController::Base
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user 
  end

  # before_action :authenticate_user!

   # private
  # def authenticate_user!
  #   redirect_to new_session_path, notice: 'You need to login first' if current_user.nil?
  # end