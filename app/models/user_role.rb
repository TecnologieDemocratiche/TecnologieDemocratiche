class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  validates :user, presence: true
  validates :role, presence: true
end
