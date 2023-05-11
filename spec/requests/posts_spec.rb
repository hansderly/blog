require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { User.create(name: 'Hans', posts_counter: 0) }

  describe 'GET /' do
    it 'response 200' do
      get user_posts_path(user)

      expect(response).to have_http_status(200)
    end

    it 'index template was rendered' do
      get user_posts_path(user)

      expect(response).to render_template(:index)
    end
  end
end
