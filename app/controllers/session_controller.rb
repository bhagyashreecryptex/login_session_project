class SessionController < ApplicationController
 # def index
 #  if current_user
 #    @user = current_user
 #    redirect_to session_path, notice: 'You are already logged in'
 #  else
 #    redirect_to new_session_path, alert: 'You need to log in first'
 #  end
 #  end

  def show
     @user = current_user
     
  end

def create
    # name = params[:name]
    email = params[:email]
    password = params[:password]
    if email.blank? || password.blank?
      flash.now.alert = 'Email and password are required'
      render :new
    else
      user = User.find_by(email: email)
      if user && user.authenticate(password)
        session[:user_id] = user.id
        session[:user_name] = user.name
        session[:user_email] = user.email
        session[:user_password] = user.password

        date_of_birth = '22-09-2000'
        session[:date_of_birth] = date_of_birth
        # render 'create'
        redirect_to session_path, notice: 'Logged in successfully'
      else
        flash.now.alert = 'Invalid email or password'
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You have been logged out succesfully'
  end
end

