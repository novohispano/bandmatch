class CommentsController < ApplicationController
  before_filter :require_login

  def create
    attributes = params_processor(params)
    comment = Comment.create!(attributes)

    if request.xhr?
      render partial: 'plans/comment', object: comment
    else
      redirect_to plan_path(params[:plan_id]), notice: "Your comment was created."
    end
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
