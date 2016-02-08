class AddvendorIdToUser < ActiveRecord::Migration
  def change
  	add_column :users, :vendor_id, :integer
  	add_column :users, :admin, :boolean, default: false
  end
end
