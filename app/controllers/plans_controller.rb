class PlansController < ApplicationController
  before_filter :require_login

  def index
    @plans = Plan.all.recent
  end

  def user_plans
    @plans = current_user.plans.recent

    render :index
  end

  def near_plans
    @plans = Plan.where(location: current_user.coordinates).recent

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