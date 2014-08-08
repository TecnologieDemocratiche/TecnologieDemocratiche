class AddDocuments < ActiveRecord::Migration
  def change
    add_attachment :users, :payment_recipe
    add_attachment :users, :document
  end
end
