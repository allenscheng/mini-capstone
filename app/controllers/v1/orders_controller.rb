class V1::OrdersController < ApplicationController
  before_action :authenticate_user
  #above, to prohibit guests (non-logged in users) to view or create orders. (Note that the Knock gem already created the authenticate_user method for you!)
  def index 
    orders = current_user.orders 
    render json: orders.as_json 
  end
  def create 
    product = Product.find_by(id: params["product_id"])
    calculated_subtotal = product.price * params["quantity"].to_f
    calculated_tax = calculated_subtotal * 0.09
    total = calculated_subtotal + calculated_tax

    order = Order.new(
      product_id: params["product_id"], 
      quantity: params["quantity"],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: total, 
      user_id: current_user.id
      )

    
    if order.save 
      render json: order.as_json
    else
      render json: {errors: order.errors.full_messages}


    end
  end
end
