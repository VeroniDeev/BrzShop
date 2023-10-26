class Api::V1::Admin::CouponsController < ApplicationController
  def index
    coupons = Coupon.page(params[:page]).per(params[:per_page])
    render json: {"status": "success", "data": coupons.as_json(except: :id), "page": params[:page]}
  end
  def show
    deslug = SlugConverter.deslugify(params[:slug])
    coupon = Coupon.find_by(code: deslug)
    if coupon
      render json: { "status": "success", "data": coupon.as_json(except: :id) }, status: :ok
    else
      render json: { "status": "failed" }, status: :not_found
    end
  end
  def create
    category = Category.find_by(name: params[:category])
    @coupon = Coupon.new(user_params.merge(category_id: category.id))

    if @coupon.save
      render json: {"status": "success", "data": @coupon.as_json(except: [:id, :category_id]).merge("category": category.name)}, status: :created

    else
      render json: {"status": "failed", "error": @coupon.errors}, status: :unprocessable_entity
    end
  end
  def update
    deslug = SlugConverter.deslugify(params[:slug])
    coupon = Coupon.find_by(code: deslug)
    all_params = user_params

    if params[:category]
      category = Category.find_by(code: params[:category])
      all_params.merge(category_id: category.id)
    end

    if coupon
      coupon.update(all_params)
      render json: {"status": "success", "data": coupon.as_json(except: :id)}, status: :ok
    else
      render json: {"status": "failed"}, status: :unprocessable_entity
    end
  end
  def destroy
    deslug = SlugConverter.deslugify(params[:slug])
    coupon = Coupon.find_by(code: deslug)

    if coupon
      coupon.destroy
      render json: {"status": "success"}
    else
      render json: {"status": "failed"}
    end
  end
  def user_params
    params.permit(:code, :reduct)
  end
end
