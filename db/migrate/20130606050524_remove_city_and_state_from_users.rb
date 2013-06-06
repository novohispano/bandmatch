class RemoveCityAndStateFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :city
    remove_column :users, :state
  end
end
