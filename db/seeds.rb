admin = User.new(
    email: ENV['ADMIN_EMAIL'],
    password: ENV['ADMIN_PASSWORD'],
    password_confirmation: ENV['ADMIN_PASSWORD'],
    name: ENV['ADMIN_NAME'],
    last_name: ENV['ADMIN_LAST_NAME'],
    member_since: Date.today,
    member_until: Date.today + 10.years,
    payment_type: :not_yet,
    birthdate: Date.today,
    birthplace: 'Birthplace',
    birthplace_district: 'Birthplace District',
    tax_code: 'NGLLNZ92R30C357W',
    address: 'Address',
    city: 'City',
    city_district: 'City District',
    zip_code: '12345',
    document: File.open('db/fake_document.txt'),
    payment_recipe: File.open('db/fake_payment_recipe.txt'),
    accept_cookies: true,
    accept_real_info: true,
    accept_privacy: true,
    accept_terms: true,
    admin: true,
    approved: true)
admin.skip_confirmation!
admin.save!
admin.confirm!
if Rails.env.development?
  10.times do
    user = User.new(
        email: Faker::Internet.email,
        password: 'mickeymouse',
        password_confirmation: 'mickeymouse',
        name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        member_since: Date.today,
        member_until: Date.today + 10.years,
        payment_type: :not_yet,
        birthdate: Date.today,
        birthplace: Faker::Address.city,
        birthplace_district: 'Birthplace District',
        tax_code: 'NGLLNZ92R30C357W',
        address: Faker::Address.street_address,
        city: Faker::Address.city,
        city_district: 'City District',
        zip_code: Faker::Address.zip_code,
        document: File.open('db/fake_document.txt'),
        payment_recipe: File.open('db/fake_payment_recipe.txt'),
        accept_cookies: true,
        accept_real_info: true,
        accept_privacy: true,
        accept_terms: true,
        admin: true,
        approved: true)
    user.skip_confirmation!
    user.save!
    user.confirm!
  end
end
