class Api::V1::Data::ProductsController < ApplicationController
  def index
    category_name = params[:category]
    category = Category.find_by(name: category_name)
    if category
      products = Product.where(category_id: category.id).page(params[:page]).per(params[:per_page])
    end
    if products
      render json: {"status": "success", "data": products.as_json(except: [:id, :category_id]), "page": params[:page], "id": category.id}, status: :ok
    else
      render json: {"status": "failed"}, status: :not_found
    end
  end
  def show
    deslug = SlugConverter.deslugify(params[:slug])
    product = Product.find_by(name: deslug)

    if product
      category = Category.find(product.category_id)
      data = product.as_json(except: [:id, :category_id]).merge(category: category.name)
      render json: { "status": "success", "data": data }, status: :ok
    else
      render json: { "status": "failed" }, status: :not_found
    end
  end
end
