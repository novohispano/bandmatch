class AddStartDisplayNameToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :start, :datetime
    add_column :plans, :display_name, :string

    remove_column :plans, :title
  end
end