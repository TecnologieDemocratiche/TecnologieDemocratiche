require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'mickeymouse'
    password_confirmation 'mickeymouse'
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { %w(M F).sample }
    member_since { Date.today }
    member_until { Date.today + 10.years }
    payment_type :not_yet
    birthdate { Date.today }
    birthplace { Faker::Address.city }
    birthplace_district { Faker::Address.city }
    tax_code 'NGLLNZ92R30C357W'
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    city_district { Faker::Address.city }
    zip_code '12345'
    document { File.open('db/fake_document.txt') }
    payment_recipe { File.open('db/fake_payment_recipe.txt') }
    accept_cookies true
    accept_real_info true
    accept_privacy true
    accept_terms true
    admin false
    approved false

    factory :admin do
      tax_code 'RDOLSN86M19D704W'

      after(:build) do |admin|
        admin.skip_confirmation!
        admin.confirm
        admin.admin = true
      end
    end
  end
end
