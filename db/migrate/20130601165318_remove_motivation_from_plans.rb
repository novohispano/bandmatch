class RemoveMotivationFromPlans < ActiveRecord::Migration
  def change
    remove_column :plans, :motivation
  end
end
