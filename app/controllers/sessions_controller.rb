class SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password)
  end

  # You can put the params you want to permit in the empty array.
  def configure_sign_in_params
    params.permit(user: [:email, :password])
  end

  # def after_sign_in_path_for(resource)
  #   if current_user.verified?
  #     return user_details_path
  #   elsif current_user.stories.present
  #     return stories_path
  #   else
  #     return code_of_conduct_path
  #   end

  # end

end