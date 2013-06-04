class ConcertsController < ApplicationController
  before_filter :require_login

  def index
    @concerts = concerts_for_current_user
  end

  private

  def concerts_for_current_user
    Rails.cache.fetch("concert-#{current_user.id}", expires_in: 12.hours) do
      SongkickService.fetch_events(current_user.coordinates)
    end
  end
end