require 'spec_helper'

describe Plan do
  let(:plan) do
    create_plan
  end

  before(:each) do
    expect(plan).to be_valid
  end

  describe 'a new plan inherits location from its owner' do
    it 'copies user coordinates to location' do
      user = create_user
      user.stub!(coordinates: '1,2')
      plan = Plan.create_for_user(user, description: 'test')
      expect(plan.location).to eq(user.coordinates)
      expect(plan.users.first).to eq(user)
    end
  end

  describe 'location_in_words' do
    it 'returns a location in words from coordinates' do
      VCR.use_cassette('plan: location_in_words') do
        result = plan.location_in_words
        expect(result).to eq "Denver, Colorado"
      end
    end
  end

  describe 'address' do
    it 'transform some coordinates into an address' do
      VCR.use_cassette('plan: address') do
        plan.stub!(coordinates: '39.74,-104.98')
        result = plan.address
        expect(result).to eq '550-598 East Colfax Avenue, Denver, CO 80203, USA'
      end
    end
  end

  describe 'coordinates' do
    it 'gets the coordinates for a plan' do
      VCR.use_cassette('plan: coordinates') do
        plan.stub!(
          venue_latitude:  '39.74',
          venue_longitude: '-104.98'
          )
        result = plan.coordinates
        expect(result).to eq '39.74,-104.98'
      end
    end
  end
end