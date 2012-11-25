require 'spec_helper'

describe ProductsController do

  before (:each) do
    @product = FactoryGirl.create(:product)
    @user = FactoryGirl.create(:user)
  end

  context "for a user" do
    before(:each) do
      sign_in @user
      get :new
      @product = FactoryGirl.build(:product)
    end

    it { should route(:get, "/products/new").to(action: :new) }
    it { should respond_with(:success) }
  end

  context "for a user" do
    before(:each) do
      get :show, id: @product.id
    end

    it { should respond_with(:success) }
    it { should assign_to(:product).with(@product) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
    it { should_not have_content("Edit Product") }
  end
  
  context "for a user" do
    before(:each) do
      get :show, id: "not-here"
    end

    it { should redirect_to(products_path) }
    it { should set_the_flash[:alert].to("The product you were looking for could not be found!") }
  end

  context "for a user" do
    before (:each) do
      get :index
    end

    it { should route(:get, products_path).to(:action => :index) }
    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
    it { should assign_to(:products).with([@product]) }

  end

end
