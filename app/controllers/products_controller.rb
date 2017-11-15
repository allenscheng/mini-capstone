class ProductsController < ApplicationController
  def short_shirt_method
    product = Product.first 
    render json: product.as_json
  end 
  def long_shirt_method
    product = Product.second 
    render json: product.as_json
  end 
  def short_pant_method
    product = Product.third
    render json: product.as_json
  end 
  def long_pant_method
    product = Product.fourth
    render json: product.as_json
  end 
end
