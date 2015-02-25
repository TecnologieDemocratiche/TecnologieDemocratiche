class PaymentType < ActiveRecord::Migration
  def change
    add_column :users, :payment_type, :integer, null: false, default: 0
    add_column :users, :accept_real_info, :boolean, null: false, default: false
    add_column :users, :accept_privacy, :boolean, null: false, default: false
    add_column :users, :accept_terms, :boolean, null: false, default: false
    add_column :users, :accept_cookies, :boolean, null: false, default: false
  end
end
