class AddMotivationToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :motivation, :string
  end
end
