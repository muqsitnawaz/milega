class ProductsController < ApplicationController
  before_filter :authenticate_user!, except: [ :show ]
  before_filter :ensure_company_owner_or_admin!, except: [ :show ]

  def show  # public method
    @product = Product.find_by_id(params[:id])
    @company = Company.find_by_id(@product.company_id)

    @products_related = Product.where(pdetailcategory: @product.pdetailcategory).limit(5).reject { |r| r == @product }

    @num_images = get_num_images(@product)

    @order_item = current_order.order_items.new
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
    @cat_hash = get_categories_detail
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
    @cat_hash = get_categories_detail
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
    pms = params.require(:product).permit(:pname, :pdescrip, 
      :psize_xs, :psize_s, :psize_m, :psize_l, :psize_xl,
      :pprice, :pstock, :pcategory, :psubcategory, :pdetailcategory, 
      :p_c1_code, :p_c1_image1, :p_c1_image2, :p_c1_image3,
      :p_c2_code, :p_c2_image1, :p_c2_image2, :p_c2_image3,
      :p_c3_code, :p_c3_image1, :p_c3_image2, :p_c3_image3,
      :p_c4_code, :p_c4_image1, :p_c4_image2, :p_c4_image3,
      :p_c5_code, :p_c5_image1, :p_c5_image2, :p_c5_image3,
      :p_c6_code, :p_c6_image1, :p_c6_image2, :p_c6_image3
      )
    if pms[:company_id].nil?
      pms[:company_id] = company.id
    end

    return pms
  end

  def redirect_with_access_denied
    flash[:notice] = "ACCESS DENIED"
    redirect_to companies_path
  end

  def get_num_images(product)
    num_images = 1
    if product.p_c1_image2_url.to_s != ""
      num_images += 1
    end
    if product.p_c1_image3_url.to_s != ""
      num_images += 1
    end

    return num_images
  end
end
