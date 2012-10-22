# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |user|
    user.sequence(:name) { |n| "Test User #{n}" }
    user.sequence(:email) { |n| "example#{n}@example.com" }
    user.password 'please'
    user.password_confirmation 'please'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
