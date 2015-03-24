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
    f.birthplace 'Birthplace'
    f.tax_code 'NGLLNZ92R30C357W'
    f.address 'Address'
    f.city 'City'
    f.zip_code '12345'
    f.document { File.open('db/fake_document.txt') }
    f.payment_recipe { File.open('db/fake_payment_recipe.txt') }
    f.accept_cookies 1
    f.accept_real_info 1
    f.accept_privacy 1
    f.accept_terms 1
    f.admin false
    f.approved true
  end
end
