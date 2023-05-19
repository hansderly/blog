module Api::V1
  class PostsController < Api::V1::MainController
    skip_before_action :authenticate, only: :index

  end
end
