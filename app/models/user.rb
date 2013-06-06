class User < ActiveRecord::Base
  attr_accessible :name,
                  :email,
                  :image,
                  :location,
                  :oauth_expires_at,
                  :oauth_token,
                  :provider,
                  :uid

  has_many :user_plans
  has_many :plans, through: :user_plans

  has_many :comments

  def self.from_omniauth(auth, ip = "")
    user = find_with_auth(auth)
    user ? user : create_with_auth(auth, ip)
  end

  def self.find_with_auth(auth)
    User.where(
      provider: auth.provider,
      uid:      auth.uid
      ).first
  end

  def self.create_with_auth(auth, ip = "")
    User.new do |user|
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.image            = auth.info.image
      user.location         = auth.info.location || ip_to_location(ip)
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.oauth_token      = auth.credentials.token
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.save!
    end
  end

  def coordinates
    GeocoderService.location_to_coordinates(self.location)
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  def self.ip_to_location(ip)
    GeocoderService.query_to_location(ip)
  end
end