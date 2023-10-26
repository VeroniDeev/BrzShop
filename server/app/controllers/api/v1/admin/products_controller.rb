class Api::V1::Admin::ProductsController < ApplicationController
  def index
    products = Product.page(params[:page]).per(params[:per_page])
    render json: {"status": "success", "data": products.as_json(except: :id), "page": params[:page]}
  end
  def show
    deslug = SlugConverter.deslugify(params[:slug])
    product = Product.find_by(name: deslug)
    if product
      render json: { "status": "success", "data": product.as_json(except: :id) }, status: :ok
    else
      render json: { "status": "failed" }, status: :not_found
    end
  end
  def create
    category = Category.find_by(name: params[:category])
    @product = Product.new(user_params.merge(category_id: category.id))

    if @product.save
      render json: {"status": "success", "data": @product.as_json(except: [:id, :category_id]).merge("category": category.name)}, status: :created

    else
      render json: {"status": "failed", "error": @product.errors}, status: :unprocessable_entity
    end
  end
  def update
    deslug = SlugConverter.deslugify(params[:slug])
    product = Product.find_by(name: deslug)
    all_params = user_params

    if params[:category]
      category = Category.find_by(name: params[:category])
      all_params.merge(category_id: category.id)
    end

    if product
      product.update(all_params)
      render json: {"status": "success", "data": product.as_json(except: :id)}, status: :ok
    else
      render json: {"status": "failed"}, status: :unprocessable_entity
    end
  end
  def destroy
    deslug = SlugConverter.deslugify(params[:slug])
    product = Product.find_by(name: deslug)

    if product
      product.destroy
      render json: {"status": "success"}
    else
      render json: {"status": "failed"}
    end
  end
  def user_params
    params.permit(:name, :description, :price, :picture, :stock)
  end
end
