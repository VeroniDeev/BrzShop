class Api::V1::Admin::ImageProductController < ApplicationController
  def create
    product_name = params[:product]
    product = Product.find_by(name: product_name)

    if product
      uploaded_file = params[:image]
      if product.picture
        image_path = product.picture
      else
        image_path = "image/#{product.name}"
        product.update(picture: image_path)
        Dir.mkdir(image_path) unless File.directory?(image_path)
      end

      if uploaded_file
        extension = uploaded_file.original_filename.split(".")[-1]
        file_count = Dir.glob(File.join(image_path, "*"))
        File.open("#{image_path}/image#{file_count.length + 1}.#{extension}", 'wb') do |fichier|
          fichier.write(uploaded_file.read)
        end
      end
      render json: {"status": "success"}, status: :ok
    end
  end
  def destroy
    deslug = SlugConverter.deslugify(params[:slug])
    file_name = params[:filename]
    product = Product.find_by(name: deslug)

    if product
      file_path = "#{product.picture}/#{file_name}"
      FileUtils.remove_rf(file_path)
      if !File.exist?(file_path)
        render json: {"status": "success"}, status: :ok
      else
        render json: {"status": "failed"}, status: :unprocessable_entity
      end
    end
  end
end
