class AddDefaultValuesToLongitudeAndLatitudeinPlans < ActiveRecord::Migration
  def change
    change_column :plans, :venue_latitude, :string, default: ""
    change_column :plans, :venue_longitude, :string, default: ""
  end
end