require 'spec_helper'

describe Company do

  subject { FactoryGirl.create(:company) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:category) }

end
