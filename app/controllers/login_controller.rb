# frozen_string_literal: true

class LoginController < ApplicationController
  def index
    redirect_to welcome_users_path if session[:username]

    @user = User.new
  end
end
