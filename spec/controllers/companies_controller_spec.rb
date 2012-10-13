require 'spec_helper'

describe CompaniesController do
  before do
    @company = FactoryGirl.create(:company)
    @companies = Company.all

    context "for a user" do
      before do
        get :index
      end

      it { should respond_with(:success) }
      it { should render_template(:index) }
      it { should_not set_the_flash }

    end

    context "for a user" do
      before do
        get :show, id: @company.id
      end

      it { should respond_with(:success) }
      it { should assign_to(:company).with(@company) }
      it { should render_template(:show) }
      it { should_not set_the_flash }
    end

    context "for a user" do
      before do
        get :show, :id => "not-here"
      end

      it { should redirect_to(companies_path) }
      it { should set_the_flash[:alert].to("The company you were looking for could not be found")}
    end

  end

end
