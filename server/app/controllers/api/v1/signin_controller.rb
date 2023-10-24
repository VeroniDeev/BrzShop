class Api::V1::SigninController < ApplicationController
  def create
    user = User.find_by(mail: params[:mail])

    if user && user.authenticate(params[:password])
      token = TokenManager.encode(user_id: user.id)
      render json: {"state": "success", "token": token}, status: :ok
    else
      render json: {"state": "failed"}, status: :unauthorized
    end
  end
end
