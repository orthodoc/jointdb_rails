class CategoriesController < ApplicationController
  include UsersHelper
  before_filter :find_category, :only => [:show, :edit, :update, :destroy]

  def new
    if admin?
      @category = Category.new
    else
      admin_alert
      redirect_to root_path
    end
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Thank you for the new submission"
      redirect_to @category
    else
      flash[:alert] = "Category has not been created"
      render :action => "new"
    end
  end

  def show
    @category = Category.find(params[:id])
    @companies = @category.companies.text_search(params[:query]).page(params[:page]).per_page(20)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def index
    if admin?
      @categories = Category.all
    else
      admin_alert
      redirect_to root_path
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category has been updated"
      redirect_to @category
    else
      flash[:alert] = "Category has not been updated"
      render :action => "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category has been deleted"
    redirect_to categories_path
  end

  private
    
    def find_category
      if admin?
        @category = Category.find(params[:id])
      else
        admin_alert
        redirect_to root_path
      end
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The category you were looking for does not exist"
      redirect_to categories_path
    end
end
