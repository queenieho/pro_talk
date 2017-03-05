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

end 