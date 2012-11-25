class ProductsController < ApplicationController
  include ProductsHelper
  before_filter :find_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Thank you for the new submission"
      redirect_to @product
    else
      flash[:alert] = "Product has not been created"
      render action: "new"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    if user_signed_in?
      @product = Product.find(params[:id])
    else
      flash[:alert] = "You have to log in to update the product"
      redirect_to new_user_session_path
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Product has been updated"
      redirect_to @product
    else
      flash[:alert] = "Product has not been updated"
      render action: "edit"
    end
  end

  def index
    @products = Product.text_search(params[:query]).page(params[:page]).per_page(20)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product has been deleted"
    redirect_to products_path
  end

  private
    def find_product
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      product_not_found_alert
      redirect_to products_path
    end
end
