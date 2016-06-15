class AddFieldsToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :address, :string
    add_column :locations, :state, :string
    add_column :locations, :country, :string
    add_column :locations, :postcode, :string
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end
end
