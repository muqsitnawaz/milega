class PagesController < ApplicationController
  def welcome
    
  end

  def search
    @products = Product.where("pname LIKE ?" , "%#{params[:query]}%")
  end
end