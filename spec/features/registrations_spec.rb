require 'rails_helper'

describe "registration process", type: :feature do
  it "can register correctly" do
    visit new_user_registration_path
    select I18n.t('payment_type.bank_transfer'), from: I18n.t('simple_form.labels.user.payment_type')
    attach_file I18n.t('simple_form.labels.user.document'), "spec/cucumber-1.jpg"
    fill_in I18n.t('simple_form.labels.defaults.email'), with: Faker::Internet.email
    find(:css, '#user_password').set 'topolino'
    find(:css, '#user_password_confirmation').set 'topolino'
    fill_in I18n.t('simple_form.labels.user.name'), with: Faker::Name.first_name
    fill_in I18n.t('simple_form.labels.user.last_name'), with: Faker::Name.last_name
    fill_in I18n.t('simple_form.labels.user.birthdate'), with: Date.today
    fill_in I18n.t('simple_form.labels.user.birthplace'), with: Faker::Address.city
    choose 'M'
    fill_in I18n.t('simple_form.labels.user.tax_code'), with: 'RDOLSN86M19D704W'
    fill_in I18n.t('simple_form.labels.user.address'), with: Faker::Address.street_address
    fill_in I18n.t('simple_form.labels.user.city'), with: Faker::Address.city
    fill_in I18n.t('simple_form.labels.user.zip_code'), with: Faker::Address.zip_code
    find(:css, '#user_accept_real_info').set(true)
    find(:css, '#user_accept_cookies').set(true)
    find(:css, '#user_accept_privacy').set(true)
    find(:css, '#user_accept_terms').set(true)
    click_button I18n.t('helpers.submit.user.create')
    expect(User.count).to eq 1

  end
end
