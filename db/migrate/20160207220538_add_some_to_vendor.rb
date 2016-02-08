class AddSomeToVendor < ActiveRecord::Migration
  def change
  	add_column :vendors, :name, :string
  	add_column :vendors, :description, :text
  end
end
