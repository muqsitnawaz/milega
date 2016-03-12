class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find_by_id(params[:id])
    @products = @company.products.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create! company_params

    redirect_to companies_path
  end

  def edit
    @company = Company.find_by_id(params[:id])
  end

  def update
    @company = Company.find_by_id(params[:id])
    @company.update_attributes! company_params

    redirect_to companies_path
  end

  def destroy
    @company = Company.find_by_id(params[:id])
    @company.destroy

    redirect_to companies_path
  end

  private
  def company_params
    params.require(:company).permit(:cname, :ctype)
  end
end
