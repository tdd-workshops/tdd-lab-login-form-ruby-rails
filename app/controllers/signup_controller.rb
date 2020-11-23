# frozen_string_literal: true

class SignupController < ApplicationController
  def index
    redirect_to welcome_users_path if session[:username]
    @user = User.new
  end

  def create
    @user = User.new(signup_params)

    User.signup(@user)

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
    params.permit(:username, :password, :password_confirm, :email)
  end
end
