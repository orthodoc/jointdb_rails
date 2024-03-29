class CompaniesController < ApplicationController
  include CompaniesHelper
  include UsersHelper
  before_filter :find_categories
  before_filter :find_company, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => :destroy

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      flash[:notice] = "Thank you for the new submission"
      redirect_to @company
    else
      flash[:alert] = "Company has not been created"
      render :action => "new"
    end
  end

  def show
    @company = Company.find(params[:id])
    @products = @company.products.text_search(params[:query]).page(params[:page]).per_page(20)
  end

  def index
    @companies = Company.text_search(params[:query]).page(params[:page]).per_page(20)
  end

  def edit
    if user_signed_in?
      @company = Company.find(params[:id])
    else
      flash[:alert] = "You have to log in to update the company"
      redirect_to new_user_session_path 
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      flash[:notice] = "Company has been updated."
      redirect_to @company
    else
      flash[:alert] = "Company has not been updated"
      render :action => "edit"
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "Company has been deleted"
    redirect_to companies_path
  end

  private
    def find_categories
      @categories = Category.all
    end

    def find_company
      @company = Company.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      company_not_found_alert
      redirect_to companies_path
    end
end
