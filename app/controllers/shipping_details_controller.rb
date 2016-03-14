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

    if @ship_detail.save
        flash[:notice] = "Your order has been received"

        reset_session
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
