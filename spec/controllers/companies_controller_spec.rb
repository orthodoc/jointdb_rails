require 'spec_helper'

describe CompaniesController do

  before (:each) do
    @company = FactoryGirl.create(:company)
    @companies = Company.all
    @user = FactoryGirl.create(:user)
  end


    context "for a user" do
      before (:each) do
        get :index
      end

      #it { should route(:get, companies_path).to(:action => :index) }
      it { should respond_with(:success) }
      it { should render_template(:index) }
      it { should_not set_the_flash }
      it { should assign_to(:companies).with([@company]) }

    end

    context "for a user" do
      before (:each) do
        get :show, id: @company.id
      end

      it { should respond_with(:success) }
      it { should assign_to(:company).with(@company) }
      it { should render_template(:show) }
      it { should_not set_the_flash }
      it { should_not have_content("Edit Company") }
    end

    context "for a user" do
      before (:each) do
        get :show, :id => "not-here"
      end

      it { should redirect_to(companies_path) }
      it { should set_the_flash[:alert].to("The company you were looking for could not be found!")}
    end

    context "for a user" do
      before do
        sign_out @user
        get :edit, :id => @company.id
      end

      it { should redirect_to(new_user_session_path) }
      it { should set_the_flash[:alert].to("You have to log in to update the company") }

    end

end
