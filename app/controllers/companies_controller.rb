class CompaniesController < ApplicationController
  before_filter :find_categories
  before_filter :find_company, :only => [:show, :edit, :update, :destroy]

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
  end

  def index
    @companies = Company.all
  end

  def edit
    @company = Company.find(params[:id])
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

  private
    def find_categories
      @categories = Category.all
    end

    def find_company
      @company = Company.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The company you were looking for could not be found"
      redirect_to companies_path
    end
end
