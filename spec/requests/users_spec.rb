require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /' do
    it 'response 200' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'index template was rendered' do
      get users_path
      expect(response).to render_template(:index)
    end
  end
end
