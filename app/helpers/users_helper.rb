module UsersHelper
  def admin?
    user_signed_in? and current_user.has_role? :admin
  end

  def admin_alert
    flash[:alert] = "You have to log in as admin to perform this action"
  end
end
