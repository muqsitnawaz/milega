class PagesController < ApplicationController
  def welcome
    
  end

  def search
    query = params[:query]
    comp_ids = company_id query

    puts "Comp ids: #{comp_ids}"

    if comp_ids.empty?
        @products = Product.where("pname LIKE ?" , "%#{query}%")
    else
        @products = Product.where(:company_id => comp_ids)
    end
  end

  def company_id(comp)
    c = Company.where("cname LIKE ?", "%#{comp}%")
    return c.map {|c| c.id}
  end
end