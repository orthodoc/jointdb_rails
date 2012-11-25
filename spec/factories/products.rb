# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do |product|
    product.sequence(:name) { |n| "Fancy Hip #{n}" }
    company
  end
end
