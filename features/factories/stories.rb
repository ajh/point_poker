FactoryGirl.define do
  factory :story do
    association :game
    description 'some story'
    complete false
  end
end
