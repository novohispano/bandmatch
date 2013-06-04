class Plan < ActiveRecord::Base
  attr_accessible :display_name,
                  :description,
                  :location,
                  :start

  default_scope order('start DESC')
  scope :recent, lambda { where('start >= ?', Time.now - 1.day) }

  validates :description, presence: true

  has_many :user_plans
  has_many :users, through: :user_plans

  def location_in_words
    GeocoderService.coordinates_to_location(self.location)
  end
end