module UsersHelper
  def admin?
    user_signed_in? and current_user.has_role? :admin
  end

  def admin_alert
    flash[:alert] = "You have to log in as admin to perform this action"
  end

  def not_admin_action
    redirect_to root_path
    admin_alert
  end
end
