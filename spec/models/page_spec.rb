require 'spec_helper'

describe Page do

  subject { FactoryGirl.create(:page) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:permalink) }
  it { should validate_uniqueness_of(:permalink) }
  it { should validate_presence_of(:content) }

end
