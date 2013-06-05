require 'spec_helper'

describe PlansController do
  # describe '#index' do
  #   it 'index works' do
  #     get :index
  #     expect(response).to be_success
  #     expect(assigns[:plans]).to eq(plans)
  #   end
  # end

  describe '#create' do
    let(:user) do
      create_user
    end

    before do
      GeocoderService.stub!(:location_to_coordinates => '')
    end

    def create_action(params)
      post :create, params, :user_id => user.id
    end

    it 'creating fails because of invalid parameters' do
      expect {
        create_action({})
      }.not_to change(Plan, :count)

      expect(response).to redirect_to(concerts_path)
      expect(flash[:alert]).to eq('There was an error creating your plan. Did you forget mentioning your plan?')
    end

    it 'successful create' do
      expect {
        create_action(:description => 'test')
      }.to change(Plan, :count).by(1)

      # TODO: assert flash message, redirect
    end
  end
end
