class Api::V1::Admin::SigninController < ApplicationController
  def create
    # if params[:token] && CheckPerm.has_perm(params[:token])
    #   return render json: {"state": "success"}, status: :ok
    # end

    user = User.find_by(mail: params[:mail])

    if user && user.authenticate(params[:password]) && (user.role == "admin" || user.role == "owner")
      token = TokenManager.encode(user_id: user.id, role: user.role)
      return render json: {"state": "success", "token": token}, status: :ok
    else
      return render json: {"state": "failed"}, status: :unauthorized
    end
  end
end
