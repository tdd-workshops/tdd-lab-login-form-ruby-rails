class SignupController < ApplicationController
  def index
    redirect_to welcome_users_path if session[:username]
    @user = User.new
  end

  def create
    @user = User.new(signup_params)

    if @user.password != params[:password_confirm]
      @user.errors.add(:base, :mismatch_password, message: 'Passwords do not match')
    elsif User.where(email: signup_params[:email]).count > 0
      @user.errors.add(:email, :invalid, message: 'is currently in use by another user')
    else
      @user.save
    end

    if @user.errors.empty?
      session[:username] = @user.username
      flash[:notice] = 'Thank you for signing up!'
      redirect_to welcome_users_path
    else
      flash.now[:error] = @user.errors.full_messages.join('. ')
      render 'signup/index'
    end
  end

  private

  def signup_params
    params.permit(:username, :password, :email)
  end
end
