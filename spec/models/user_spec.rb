require 'rails_helper'

describe User do
  context 'tax code validation' do
    it 'does not allow fake tax codes' do
      user = build(:user, tax_code: 'CICCIA')
      expect_errors_on_model_field(user, :tax_code, 1)
    end

    it 'does not allow duplicated tax code' do
      user = create(:user)
      user2 = build(:user, tax_code: user.tax_code)
      expect_errors_on_model_field(user2, :tax_code, 1)
    end
  end
end
