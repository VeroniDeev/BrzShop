class Api::V1::SignupController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      token = TokenManager.encode(user_id: @user.id)
      render json: {"state": "success", "data": @user.as_json(only: [:name, :surname, :phone, :mail, :country, :adresse, :postal]), "token": token}, status: :created
    else
      render json: {"state": "failed", "reason": @user.errors}, status: :unprocessable_entity
    end
  end
  def user_params
    params.permit(:name, :surname, :phone, :mail, :country, :adresse, :postal, :password)
  end
end
