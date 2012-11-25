module PagesHelper
  def page_not_found_alert
    flash[:alert] = "The page you were looking for could not be found!"
  end
end
