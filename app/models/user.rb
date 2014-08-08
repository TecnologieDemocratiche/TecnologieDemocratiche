class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable, :confirmable

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :birthdate, presence: true
  validates :birthplace, presence: true
  validates :gender, presence: true
  validates :tax_code, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
  validates :payment_recipe, presence: true, on: :create
  validates :document, presence: true, on: :create

  has_attached_file :payment_recipe
  validates_attachment_content_type :payment_recipe,
                                    content_type: ['application/pdf', 'application/msword', 'text/plain', 'image/jpeg', 'image/gif', 'image/png']

  has_attached_file :document
  validates_attachment_content_type :document, content_type: ['application/pdf', 'application/msword', 'text/plain', 'image/jpeg', 'image/gif', 'image/png']

  STATUSES = {
      approved: 'approved',
      waiting_for_approval: 'waiting for approval',
      waiting_for_email: 'waiting for email confirmation'
  }

  def full_name
    "#{name} #{last_name}"
  end

  def status
    confirmed? ? approved? ? :approved : :waiting_for_approval : :waiting_for_email
  end

  def status_label
    STATUSES[status]
  end

  def active_for_authentication?
    super && approved? &&
        (Date.today >= member_since) &&
        (Date.today <= member_until)
  end

  def inactive_message
    if approved?
      super
    else
      :not_approved
    end
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t('devise.failure.not_approved')
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end


  def as_json(options = {})
    {
        id: id,
        name: name,
        last_name: last_name,
        tax_code: tax_code,
        gender: gender,
        email: email
    }
  end
end
