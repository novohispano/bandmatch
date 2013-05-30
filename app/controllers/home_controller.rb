class HomeController < ApplicationController
  def show
    if current_user
      redirect_to concerts_path
    end
  end
end