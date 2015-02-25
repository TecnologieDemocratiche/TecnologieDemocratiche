require 'rails_helper'

describe "registration process", type: :feature, js: true do
  it "can register correctly" do
    visit new_user_registration_path
    select I18n.t('payment_type.bank_transfer'), from: I18n.t('simple_form.labels.user.payment_type')
    click_button I18n.t('helpers.submit.user.create')
    expect(User.count).to eq 1
  end
end
