# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do |page|
    page.sequence(:name) {|n| "About Us #{n}" }
    page.sequence(:permalink) {|n| "about#{n}" }
    content "This is the way we do it!!"
  end
end
