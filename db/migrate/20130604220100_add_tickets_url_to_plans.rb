class AddTicketsUrlToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :tickets_url, :string
  end
end
