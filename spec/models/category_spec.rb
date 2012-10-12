require 'spec_helper'

describe Category do
  
  subject { FactoryGirl.create(:category) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  
end
