class ConcertsController < ApplicationController
  def index
    @concerts = SongkickService.fetch_events(current_user.coordinates)
  end
end