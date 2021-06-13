class ArticlesController < ApplicationController
  before_action :find_article
  before_action :authorize_request, only: [:destroy]

  def show
    render json: @article, status: :ok
  end

  def destroy
    if current_user.id == @article.user_id
      @article.destroy
    else
      render json: { errors: 'Only Creator can delete the article' }, status: :not_found
    end
  end

  private

  def find_article
   @article = Article.find_by_id!(params[:id])
   rescue ActiveRecord::RecordNotFound
     render json: { errors: 'Article not found' }, status: :not_found
 end

  def article_params
    params.require(:article).permit(:title, :description, :user_id, :created_at, :updated_at)
  end
end
