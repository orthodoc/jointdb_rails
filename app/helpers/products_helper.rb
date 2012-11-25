module ProductsHelper
  def product_not_found_alert
    flash[:alert] = "The product you were looking for could not be found!"
  end
end
