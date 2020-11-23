class SignupController < ApplicationController
  def index
    redirect_to welcome_users_path if session[:username]
  end

  def create
    if signup_params[:password] != params[:password_confirm]
      error = 'Passwords do not patch'
    elsif User.where(email: signup_params[:email]).count > 0
      error = 'Email address currently in use'
    else
      @user = User.create(signup_params)
      error = @user.errors.full_messages.join('. ') unless @user.errors.empty?
    end

    if error
      flash[:error] = error
      redirect_to signup_index_path
    else
      session[:username] = @user.username
      flash[:notice] = 'Thank you for signing up!'
      redirect_to welcome_users_path
    end
  end

  private

  def signup_params
    params.permit(:username, :password, :email)
  end
end
