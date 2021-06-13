class Api::V1::AuthenticationController < ApiController
  skip_before_action :authenticate_user!, only: [:create]
  def create
    @user = User.find_by_email(params[:email])
    if @user&.valid_password?(params[:password])
      token = JsonWebToken.encode(sub: @user.id)
      render json: { token: token,
                     email: @user.email }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def fetch
    render json: current_user
  end
end
