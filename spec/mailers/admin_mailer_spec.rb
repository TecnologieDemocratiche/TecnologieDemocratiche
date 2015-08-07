require 'rails_helper'

describe AdminMailer do
  before(:each) do
    @admin = build(:user, admin: true, tax_code: 'RDOLSN86M19D704W')
    @admin.skip_confirmation!
    @admin.save!
    @admin.confirm!
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  describe 'when a new user registers' do
    before(:each) do
      @user = create(:user)
      ActionMailer::Base.deliveries.clear

      # manually calling callback since we are in test environment
      AdminMailer.new_user_waiting_for_approval(@user).deliver_now
      @sent_email = ActionMailer::Base.deliveries.first
    end

    it 'sends an email' do
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it 'sends it to administrators' do
      expect(@sent_email.to).to eq([@admin.email])
    end

    it 'sets the correct subject' do
      expect(@sent_email.subject).to include("#{@user.full_name}")
    end

    it 'sets the correct sender' do
      expect(@sent_email.from).to eq([ENV['TD_EMAIL']])
    end

    it 'sets the correct body' do
      expect(@sent_email.body.encoded).to include("#{@user.full_name}")
    end
  end

  describe 'when a user with valid tax code registers' do
    before(:each) do
      @user = FactoryGirl.build(:user)
      @user.birthplace = 'Cattolica'
      @user.birthplace_district = 'RN'
      @user.tax_code = @user.calculated_tax_code
      @user.save!
      ActionMailer::Base.deliveries.clear

      # manually calling callback since we are in test environment
      AdminMailer.new_user_waiting_for_approval(@user).deliver_now
      @sent_email = ActionMailer::Base.deliveries.first
    end

    it 'does not alert the Administrators' do
      expect(@sent_email.body.encoded).not_to include(I18n.t('admin_mailer.new_user_waiting_for_approval.validate_tax_code_link'))
    end
  end

  describe 'when a user with feasible invalid tax code registers' do
    before(:each) do
      @user = FactoryGirl.build(:user)
      @user.tax_code = 'NGLLNZ92R30C357W'
      @user.save!
      ActionMailer::Base.deliveries.clear

      # manually calling callback since we are in test environment
      AdminMailer.new_user_waiting_for_approval(@user).deliver_now
      @sent_email = ActionMailer::Base.deliveries.first
    end

    it 'alerts the Administrators' do
      expect(@sent_email.body.encoded).to include(I18n.t('admin_mailer.new_user_waiting_for_approval.validate_tax_code_link'))
    end
  end
end
