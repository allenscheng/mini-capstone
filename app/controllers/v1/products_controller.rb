class V1::ProductsController < ApplicationController
  def index
    product = Product.all
    render json: product.as_json
  end
  def create 
    product = Product.new(
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
    clothes_id = params["id"]
    product = Product.find_by(id: clothes_id)
    render json: product.as_json
  end
  def update
    clothes_id = params["id"] 
    product = Product.find_by(id: clothes_id)
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
    clothes_id = params["id"]
    product = Product.find_by(id: clothes_id)
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
