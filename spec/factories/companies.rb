# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do |company|
    company.sequence(:name) { |n| "Ortho Company #{n}" }
    category
  end
end
