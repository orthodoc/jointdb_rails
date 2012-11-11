module CompaniesHelper
  def company_not_found_alert
    flash[:alert] = "The company you were looking for could not be found!"
  end
end
