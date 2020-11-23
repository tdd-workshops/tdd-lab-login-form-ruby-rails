# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /users' do
    let(:user_email) { 'demo@example.com' }
    let(:user_password) { 'demo1234' }

    before do
      User.create(username: 'demo_user', email: user_email, password: user_password)
    end

    it 'login with username and password' do
      post '/users', params: { user: { email: user_email, password: user_password } }
      expect(response).to redirect_to(welcome_users_path)
      follow_redirect!

      expect(response.body).to include('Welcome back, demo_user')
    end
  end
end
