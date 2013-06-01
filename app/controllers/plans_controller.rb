class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def user_plans
    @plans = current_user.plans

    render :index
  end

  def near_plans
    @plans = Plan.where(location: current_user.coordinates)

    render :index
  end

  def create
    plan = current_user.plans.create(
      start:        DateTime.parse(params[:start]),
      display_name: params[:display_name],
      description:  params[:description],
      location:     current_user.coordinates
      )

    if plan.save
      flash[:notice] = 'Your plan was successfully created.'
      redirect_to user_plans_path
    else
      flash[:notice] = 'There was an error creating your plan. Did you forget mentioning your plan?'
      redirect_to concerts_path
    end
  end
end