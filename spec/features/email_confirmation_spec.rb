require 'rails_helper'

describe 'email address confirmation procedure' do
  context 'user registers and receives a confirmatoin email' do
    let!(:admin) { create(:admin) }

    let(:user) { create(:user) }

    context 'clicks on email confirmation link' do
      include EmailSpec::Helpers
      include EmailSpec::Matchers

      before(:each) do
        open_email(user.email)
        click_first_link_in_email
      end

      it 'receives ok message' do
        expect(page.current_path).to eq('/users/sign_in')
      end
    end
  end
end
