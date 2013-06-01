class Plan < ActiveRecord::Base
  attr_accessible :display_name,
                  :description,
                  :location,
                  :start

  validates :description, presence: true

  has_many :user_plans
  has_many :users, through: :user_plans

  def location_in_words
    GeocoderService.coordinates_to_location(self.location)
  end
end