module ApplicationHelper
  def controller?(*controller)
    return "nav-link active" if controller.include?(params[:controller])
    "nav-link"
  end
end
