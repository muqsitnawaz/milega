class OrdersController < ApplicationController
  def update
    @order = Order.find_by_id(params[:id])

    if @order.update(order_status: params[:order_status])
      if request.xhr?
        render :json => {
          :message => "success"
        }
      end
    else
      if request.xhr?
        render :json => {
          :message => "fail"
        }
      end
    end
  end
end