class PlansController < ApplicationController
  def index
    @plans = Plans.all
  end
end