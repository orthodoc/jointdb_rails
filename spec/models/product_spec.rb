require 'spec_helper'

describe Product do

  subject { FactoryGirl.create(:product) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:company_id) }
  it { should validate_presence_of(:company) }

end
