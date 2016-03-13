class PagesController < ApplicationController
  def welcome
    
  end

  def search
    query = params[:query]
    comp_ids = company_id query
    per_page = 10

    puts "Comp ids: #{comp_ids}"

    if comp_ids.empty?
        @products = Product.where("pname LIKE ?" , "%#{query}%").paginate(:page => params[:page], :per_page => per_page)
    else
        @products = Product.where(:company_id => comp_ids).paginate(:page => params[:page], :per_page => per_page)
    end
  end

  def company_id(comp)
    c = Company.where("cname LIKE ?", "%#{comp}%")
    return c.map {|c| c.id}
  end
end