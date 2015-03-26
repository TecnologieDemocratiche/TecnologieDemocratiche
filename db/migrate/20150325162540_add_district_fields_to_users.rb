class AddDistrictFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthplace_district, :string
    add_column :users, :city_district, :string
  end
end
