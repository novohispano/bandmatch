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

  describe 'a new plan inherits location from its owner' do
    it 'copies user coordinates to location' do
      user = create_user
      user.stub!(:coordinates => '1,2')
      plan = Plan.create_for_user(user, :description => 'test')
      expect(plan.location).to eq(user.coordinates)
      expect(plan.users.first).to eq(user)
    end
  end
end
