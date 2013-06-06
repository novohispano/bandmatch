class Comment < ActiveRecord::Base
  attr_accessible :body,
                  :plan_id,
                  :user_id

  belongs_to :user
  belongs_to :plan

  default_scope order('created_at DESC')

  validates :body, presence: true
end