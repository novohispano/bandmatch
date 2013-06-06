class GeocoderService
  def self.location_to_coordinates(location)
    result = search_by(location)
    lat_long(result)
  end

  def self.coordinates_to_location(coordinates)
    result = search_by(coordinates)
    city_state(result)
  end

  def self.query_to_location(query)
    result = search_by(query)
    result ? city_state(result) : "Unknown location."
  end

  def self.coordinates_to_address(coordinates)
    result = search_by(coordinates)
    result ? address(result) : "Unknown address."
  end

  def self.lat_long(result)
    "#{result.latitude},#{result.longitude}"
  end

  def self.city_state(result)
    "#{result.city}, #{result.state}"
  end

  def self.address(result)
    "#{result.address}"
  end

  def self.search_by(query)
    Geocoder.search(query).first
  end
end