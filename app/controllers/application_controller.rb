class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.username.blank?
      return details_path
    elsif !current_user.agrees_to_code_of_conduct?
      return code_of_conduct_path
    else
      return stories_path
    end
  end
end
