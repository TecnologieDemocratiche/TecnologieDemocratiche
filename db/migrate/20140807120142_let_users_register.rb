class LetUsersRegister < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :approved, :boolean, :default => false, :null => false
    add_index  :users, :approved

    User.update_all(approved: true)
  end
end
