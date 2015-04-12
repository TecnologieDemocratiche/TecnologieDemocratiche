require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password 'mickeymouse'
    f.password_confirmation 'mickeymouse'
    f.name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.member_since { Date.today }
    f.member_until { Date.today + 10.years }
    f.payment_type :not_yet
    f.birthdate { Date.today }
    f.birthplace { Faker::Address.city }
    f.birthplace_district { Faker::Address.city }
    f.tax_code 'NGLLNZ92R30C357W'
    f.address { Faker::Address.street_address }
    f.city { Faker::Address.city }
    f.city_district { Faker::Address.city }
    f.zip_code '12345'
    f.document { File.open('db/fake_document.txt') }
    f.payment_recipe { File.open('db/fake_payment_recipe.txt') }
    f.accept_cookies true
    f.accept_real_info true
    f.accept_privacy true
    f.accept_terms true
    f.admin false
    f.approved true
  end
end
