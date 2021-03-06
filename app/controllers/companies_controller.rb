class CompaniesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_company_owner_or_admin!

  def index
    @sort_by = params[:sort_by]

    if @sort_by.nil?
      @sort_by = :cname
    end

    if is_admin?
      @companies = Company.all.order(@sort_by)
    else
      @companies = Company.where(user_id: current_user.id).order(@sort_by)
    end

    @companies = @companies.paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @sort_by = params[:sort_by]

    if @sort_by.nil?
      @sort_by = :pname
    end

    @company = Company.find_by_id(params[:id])

    if user_owns_company?(@company)
      @products = @company.products.order(@sort_by).paginate(:page => params[:page], :per_page => 8)
    else
      redirect_with_access_denied
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new company_params

    if @company.save
      redirect_to companies_path
    else
      render 'companies/new'
    end
  end

  def edit
    @company = Company.find_by_id(params[:id])

    if !user_owns_company?(@company)
      redirect_with_access_denied
    end
  end

  def update
    @company = Company.find_by_id(params[:id])

    if user_owns_company?(@company)
      if @company.update(company_params)
        redirect_to companies_path
      else
        render 'edit'
      end
    else
      redirect_with_access_denied
    end
  end

  def destroy
    @company = Company.find_by_id(params[:id])

    if user_owns_company?(@company)
      @company.destroy
      redirect_to companies_path
    else
      redirect_with_access_denied
    end
  end

private
  def company_params
    pms = params.require(:company).permit(:cname, :ctype, :caddress, :cemail, :cphone_official, :cphone_personal, :clogo)
    pms[:user_id] = current_user.id
    return pms
  end

  def redirect_with_access_denied
    flash[:notice] = "ACCESS DENIED"
    redirect_to companies_path
  end
end
