class PlansController < ApplicationController
  before_filter :require_login

  def index
    @plans = all_plans
    current_user_plans
  end

  def show
    @plan  = Plan.find(params[:id])
    current_user_plans
  end

  def user_plans
    @plans = current_user.plans.recent.includes(:users)
    current_user_plans

    render :index
  end

  def near_plans
    @plans = all_plans.where(location: current_user.coordinates)
    current_user_plans

    render :index
  end

  def join
    plan = Plan.find(params[:id])

    unless plan.users.include?(current_user)
      current_user.plans << plan
    end

    redirect_to user_plans_path, notice: "You have joined a plan."
  end

  def create
    plan = current_user.plans.create(
      artists:         params[:artists],
      description:     params[:description],
      display_name:    params[:display_name],
      location:        current_user.coordinates,
      start:           DateTime.parse(params[:start]),
      tickets_url:     params[:tickets_url],
      venue_name:      params[:venue_name],
      venue_latitude:  params[:venue_latitude],
      venue_longitude: params[:venue_longitude]
      )

    if plan.save
      flash[:notice] = 'Your plan was successfully created.'
      redirect_to user_plans_path
    else
      flash[:alert]  = 'There was an error creating your plan. Did you forget mentioning your plan?'
      redirect_to concerts_path
    end
  end

  private

  def all_plans
    Rails.cache.fetch("plans", expires_in: 5.minutes) do
      Plan.recent.includes(:users)
    end
  end

  def current_user_plans
    @current_user_plans = current_user.plans.to_a
  end
end