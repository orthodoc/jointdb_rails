class PagesController < ApplicationController
  include UsersHelper

  def index
    if admin?
      @pages = Page.all
    else
      not_admin_action
    end
  end

  def show
    @page = Page.find_by_permalink!(params[:id])
  end

  def edit
    if admin?
      @page = Page.find_by_permalink!(params[:id])
    else
      not_admin_action
    end
  end

  def new
    if admin?
      @page = Page.new
    else
      not_admin_action
    end
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Page was successfully created"
      redirect_to @page
    else
      flash[:alert] = "Page has not been created"
      render action: "new"
    end
  end

  def update
    @page = Page.find_by_permalink!(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Page was successfully updated"
      redirect_to @page
    else
      flash[:alert] = "Page has not been updated"
      render action: "edit"
    end
  end

  def destroy
    if admin?
      @page = Page.find_by_permalink!(params[:id])
      @page.destroy
      flash[:notice] = "#{@page.name} was deleted"
      redirect_to pages_path
    else
      not_admin_action
    end
  end

end
