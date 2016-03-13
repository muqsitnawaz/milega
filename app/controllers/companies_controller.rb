class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find_by_id(params[:id])
    @products = @company.products.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new company_params

    if @company.save
        redirect_to companies_path
    else
        render 'new'
    end
  end

  def edit
    @company = Company.find_by_id(params[:id])
  end

  def update
    @company = Company.find_by_id(params[:id])

    if @company.update(company_params)
        redirect_to companies_path
    else
        render 'edit'
    end
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
