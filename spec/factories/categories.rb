# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do |category|
    category.sequence(:name) { |n| "Manufacturer #{n}" }

    factory :category_with_companies do
      after(:create) do |category|
        FactoryGirl.create(:company, category: category)
      end
    end
  end
end
