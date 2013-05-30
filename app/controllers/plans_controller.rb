class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def create
    plan = Plan.new
    plan.start        = DateTime.parse(params[:start])
    plan.display_name = params[:display_name]
    plan.description  = params[:description]
    plan.motivation   = params[:motivation]

    if plan.save
      flash[:notice] = 'Your plan was successfully created.'
      redirect_to plans_path
    else
      flash[:notice] = 'There was an error creating your plan. Try again.'
      redirect_to new_plan_path
    end
  end
end