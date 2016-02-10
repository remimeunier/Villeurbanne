class AddAdresseToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :longitude, :float
    add_column :vendors, :latitude, :float
    add_column :vendors, :address, :string
  end
end
