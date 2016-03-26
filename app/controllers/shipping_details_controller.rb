class ShippingDetailsController < ApplicationController
  before_filter :order_not_empty!

  def new
    if user_signed_in?
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
        Usermailer.orderreceived_email(@ship_detail).deliver

        session.delete(:order_id)
        redirect_to root_path
    else
        render 'new'
    end
  end

private
  def ship_detail_params
    pms = params.require(:shipping_detail).permit(:order_id, :sname, :semail, :sphone, :saddress, :sstate)
    pms[:sgender] = params[:sgender]
    return pms
  end

  def order_not_empty!
    if current_order.order_items.size == 0 
      flash[:notice] = "You need to make a purchase first!"
      redirect_to root_path

      return false
    end
  end
end
