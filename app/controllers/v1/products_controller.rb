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
    product.save
    render json: product.as_json
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
    product.save
    render json: product.as_json
  end 
  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: {message: "The item has been removed!"}
  end
  # def short_shirt_method
  #   product = Product.first 
  #   render json: product.as_json
  # end 
  # def long_shirt_method
  #   product = Product.second 
  #   render json: product.as_json
  # end 
  # def short_pant_method
  #   product = Product.third
  #   render json: product.as_json
  # end 
  # def long_pant_method
  #   product = Product.fourth
  #   render json: product.as_json
  # end 
end
