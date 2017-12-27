class V1::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  def index
    products = Product.all.order(:id => :asc)
    if params[:name_search]
      products = products.where("name ILIKE ?", "%#{params[:name_search]}%")
    end
    if params[:price_sort]
      products = Product.all.order(:price => :asc)
    end
    if params[:category_id]
      category = Category.find_by(id: params["category_id"])
      products = category.products 
    end
    render json: products.as_json
  end
  def create  
    product = Product.new(
      name:params["name"],
      length:params["length"],
      color:params["color"],
      price:params["price"], 
      # image:params["image"], 
      description:params["description"],
      # user_id: current_user.id
      # active: params["active"]
      supplier_id: 1
      )
    if product.save
      render json: {status: "Order created successfully"}, status: :created 
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
    product.name = params["name"] || product.name
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
