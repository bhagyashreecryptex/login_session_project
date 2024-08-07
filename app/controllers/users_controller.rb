class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: "User Register Successfully"
    else
      flash[:notice] = "users Alredy Exist"
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    
  end

  def update
    @user = current_user
    if @user.update(user_params)
      # Update session data after successful update
      session[:user_name] = @user.name
      session[:user_email] = @user.email
      session[:user_password] = @user.password
      redirect_to edit_user_path(@user), notice: 'Profile updated successfully'
    else
      render :edit
    end
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
