FactoryGirl.define do
  factory :user do
    name    { 'Eduardo Zaghi' }
    active  { false }

    trait :actived do
      active { true }
    end
  end
end