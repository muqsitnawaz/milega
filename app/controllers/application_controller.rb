class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order
  before_action :configure_permitted_parameters, if: :devise_controller?

  # method for shopping cart
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      order = Order.new
      order.order_status = "new"
      return order
    end
  end

  # method for ensuring 'admin'
  def ensure_admin!
    unless current_user.user_role == 1
      flash[:notice] = "Not sufficient permission!"
      redirect_to root_path

      return false
    end
  end

  # methods for company/products
  def ensure_company_owner_or_admin!
    unless (current_user.user_role == 1) || (current_user.user_role == 2)
      flash[:notice] = "Not sufficient permission!"
      redirect_to root_path

      return false
    end
  end

  def user_owns_company?(company)
    if (company.user_id == current_user.id || current_user.user_role == 1)
      true
    else
      false
    end
  end

  # simple methods
  def is_admin?
    return (current_user.user_role == 1)
  end

  def is_company_owner?
    return (current_user.user_role == 2)
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:uname, :email, :password, :user_role, :uphone, :uaddress) }
  end
end
