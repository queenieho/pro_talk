class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.verified? && current_user.stories.length <= 0
      return user_details_path
    elsif !current_.verified?
      return logout_user_path
    elsif current_user.agrees_to_code_of_conduct == false
      return code_of_conduct_path
    else
      return stories_path
    end
  end
end
