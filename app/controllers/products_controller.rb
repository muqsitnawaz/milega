class ProductsController < ApplicationController
  def show
    @product = Product.find_by_id(params[:id])
  end

  def new
    @company = Company.find_by_id(params[:company_id])
    @product = Product.new
  end

  def create
    @company = Company.find_by_id(params[:company_id])

    param = product_params
    params[:company_id] = @company.id
    @product = @company.products.create! product_params

    redirect_to company_path(@company.id)
  end

  def edit
    @company = Company.find_by_id(params[:company_id])
    @product = Product.find_by_id(params[:id])
  end

  def update
    @product = Product.find_by_id(params[:id])
    @product.update_attributes! product_params

    redirect_to company_path(params[:company_id])
  end

  def destroy
    @product = Product.find_by_id(params[:id])
    @product.destroy

    redirect_to company_path(params[:company_id])
  end

  private
  def product_params
    params.require(:product).permit(:pname, :pdescrip, :pprice, :pcategory, :psubcategory)
  end
end
