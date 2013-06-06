class PlansController < ApplicationController
  before_filter :require_login

  def index
    @plans = Plan.recent.includes(:users)
    current_user_plans
  end

  def show
    @plan     = Plan.find(params[:id])
    @comments = @plan.comments.includes(:user)
    @users    = @plan.users.reverse
    current_user_plans
  end

  def user_plans
    @plans = current_user.plans.recent.includes(:users)
    current_user_plans

    render :index
  end

  def near_plans
    @plans = Plan.where(location: current_user.coordinates).recent.includes(:users)
    current_user_plans

    render :index
  end

  def join
    plan = Plan.find(params[:id])

    unless plan.users.include?(current_user)
      current_user.plans << plan
    end

    redirect_to plan_path(plan.id), notice: "You have joined this plan."
  end

  def create
    plan = Plan.create_for_user(current_user, params_processor(params))

    if plan.save
      flash[:notice] = 'Your plan was successfully created.'
      redirect_to plan_path(plan.id)
    else
      flash[:alert]  = 'There was an error creating your plan. Did you forget mentioning your plan?'
      redirect_to concerts_path
    end
  end

  private

  def current_user_plans
    @current_user_plans = current_user.plans.to_a
  end

  def params_processor(params)
    params.except(:controller,
                  :action,
                  :utf8,
                  :authenticity_token,
                  :commit)
  end
end
