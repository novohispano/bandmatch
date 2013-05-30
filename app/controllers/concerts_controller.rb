class ConcertsController < ApplicationController
  def index
    @coordinates = GeocoderService.location_to_coordinates(current_user.location)
    @concerts    = SongkickService.fetch_events(@coordinates)
  end
end