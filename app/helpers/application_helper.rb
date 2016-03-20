module ApplicationHelper
  def is_admin?
    return (current_user.user_role == 1)
  end

  def is_company_owner?
    return (current_user.user_role == 2)
  end
end