class AddApprovedToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :approved, :boolean, :default => false, :null => false
    add_index  :vendors, :approved
  end
end
