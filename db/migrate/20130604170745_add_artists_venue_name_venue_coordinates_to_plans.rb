class AddArtistsVenueNameVenueCoordinatesToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :artists, :string
    add_column :plans, :venue_name, :string
    add_column :plans, :venue_latitude, :string
    add_column :plans, :venue_longitude, :string
  end
end
