require 'spec_helper'

describe CompaniesController do

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
      get :show, :id => "not-here"
    end

    it { should redirect_to(companies_path) }
    it { should set_the_flash[:alert].to("The company you were looking for could not be found")}
  end

end
