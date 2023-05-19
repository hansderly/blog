module Api::V1
  class PostsController < Api::V1::MainController
    skip_before_action :authenticate, only: :index

    def index
      @user = User.includes({ posts: :author }, { posts: { comments: :author } }).find(params[:user_id])
      @posts = @user.posts
      render json: @posts
    end
  end
end
