FactoryGirl.define do
  factory :user do
    association :game
    name 'Some user'

    factory :observer do
      observer true
    end
  end
end
