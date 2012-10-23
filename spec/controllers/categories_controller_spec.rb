require 'spec_helper'

describe CategoriesController do
  
  before (:each) do
    @category = FactoryGirl.create(:category)
    @user = FactoryGirl.create(:user)
  end

  context "for a user" do
    before (:each) do
      get :show, id: @category.id
    end

    it { should redirect_to(root_path) }
    it { should set_the_flash[:alert].to("You have to log in as admin to perform this action") }
  end

  context "for an admin" do
    before (:each) do
      @user.add_role :admin
      sign_in @user
      get :show, :id => "not-here"
    end

    it { should redirect_to(categories_path) }
    it { should set_the_flash[:alert].to("The category you were looking for does not exist") }
  end
end
