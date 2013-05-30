class PlansController < ApplicationController
  def index
    @plans = Plan.all
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