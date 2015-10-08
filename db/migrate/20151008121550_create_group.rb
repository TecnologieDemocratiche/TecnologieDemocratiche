class CreateGroup < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description
      t.integer :position
      t.timestamps
    end

    create_table :roles do |t|
      t.string :name, null: false
      t.text :description
      t.references :group, null: false
      t.integer :position
      t.timestamps
    end

    create_table :user_roles do |t|
      t.references :user, null: false
      t.references :role, null: false
      t.timestamps
    end

    add_index :user_roles, [:user_id, :role_id], unique: true

    add_column :users, :member_type, :integer, null: false, default: 0

    load('db/seeds/roles.rb')
  end
end
