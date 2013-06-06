require 'spec_helper'

describe PlansController do
  let(:user) do
    create_user
  end

  before do
    GeocoderService.stub!(location_to_coordinates: '')
  end

  describe '#index' do
    it 'shows all actions' do
      plan = create_plan
      get :index, {}, user_id: user.id
      result = assigns(:plans).first
      expect(response.status).to eq 200
      expect(result).to eq(plan)
    end
  end

  describe '#show' do
    it 'shows all actions' do
      plan = create_plan
      get :show, { id: plan.id }, user_id: user.id
      result = assigns(:plan)
      expect(response.status).to eq 200
      expect(result).to eq(plan)
    end
  end

  describe '#create' do
    def create_action(params)
      post :create, params, user_id: user.id
    end

    it 'doesn\'t creates a plan because of invalid params' do
      expect {
        create_action({})
      }.not_to change(Plan, :count)

      expect(response).to redirect_to(concerts_path)
      expect(flash[:alert]).to eq('There was an error creating your plan. Did you forget mentioning your plan?')
    end

    it 'creates a plan when given correct params' do
      expect {
        create_action(:description => 'test')
      }.to change(Plan, :count).by(1)

      expect(response).to redirect_to(plan_path(Plan.first.id))
      expect(flash[:notice]).to eq('Your plan was successfully created.')
    end
  end
end
