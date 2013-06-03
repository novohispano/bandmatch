require 'spec_helper'

describe Plan do

  let(:plan) do
    create_plan
  end

  before(:each) do
    expect(plan).to be_valid
  end

  describe 'location_in_words' do
    it 'returns a location in words from coordinates' do
      VCR.use_cassette('plan') do
        result = plan.location_in_words
        expect(result).to eq "Denver, Colorado"
      end
    end
  end
end