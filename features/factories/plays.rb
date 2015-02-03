FactoryGirl.define do
  factory :play do
    association :story
    association :user
    value 3
  end
end
