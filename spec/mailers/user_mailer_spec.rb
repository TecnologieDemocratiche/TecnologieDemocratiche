require 'rails_helper'

describe UserMailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @admin = FactoryGirl.build(:user, admin: true)
    @admin.skip_confirmation!
    @admin.save!
    @admin.confirm

    @user = FactoryGirl.build(:user)
    ActionMailer::Base.deliveries.clear

    # manually calling callback since we are in test environment
    UserMailer.account_approved(@user).deliver_now

    @sent_email = ActionMailer::Base.deliveries.first
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  describe 'when an account is approved' do
    it 'sends an email' do
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it 'sends it to the correct user' do
      expect(@sent_email.to).to eq([@user.email])
    end

    it 'sets the correct subject' do
      expect(@sent_email.subject).to eq(I18n.t('user_mailer.account_approved.subject'))
    end

    it 'sets the correct sender' do
      expect(@sent_email.from).to eq(['test@tecnologiedemocratiche.it'])
    end

    it 'sets the correct body' do
      expect(@sent_email.body.encoded).to include("#{@user.full_name}")
    end
  end
end
