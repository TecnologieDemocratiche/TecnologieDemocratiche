require 'rails_helper'

describe AdminMailer do

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    
    @admin = FactoryGirl.build(:user, admin: true)
    @admin.skip_confirmation!
    @admin.save!
    @admin.confirm!

    ActionMailer::Base.deliveries.clear

    @user = FactoryGirl.create(:user)
    @sent_email = ActionMailer::Base.deliveries.second
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  describe 'when a new user registers' do
    it 'sends an email' do
      expect(ActionMailer::Base.deliveries.count).to eq(2)
    end

    it 'sends it to administrators' do
      expect(@sent_email.to).to eq( [@admin.email] )
    end

    it 'sets the correct subject' do
      expect(@sent_email.subject).to include( "#{@user.full_name}" )
    end

    it 'sets the correct sender' do  
      expect(@sent_email.from).to eq( [ENV['TD_EMAIL']] )
    end

    it 'sets the correct body' do
      expect(@sent_email.body.encoded).to include( "#{@user.full_name}" )
    end
  end

end
