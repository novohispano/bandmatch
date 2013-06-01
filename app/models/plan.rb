class Plan < ActiveRecord::Base
  attr_accessible :display_name,
                  :description,
                  :location,
                  :start

  validates :description, presence: true

  has_many :user_plans
  has_many :users, through: :user_plans
end