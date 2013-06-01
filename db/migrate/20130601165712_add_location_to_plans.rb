class AddLocationToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :location, :string
  end
end
