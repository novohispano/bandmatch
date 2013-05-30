class GeocoderService
  def self.location_to_coordinates(location)
    results = Geocoder.search(location)
    result  = results.first
    lat_long(result)
  end

  def self.lat_long(result)
    "#{result.latitude.round(2)},#{result.longitude.round(2)}"
  end
end