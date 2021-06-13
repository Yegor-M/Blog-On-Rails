class Api::V1::ArticleController < ApiController
  skip_before_action :authenticate_user!, only: [:create,:index]
  before_action :authorize_request

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      render json: @article
    else
      render json: { errors: @article.errors }
    end
  end

  def index
    @articles = Article.order('created_at')
    @article.each do |article|
      article.description.trancute(500)
    end
    render json: @articles, status: :ok
  end

  private

  def article_params
    params.permit(:title, :description, :user_id, :created_at, :updated_at)
  end
end
