class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :member_since, presence: true
  validates :member_until, presence: true

  def full_name
    "#{name} #{last_name}"
  end
end
