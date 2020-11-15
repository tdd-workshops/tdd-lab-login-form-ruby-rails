# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    @user = User.where(user_params)&.first

    if @user
      session[:username] = @user.username
      flash[:notice] = 'Successfully, logged in!'
      redirect_to welcome_users_path
    else
      flash[:error] = 'Invalid user login'
      redirect_to '/'
    end
  end

  def welcome
    @message = "Welcome back, #{session[:username]}!"
  end

  def logout
    session.destroy
    redirect_to '/', notice: 'You have successfully logged out'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
