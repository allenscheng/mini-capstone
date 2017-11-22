class V1::ProductsController < ApplicationController
  def index
    product = Product.all
    render json: product.as_json
  end
  def create 
    product = Product.new(
      clothe_type: params["clothe_type"],
      length: params["length"],
      color: params["color"],
      price: params["price"], 
      image: params["image"], 
      description: params["description"],
      # active: params["active"]
      )
    if product.save
      render json: product.as_json
    else 
      render json: {errors: product.errors.full_messages}, status: :bad_request
    end
  end
  def show
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end
  def update
    product = Product.find_by(id: params["id"])
    product.clothe_type = params["clothe_type"] || product.clothe_type
    product.length = params["length"] || product.length
    product.color = params["color"] || product.color
    product.price = params["price"] || product.price
    product.image = params["image"] || product.image
    product.description = params["description"] || product.description
    product.active = params["active"] || product.active
    if product.save
      render json: product.as_json
    else 
      render json: {errors: product.errors.full_messages}, status: :bad_request
    end
    render json: product.as_json
  end 
  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: {message: "The item has been removed!"}
  end
end
