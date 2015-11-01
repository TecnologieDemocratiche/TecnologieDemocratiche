require 'rails_helper'

describe 'registration process', type: :feature do
  context 'correct registration procedure' do
    before(:each) do
      group_a = create(:group)
      group_b = create(:group)
      create_list(:role, 3, group: group_a)
      create_list(:role, 3, group: group_b)
      visit new_user_registration_path
      select I18n.t('payment_type.bank_transfer'), from: I18n.t('simple_form.labels.user.payment_type')
      attach_file I18n.t('simple_form.labels.user.document'), 'spec/cucumber-1.jpg'
      fill_in I18n.t('simple_form.labels.defaults.email'), with: Faker::Internet.email
      find(:css, '#user_password').set 'topolino'
      find(:css, '#user_password_confirmation').set 'topolino'
      fill_in :user_name, with: Faker::Name.first_name
      fill_in :user_last_name, with: Faker::Name.last_name
      fill_in :user_birthdate, with: Date.today
      fill_in :user_birthplace, with: Faker::Address.city
      select 'Agrigento', from: :user_birthplace_district
      choose 'M'
      fill_in :user_tax_code, with: 'RDOLSN86M19D704W'
      fill_in :user_address, with: Faker::Address.street_address
      fill_in :user_city, with: Faker::Address.city
      select 'Agrigento', from: :user_city_district
      fill_in :user_zip_code, with: Faker::Address.zip_code
      find(:css, '#user_accept_real_info').set(true)
      find(:css, '#user_accept_cookies').set(true)
      find(:css, '#user_accept_privacy').set(true)
      find(:css, '#user_accept_terms').set(true)
    end

    it 'can register correctly filling all informations' do
      click_button I18n.t('helpers.submit.user.create')
      expect(User.count).to eq 1
      expect(User.last.member_type).to eq 'standard'
    end

    it 'can register correctly as collaborative member' do
      choose I18n.t('member_type.collaborative')
      roles = Role.all.sample(2)
      check "user_role_ids_#{roles[0].id}"
      check "user_role_ids_#{roles[1].id}"
      click_button I18n.t('helpers.submit.user.create')
      expect(User.count).to eq 1
      expect(User.last.member_type).to eq 'collaborative'
      expect(User.last.roles.count).to eq 2
    end
  end
end
