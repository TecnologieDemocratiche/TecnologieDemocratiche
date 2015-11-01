class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable, :confirmable

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :groups, through: :roles

  validates :name, :last_name, :email, :birthdate, :birthplace, :birthplace_district,
            :gender, :tax_code, :address, :city, :city_district, :payment_type, presence: true
  validates_format_of :email, with: /\A.+@.+\..+\z/i
  validates :document, presence: true, on: :create
  validates :member_type, presence: true
  validates :zip_code, presence: true, length: {maximum: 5}, numericality: {only_integer: true}
  validates :accept_cookies, acceptance: {accept: true}
  validates :accept_real_info, acceptance: {accept: true}
  validates :accept_privacy, acceptance: {accept: true}
  validates :accept_terms, acceptance: {accept: true}
  validates :tax_code, uniqueness: true
  validate :valid_tax_code

  belongs_to :approver, class_name: 'User'
  validate :approvation_fields_consistency

  has_attached_file :payment_recipe
  validates_attachment_content_type :payment_recipe,
                                    content_type: ['application/pdf', 'application/msword', 'text/plain',
                                                   'image/jpeg', 'image/gif', 'image/png']

  has_attached_file :document
  validates_attachment_content_type :document,
                                    content_type: ['application/pdf', 'application/msword', 'text/plain',
                                                   'image/jpeg', 'image/gif', 'image/png']

  enum payment_type: [:not_yet, :paypal, :bank_transfer]
  enum member_type: [:standard, :collaborative]

  STATUSES = {
    approved: I18n.t('simple_form.labels.user.statuses.approved'),
    waiting_for_approval: I18n.t('simple_form.labels.user.statuses.waiting_for_approval'),
    waiting_for_email: I18n.t('simple_form.labels.user.statuses.waiting_for_email_confirmation')
  }

  before_save :notify_user, if: proc { |user| user.approved? && user.approved_changed? }

  before_validation :remove_approver, if: proc { |user| !user.approved? && user.approved_changed? }

  def full_name
    "#{name} #{last_name}"
  end

  def status
    if confirmed?
      approved? ? :approved : :waiting_for_approval
    else
      :waiting_for_email
    end
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

  def self.send_reset_password_instructions(attributes = {})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t('devise.failure.not_approved')
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end

  def as_json(_options = {})
    {id: id, name: name, last_name: last_name, tax_code: tax_code, gender: gender, email: email}
  end

  # TODO: I18n
  def feasible_invalid_tax_code?
    calculated_tax_code != tax_code.upcase
  rescue ArgumentError, RuntimeError
    true
  end

  # TODO: I18n
  def calculated_tax_code
    CodiceFiscaleTools.calculate(name: name,
                                 surname: last_name,
                                 gender: {'M' => :male, 'F' => :female}[gender],
                                 birthdate: birthdate,
                                 province_code: birthplace_district,
                                 city_name: birthplace)
  end

  def after_confirmation
    notify_admin
    super
  end

  def notify_user
    UserMailer.account_approved(self).deliver_now
  end

  def notify_admin
    AdminMailer.new_user_waiting_for_approval(self).deliver_now
  end

  private

  def approvation_fields_consistency
    errors.add(:approver,
               I18n.t('activerecord.errors.models.user.attributes.approver.required')) if !approver && approved
    errors.add(:approved,
               I18n.t('activerecord.errors.models.user.attributes.approved.required')) if approver && !approved
    errors.add(:member_since,:required) if approved? && member_since.blank?
    errors.add(:member_until,:required) if approved? && member_until.blank?
  end

  def valid_tax_code
    message = I18n.t('activerecord.errors.models.user.attributes.tax_code.invalid')
    errors.add(:tax_code, message) unless CodiceFiscaleTools.valid?(tax_code)
  end

  def remove_approver
    self.approver = nil
  end
end
