class Group < ActiveRecord::Base
  acts_as_list

  has_many :roles, -> { order(position: :asc) }, dependent: :destroy
  has_many :user_roles, through: :roles
  has_many :users, through: :user_roles

  validates :name, presence: true
end
