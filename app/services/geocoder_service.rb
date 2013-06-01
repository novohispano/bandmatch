class GeocoderService
  def self.location_to_coordinates(location)
    result = search_by(location)
    lat_long(result)
  end

  def self.coordinates_to_location(coordinates)
    result = search_by(coordinates)
    city_state(result)
  end

  def self.lat_long(result)
    "#{result.latitude.round(2)},#{result.longitude.round(2)}"
  end

  def self.city_state(result)
    "#{result.city}, #{result.state}"
  end

  def self.search_by(query)
    Geocoder.search(query).first
  end
end