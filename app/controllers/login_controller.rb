# frozen_string_literal: true

class LoginController < ApplicationController
  def index
    @user = User.new
  end
end
