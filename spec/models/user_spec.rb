require 'spec_helper'

describe User do
  let(:user) do
    create_user
  end

  let(:auth_data) do
    {
      info: {
        name:             'James Ameihaejcgeg Wongescu',
        email:            'jwong@test.com',
        image:            'http://graph.facebook.com/100005981503757/picture?type=square',
        location:         'New York, New York'
        },
      credentials: {
        token:            'CAAIc1b7yEMoBAOwV6L5wWEvhwBHAgfq7Diu7zzTZBWNO0wjV6VxhFClEB5bURmFuhjm11dk7CBIBGQgO6YUUdvkUam4MqnWUZCh5Y1lbmGoI2JfFGz77Ox15rUwuQ9u819mPbEseT9lpClZAZAxt',
        expires_at:       946702800
        },
      provider:           'facebook',
      uid:                '100005981503757'
    }
  end

  let(:auth) do
    Hashie::Mash.new(auth_data)
  end

  before(:each) do
    expect(user).to be_valid
  end

  describe 'coordinates' do
    it 'returns the coordinates for a user location' do
      VCR.use_cassette('user') do
        result = user.coordinates
        expect(result).to eq "40.7143528,-74.00597309999999"
      end
    end
  end

  describe 'facebook' do
    it 'connects to Facebook' do
      result = user.facebook
      expect(result.class).to eq Koala::Facebook::API
    end
  end

  describe 'self.from_omniauth' do
    it 'saves a user from omniauth' do
      result = User.create_with_auth(auth)
      expect(result.class).to            eq User
      expect(result).to                  be_valid
      expect(result.name).to             eq 'James Ameihaejcgeg Wongescu'
      expect(result.email).to            eq 'jwong@test.com'
      expect(result.image).to            eq 'http://graph.facebook.com/100005981503757/picture?type=square'
      expect(result.city).to             eq 'New York'
      expect(result.state).to            eq 'New York'
      expect(result.location).to         eq 'New York, New York'
      expect(result.oauth_expires_at).to eq '1999-12-31 22:00:00 -0700'
      expect(result.oauth_token).to      eq 'CAAIc1b7yEMoBAOwV6L5wWEvhwBHAgfq7Diu7zzTZBWNO0wjV6VxhFClEB5bURmFuhjm11dk7CBIBGQgO6YUUdvkUam4MqnWUZCh5Y1lbmGoI2JfFGz77Ox15rUwuQ9u819mPbEseT9lpClZAZAxt'
      expect(result.provider).to         eq 'facebook'
      expect(result.uid).to              eq '100005981503757'
    end
  end

  describe 'find_with_auth' do
    it 'finds the user when a user exists' do
      User.create_with_auth(auth)
      result = User.find_with_auth(auth)
      expect(result).not_to be_nil
      expect(result.uid).to eq '100005981503757'
    end

    it 'doesn\'t find the user when it doesn\'t exist' do
      result = User.find_with_auth(OpenStruct.new(auth: {provider: 'facebook', uid: '123'}))
      expect(result).to be_nil
    end
  end

  describe 'from_omniauth' do
    it 'gets the user when it exists' do
      User.create_with_auth(auth)
      result = User.from_omniauth(auth)
      expect(result).not_to be_nil
      expect(result.uid).to eq '100005981503757'
    end

    it 'creates an user when it doesn\' exist' do
      result = User.from_omniauth(auth)
      expect(result).not_to be_nil
      expect(result.uid).to eq "100005981503757"
    end
  end
end