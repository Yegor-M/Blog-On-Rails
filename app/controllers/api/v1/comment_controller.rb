class Api::V1::CommentController < ApiController
  skip_before_action :authenticate_user!, only: [:create]
  before_action :authorize_request
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render json: @comment
     else
      render json: { errors: @comment.errors }
    end
  end

  def index
    @comments = Comment.order('created_at')
    render json: @comments, status: :ok
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :article_id, :created_at, :updated_at)
  end
end
