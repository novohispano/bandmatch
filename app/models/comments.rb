class Comments < ActiveRecord::Base
  attr_accessible :body

  belongs_to :user
  belongs_to :plan

  default_scope order('created_at DESC')

  validates :body, presence: true

end