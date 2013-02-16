require 'spec_helper'

describe PagesController do

  before (:each) do
    @page = FactoryGirl.create(:page)
    @user = FactoryGirl.create(:user)
  end

  def valid_attributes
    {:name => "About us", :permalink => "about", :content => "We are like this only!"}
  end

  def valid_update_attributes
    { name: "Contact us", permalink: "contact", content: "were are like this only"}
  end

  def invalid_attributes
    { name: "", permalink: ""}
  end
  
  context "for an admin" do
    before (:each) do
      @user.add_role :admin
      sign_in @user
      get :index
    end

    it { should route(:get, pages_path).to(action: :index) }
    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
    it { should assign_to(:pages).with([@page]) }

  end

  context "for a user" do
    before (:each) do
      sign_out @user
      get :index
    end

    it { should redirect_to(root_path) }
    it { should_not render_template(:index) }
    it { should set_the_flash[:alert].to("You have to log in as admin to perform this action") }
    it { should_not assign_to(:pages).with([@page]) }
  end

  context "for a user" do
    before (:each) do
      get :show, id: @page.permalink
    end

    it { should respond_with(:success) }
    it { should assign_to(:page).with(@page) }
    it { should render_template(:show) }
    it { should_not set_the_flash }

  end

  context "for an admin" do
    before (:each) do
      @user.add_role :admin
      sign_in @user
      page = @page.permalink
      get :edit, id: page 
    end

    it { should route(:get, "/page/edit").to(action: :edit, id: "page") }
    it { should assign_to(:page).with(@page) }
    it { should respond_with(:success) }
    it { should_not set_the_flash }
  end

  context "for a user" do
    before (:each) do
      sign_out @user
      page = @page.permalink
      get :edit, id: page
    end

    it { should redirect_to(root_path) }
    it { should_not render_template(:edit) }
    it { should set_the_flash[:alert].to("You have to log in as admin to perform this action") }
    it { should_not assign_to(:page).with(@page) }
    it { should_not have_content("Edit") }
  end

  context "for an admin" do
    before (:each) do
      @user.add_role :admin
      sign_in @user
      get :new
      @page = FactoryGirl.build(:page)
    end

    it { should route(:get, "/pages/new").to(action: :new) }
    it { should respond_with(:success) }
  end

  context "for a user" do
    before (:each) do
      sign_out @user
      get :new
      @page = FactoryGirl.build(:page)
    end

    it { should redirect_to(root_path) }
    it { should set_the_flash[:alert].to("You have to log in as admin to perform this action") }
    it { should_not render_template(:new) }
  end

  context "for an admin" do
    before (:each) do
      @user.add_role :admin
      sign_in @user
    end
    context "with valid parameters" do
      before (:each) do
        post :create, {page: valid_attributes}
      end

      it { should assign_to(:page).with(Page.last) }
      it { should respond_with(:redirect) }
      it { should set_the_flash[:notice].to("Page was successfully created") }
      it { should redirect_to(page_path(Page.last)) }
    end
    context "with invalid parameters" do
      before (:each) do
        post :create, {page: invalid_attributes }
      end

      it { should_not assign_to(:page).with(Page) }
      it { should set_the_flash[:alert].to("Page has not been created") }
      it { should render_template(:new) }
    end
  end

  context "for an admin" do
    before (:each) do
      @user.add_role :admin
      sign_in @user
    end
    context "with valid parameters" do
      before (:each) do
        put :update, {id: @page.to_param, page: valid_update_attributes}
      end
      
      it { should assign_to(:page).with(Page.last) }
      it { should respond_with(:redirect) }
      it { should set_the_flash[:notice].to("Page was successfully updated") }
      it { should redirect_to(page_path(Page.last)) }
    end
    context "with invalid parameters" do
      before (:each) do
        put :update, {id: @page.to_param, page: invalid_attributes }
      end

      it { should_not assign_to(:page).with(Page) }
      it { should set_the_flash[:alert].to("Page has not been updated") }
      it { should render_template(:edit) }
    end
  end

  context "for an admin" do
    before (:each) do
      @user.add_role :admin
      sign_in @user
      delete :destroy, {id: @page.to_param}
    end

    it { should respond_with(:redirect) }
    it { should redirect_to(pages_path) }
    it { should set_the_flash[:notice].to("#{@page.name} was deleted") }
  end
  
  context "for a user" do
    before (:each) do
      sign_out @user
      delete :destroy, {id: @page.to_param}
    end

    it { should redirect_to(root_path) }
    it { should set_the_flash[:alert].to("You have to log in as admin to perform this action") }
  end
    
  context "for a user" do
    before (:each) do
      get :show, id: "not-here"
    end

    it { should redirect_to(root_path) }
    it { should set_the_flash[:alert].to("The page you were looking for could not be found!")}
  end

end
