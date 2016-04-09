class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  def buy_now
    param = order_item_params
    param[:quantity] = 1
    puts param
    @order = current_order
    @order_item = @order.order_items.new(param)
    @order.save!
    redirect_to new_shipping_detail_path
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end