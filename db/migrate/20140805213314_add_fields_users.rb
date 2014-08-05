class AddFieldsUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string, limit: 1, null: false, default: 'M'
    add_column :users, :birthplace, :string
  end
end
