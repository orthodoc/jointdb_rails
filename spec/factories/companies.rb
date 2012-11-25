# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do |company|
    company.sequence(:name) { |n| "Ortho Company #{n}" }
    category

    factory :company_with_products do
      after(:create) do |company|
        FactoryGirl.create(:product, company: company)
      end
    end
  end
end
