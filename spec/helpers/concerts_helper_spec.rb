require 'spec_helper'

describe ConcertsHelper do
  describe "artists_from" do

    def performance(display_name)
      OpenStruct.new(artist: OpenStruct.new(display_name: display_name))
    end

    it "gets the artists from a performance" do
      performances = [ performance("Juana"), performance("Pedro") ]

      result = artists_from(performances)
      expect(result).to eq "Juana, Pedro"
    end
  end
end