class V1::CartedProductsController < ApplicationController
  def index 
    # carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    carted_products = current_user.carted_products.where(status: "carted")
    render json: carted_products.as_json 
  end
  def create 
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil
      )
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: {errors: carted_product.errors.full_messages}, status: :bad_request
    end
  end
  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save 
    render json: {status: "Carted product successfully removed!"}
  end
end
