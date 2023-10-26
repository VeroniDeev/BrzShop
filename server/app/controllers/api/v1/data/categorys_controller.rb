class Api::V1::Data::CategorysController < ApplicationController
  def index
    categorys = Category.page(params[:page]).per(params[:per_page])
    if categorys
      render json: {"status": "success", "data": categorys.as_json(except: :id), "page": params[:page]}, status: :ok
    else
      render json: {"status": "failed"}, status: :not_found
    end
  end
end
