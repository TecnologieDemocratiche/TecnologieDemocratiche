User.create!(
    email: ENV['ADMIN_EMAIL'],
    password: ENV['ADMIN_PASSWORD'],
    password_confirmation: ENV['ADMIN_PASSWORD'],
    name: ENV['ADMIN_NAME'],
    last_name: ENV['ADMIN_LAST_NAME'],
    member_since: Date.today,
    member_until: Date.today + 10.years,
    admin: true)
