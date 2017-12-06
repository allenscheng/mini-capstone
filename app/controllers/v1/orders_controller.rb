class V1::OrdersController < ApplicationController
  before_action :authenticate_user
  #above, to prohibit guests (non-logged in users) to view or create orders. (Note that the Knock gem already created the authenticate_user method for you!)
  def index 
    orders = current_user.orders 
    render json: orders.as_json 
  end
  def create 
    carted_products = current_user.carted_products.where(status: "carted")
    subtotal = 0 
    carted_products.each do |carted_product|
      subtotal = subtotal + carted_product.quantity * carted_product.product.price 
    end 
    tax = subtotal * 0.09
    total = subtotal + tax


    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    order.save
    carted_products.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = order.id 
      carted_product.save 
    end
    render json: order.as_json 
  end
end
