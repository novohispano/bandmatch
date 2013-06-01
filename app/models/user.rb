class User < ActiveRecord::Base
  attr_accessible :name,
                  :email,
                  :image,
                  :city,
                  :state,
                  :location,
                  :oauth_expires_at,
                  :oauth_token,
                  :provider,
                  :uid

  has_many :user_plans
  has_many :plans, through: :user_plans

  def self.from_omniauth(auth)
    User.where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.image            = auth.info.image
      user.city             = auth.info.location.split(", ")[0]
      user.state            = auth.info.location.split(", ")[1]
      user.location         = auth.info.location
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.oauth_token      = auth.credentials.token
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.save!
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end
end