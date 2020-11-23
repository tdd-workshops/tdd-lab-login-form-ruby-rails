require 'rails_helper'

RSpec.describe "Signups", type: :request do
  describe "GET /signup" do
    it "returns http success" do
      get "/signup"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Signup for an account")
    end
  end

  describe "POST /signup" do
    it "returns http success" do
      post "/signup", params: { username: 'demo1', password: 'demo1234', password_confirm: 'demo1234', email: 'demo1@example.com' }
      expect(response).to redirect_to(welcome_users_path)
      follow_redirect!

      expect(response.body).to include("Thank you for signing up")
    end
  end
end
