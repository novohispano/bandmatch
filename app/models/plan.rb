class Plan < ActiveRecord::Base
  attr_accessible :artists,
                  :description,
                  :display_name,
                  :location,
                  :start,
                  :tickets_url,
                  :venue_name,
                  :venue_latitude,
                  :venue_longitude

  default_scope order('start DESC')
  scope :recent, lambda { where('start >= ?', Time.now - 1.day) }

  validates :description, presence: true

  has_many :user_plans
  has_many :users, through: :user_plans

  has_many :comments

  def self.create_for_user(user, params)
    params_with_location = params.merge(:location => user.coordinates)
    user.plans.create(params_with_location)
  end

  def location_in_words
    GeocoderService.query_to_location(self.location)
  end

  def address
    GeocoderService.coordinates_to_address(self.coordinates)
  end

  def coordinates
    "#{self.venue_latitude},#{self.venue_longitude}"
  end
end
