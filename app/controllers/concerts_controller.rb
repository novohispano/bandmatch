class ConcertsController < ApplicationController
  before_filter :require_login

  def index
    @concerts = SongkickService.fetch_events(current_user.coordinates)
  end
end