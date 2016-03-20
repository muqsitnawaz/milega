class ShippingDetailsController < ApplicationController
  def new
    if user_signed_in?
      # puts "here"
      current_order.update_attributes(:user_id => current_user.id)
    end

    @ship_detail = ShippingDetail.new
  end

  def create
    @ship_detail = ShippingDetail.new ship_detail_params
    @order = Order.find_by_id(@ship_detail.order_id)

    if !@order.nil?
      @order.update_attributes!(order_status: "confirmed");
    end

    if @ship_detail.save
        flash[:notice] = "Your order has been received"

        session.delete(:order_id)
        redirect_to root_path
    else
        render 'new'
    end
  end

private
  def ship_detail_params
    params.require(:shipping_detail).permit(:order_id,:sname,:sphone,:saddress)
  end
end
