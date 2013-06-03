require 'spec_helper'

describe GeocoderService do
  describe 'location_to_coordinates' do
    it "transforms a location into coordinates" do
      VCR.use_cassette('location_to_coordinates') do
        result = GeocoderService.location_to_coordinates("Denver, Colorado")
        expect(result).to eq "39.74,-104.98"
      end
    end
  end

  describe 'coordinates_to_location' do
    it "transforms a location into coordinates" do
      VCR.use_cassette('coordinates_to_location') do
        result = GeocoderService.coordinates_to_location("39.74,-104.98")
        expect(result).to eq "Denver, Colorado"
      end
    end
  end
end