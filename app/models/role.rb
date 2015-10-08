class Role < ActiveRecord::Base
  acts_as_list scope: :group

  belongs_to :group
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  validates :name, presence: true
  validates :group, presence: true
end
