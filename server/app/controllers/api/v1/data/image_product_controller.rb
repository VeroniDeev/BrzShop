class Api::V1::Data::ImageProductController < ApplicationController
  def show
    deslug = SlugConverter.deslugify(params[:slug])
    file_name = params[:filename]
    product = Product.find_by(name: deslug)

    if product
      send_file "#{product.picture}/#{file_name}"
    end
  end
end
