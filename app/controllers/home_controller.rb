class HomeController < ApplicationController
  def show
    if current_user
      redirect_to plans_path
    end
  end
end