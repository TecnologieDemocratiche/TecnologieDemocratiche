class RemoveConstraints < ActiveRecord::Migration
  def up
    change_column :users, :member_since, :datetime, null: true
    change_column :users, :member_until, :datetime, null: true
    add_column :users, :unconfirmed_email, :string
  end

  def down
    change_column :users, :member_since, :datetime, null: false
    change_column :users, :member_until, :datetime, null: false
  end
end
