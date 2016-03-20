class ProductsController < ApplicationController
  before_filter :authenticate_user!, except: [ :show ]
  before_filter :ensure_company_owner_or_admin!, except: [ :show ]

  def show  # public method
    @product = Product.find_by_id(params[:id])
    @company = Company.find_by_id(@product.company_id)
  end

  def new
    @company = Company.find_by_id(params[:company_id])

    if user_owns_company?(@company)
      @product = Product.new
    else
      redirect_with_access_denied
    end
  end

  def create
    @company = Company.find_by_id(params[:company_id])

    if user_owns_company?(@company)
      @product = @company.products.new product_params(@company)

      if @product.save
        redirect_to company_path(@company.id)
      else
        render 'new'
      end
    else
      redirect_with_access_denied
    end
  end

  def edit
    @company = Company.find_by_id(params[:company_id])

    if user_owns_company?(@company)
      @product = Product.find_by_id(params[:id])
    else
      redirect_with_access_denied
    end
  end

  def update
    @company = Company.find_by_id(params[:company_id])

    if user_owns_company?(@company)
      @product = Product.find_by_id(params[:id])
      
      if @product.update product_params(@company)
        redirect_to company_path(@company.id)
      else
        render 'edit'
      end
    else
      redirect_with_access_denied
    end
  end

  def destroy
    @company = Company.find_by_id(params[:company_id])

    if user_owns_company?(@company)
      @product = Product.find_by_id(params[:id])
      @product.destroy

      redirect_to company_path(@company.id)
    else
      redirect_with_access_denied
    end
  end

private
  def product_params(company)
    pms = params.require(:product).permit(:pname, :pdescrip, :pprice, :pcategory, :psubcategory)
    if pms[:company_id].nil?
      pms[:company_id] = company.id
    end

    return pms
  end

  def redirect_with_access_denied
    flash[:notice] = "ACCESS DENIED"
    redirect_to companies_path
  end
end
