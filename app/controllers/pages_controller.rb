class PagesController < ApplicationController
  def welcome
    # does nothing
  end

  def search
    query = params[:query]
    comp_ids = company_id query
    per_page = 9

    puts "Comp ids: #{comp_ids}"

    if comp_ids.empty?
      @products = Product.where("pname LIKE ?" , "%#{query}%").paginate(:page => params[:page], :per_page => per_page)
    else
      @products = Product.where(:company_id => comp_ids).paginate(:page => params[:page], :per_page => per_page)
    end
    @order_item = current_order.order_items.new
  end

  def admin
    @orders = Order.all
  end

  def order_details
    ship_detail_id = params[:shipping_detail_id]
    ship_detail = ShippingDetail.find_by_id(ship_detail_id)
    orders = OrderItem.where(order_id: ship_detail.order_id)

    if !ship_detail.nil?
      if request.xhr?
        render :json => {
          :status => "success",
          :sname => ship_detail.sname,
          :sphone => ship_detail.sphone,
          :orders => orders.as_json
        }
      end
    else
      if request.xhr?
        render :json => {
          :status => "error"
        }
      end
    end
  end

  def company_id(comp)
    c = Company.where("cname LIKE ?", "%#{comp}%")
    return c.map {|c| c.id}
  end
end