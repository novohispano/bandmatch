module ApplicationHelper
  def formatted_time(input)
    input.strftime("%B %d, %Y - %l:%M %p")
  end

  def path
    path = response.request.fullpath
    case path
    when "/plans"
      "All plans in BandMatch"
    when "/near_plans"
      "All plans near #{current_user.location}"
    else
      "All plans for #{current_user.name}"
    end
  end
end