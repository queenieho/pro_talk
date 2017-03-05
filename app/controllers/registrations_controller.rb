class RegistrationsController < Devise::RegistrationsController

  def new
    @access_code = AccessCode.new
    super
  end

  def create
    params[:user][:password_confirmation] = params[:user][:password]
    super
  end

  def edit
    super
  end

  def destroy
    super
  end

  def cancel
    super
  end

  protected

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  # # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   params.permit(user: [:name, :email, :invite_code, :discount_code, :referral_code])
  # end

  # # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   params.permit(user: [:phone, :ok_to_text, :first_name, :last_name, :primary_address, :primary_unit_address, :primary_city, :primary_state, :primary_postal_code, :primary_address_type, :secondary_address, :secondary_unit_address, :secondary_city, :secondary_postal_code, :secondary_state], patient: [:birthdate, :bc_days_remaining, :direct_md_name, :direct_md_phone, :direct_md_address, :direct_md_city, :direct_md_state])
  # end

  # # The path used after sign up.
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

  # # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end