class ProductsController < ApplicationController
  before_filter :authenticate_user!, except: [ :show ]
  before_filter :ensure_company_owner_or_admin!, except: [ :show ]

  def show  # public method
    @product = Product.find_by_id(params[:id])
    @company = Company.find_by_id(@product.company_id)
  end

  def new
    @cat_hash = get_categories_detail
    @company = Company.find_by_id(params[:company_id])

    if user_owns_company?(@company) && !is_admin?
      @product = Product.new
    else
      redirect_with_access_denied
    end
  end

  def create
    @company = Company.find_by_id(params[:company_id])

    if user_owns_company?(@company) && !is_admin?
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
    @cat_hash = get_categories_detail
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

  def sub_categories
    cat_hash = get_categories_detail

    if request.xhr?
      render :json => {
        :sub_categories => cat_hash[params[:category]].keys
      }
    end
  end

  def detail_categories
    cat_hash = get_categories_detail
    temp = cat_hash[params[:category]]

    if request.xhr?
      render :json => {
        :detail_categories => temp[params[:sub_category]]
      }
    end
  end

private
  def product_params(company)
    pms = params.require(:product).permit(:pname, :pdescrip, :psize, :pprice, :pstock, :pcategory, :psubcategory, :pdetailcategory, :pimage1, :pimage2, :pimage3)
    if pms[:company_id].nil?
      pms[:company_id] = company.id
    end

    return pms
  end

  def redirect_with_access_denied
    flash[:notice] = "ACCESS DENIED"
    redirect_to companies_path
  end

  def get_categories_detail
    categories = Hash[
      "clothing" => Hash[
        "men" => ["t-shirts", "shirts", "jeans", "kurta and shalwar kameez", "formal wear", "winter wear"], 
        "women" => ["tops", "t-shirts", "jeans", "pants and tights", "dresses and skirts", "formal wear", "winter wear"],
        "kids" => ["t-shirts", "shirts", "jeans"]
      ],
      
      "electronics" => Hash[
        "laptops" => ["macbook", "window"], 
        "smartphones" => ["iphone", "android"],
        "tablets" => ["ipad", "android"]
      ],
      
      "personal care" => Hash[
        "men" => ["deodorant", "hair products", "shaving", "skin care"],
        "women" => ["deodorant", "hair products", "skin care"]
      ]
    ]

    return categories
  end
end
