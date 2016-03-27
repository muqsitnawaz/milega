class PagesController < ApplicationController
  before_filter :authenticate_user!, only: [ :admin, :get_excel_file ]
  before_filter :ensure_admin!, only: [ :admin, :get_excel_file ]

  def welcome
    cat_hash = get_categories_detail
    @men_cats = cat_hash["clothing"]["men"];
    @women_cats = cat_hash["clothing"]["women"];
    @electronics_cats = cat_hash["electronics"];
    @personal_care_cats = cat_hash["personal care"];
  end

  def search
    query = params[:query]
    comp_ids = company_id query
    per_page = 9

    puts "Comp ids: #{comp_ids}"

    if comp_ids.empty?
      @products = Product.where("pname iLIKE ?" , "%#{query}%").paginate(:page => params[:page], :per_page => per_page)
    else
      @products = Product.where(:company_id => comp_ids).paginate(:page => params[:page], :per_page => per_page)
    end
    @order_item = current_order.order_items.new
  end

  def admin
    @orders = Order.where.not(order_status: "new")
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

  def excel
    # shows view
  end

  def excel_download
    useremail = params[:demail]
    userpass = params[:dpass]
    userpass_encryp = User.new(:password => userpass).encrypted_password
    type = params[:dtype]
    date_start = get_start_date(params)
    date_end = get_end_date(params)

    # Format: ord_date, order_status, sub_total, customer_name, customer_gender, customer_email, customer_phone, customer_address, total_products, products_id_list

    if (useremail.length == 0 || userpass.length == 0 || type.length == 0 || date_start.nil? || date_end.nil?)
      
      deny_download # denying download
    else
      user = User.find_by_email(useremail)
      
      if user.nil? || (user.user_role != 1) || !user.valid_password?(userpass)
        deny_download # denying download
      else
        date_today = Time.now.in_time_zone('Islamabad')
        orders = Order.where("order_status != ?", "new")
        data = ""
        data += "Order Received, Order Status, Sub Total, Customer Name, Customer Gender, Customer Email, Customer Address, Customer Phone\n"

        # retrieving orders
        orders.each do |ord|
          ship_detail = ord.shipping_detail

          if !ship_detail.nil?
            data += "#{ord.created_at.in_time_zone('Islamabad')}, #{ord.order_status}, #{ord.subtotal}, #{ship_detail.sname.gsub(/,/, ' ')}, #{ship_detail.sgender}, #{ship_detail.semail}, #{ship_detail.saddress.gsub(/,/, ' ')}, #{ship_detail.sphone}\n"
          end
        end

        fname = ('order_details_'+date_today.to_s+'.csv')
        send_data data, filename: fname
      end
      # puts user.uname
    end
  end

private
  def company_id(comp)
    c = Company.where("cname iLIKE ?", "%#{comp}%")
    return c.map {|c| c.id}
  end

  def get_start_date(pms)
    date = pms[:date]
    date_start = Date.new date["dtime_start(1i)"].to_i, date["dtime_start(2i)"].to_i, date["dtime_start(3i)"].to_i
  end

  def get_end_date(pms)
    date = pms[:date]
    date_end = Date.new date["dtime_end(1i)"].to_i, date["dtime_end(2i)"].to_i, date["dtime_end(3i)"].to_i
  end

  def deny_download
    send_data "Incorrect details and/or Permission denied!", filename: 'error.txt'
  end
end