class Api::V1::Admin::CategorysController < ApplicationController
  def index
    categorys = Category.all
    render json: {"status": "success", "data": categorys.as_json(except: :id)}
  end
  def show
    deslug = SlugConverter.deslugify(params[:slug])
    category = Category.find_by(name: deslug)
    if category
      render json: { "status": "success", "data": category.as_json(except: :id) }, status: :ok
    else
      render json: { "status": "failed", "error": category.error }, status: :not_found
    end
  end
  def create
    @category = Category.new(user_params)

    if @category.save
      render json: {"status": "success", "data": @category.as_json(except: :id)}, status: :created

    else
      render json: {"status": "failed", "error": @category.errors}, status: :unprocessable_entity
    end
  end
  def update
    deslug = SlugConverter.deslugify(params[:slug])
    category = Category.find_by(name: deslug)

    if category
      category.update(user_params)
      render json: {"status": "success", "data": category.as_json(except: :id)}, status: :ok
    else
      render json: {"status": "failed"}, status: :unprocessable_entity
    end
  end
  def destroy
    deslug = SlugConverter.deslugify(params[:slug])
    category = Category.find_by(name: deslug)

    if category
      category.destroy
      render json: {"status": "success"}
    else
      render json: {"status": "failed"}
    end
  end
  def user_params
    params.permit(:name, :description)
  end
end
