# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logins', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Welcome to the Login Form Demo")
    end
  end
end
