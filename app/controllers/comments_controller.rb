class CommentsController < ApplicationController
  def create
    attributes = params_processor(params)

    Comment.create(attributes)

    redirect_to plan_path(params[:plan_id]), notice: "Your comment was created."
  end

  private

  def params_processor(params)
    params.slice(
      :body,
      :plan_id,
      :user_id
      )
  end
end