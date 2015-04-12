class AddApproverToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :approver, references: :users
  end
end
