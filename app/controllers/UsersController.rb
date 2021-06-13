class UsersController < ApiController
  before_action :find_user

  def show
     render json: @user.articles.order('created_at'), status: :ok
  end

  private

  def find_user
   @user = User.find_by_id!(params[:id])
   rescue ActiveRecord::RecordNotFound
     render json: { errors: 'User not found' }, status: :not_found
 end
end
