FactoryGirl.define do
  factory :role do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    association :group
  end
end
