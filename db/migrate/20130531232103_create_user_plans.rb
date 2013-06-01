class CreateUserPlans < ActiveRecord::Migration
  def change
    create_table :user_plans do |t|
      t.references :user
      t.references :plan

      t.timestamps
    end
    add_index :user_plans, :user_id
    add_index :user_plans, :plan_id
  end
end
