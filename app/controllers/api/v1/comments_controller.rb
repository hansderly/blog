class Api::V1::CommentsController < Api::V1::MainController
  skip_before_action :authenticate, only: :index

  def index
    @post = Post.includes(:comments).find(params[:post_id])
    render json: @post.comments
  end

end
