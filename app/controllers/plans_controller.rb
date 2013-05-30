class PlansController < ApplicationController
  def index
    @plans = Plan.all
    @coordinates = GeocoderService.location_to_coordinates(current_user.location)
    @concerts    = SongkickService.fetch_events(@coordinates)
  end

  def new
    @plan = Plan.new
  end

  def create
    plan = Plan.find(params[:id])
    plan.title       = params[:title]
    plan.description = params[:description]

    if plan.save
      flash[:notice] = 'Your plan was successfully created.'
      redirect_to plans_path
    else
      flash[:notice] = 'There was an error creating your plan. Try again.'
      redirect_to new_plan_path
    end
  end
end