class AccessCodesController < ApplicationController
  before_action :verify_admin

  def index
    @access_codes = AccessCode.all
    @new_access_code = AccessCode.new
  end

  def create
    begin
      AccessCode.generate!(params['access_code']['email'])
    rescue => e
      flash[:danger] = 'An access code already exists for this email'
    end
    redirect_to access_codes_path
  end

  def destroy
    access_code = AccessCode.find(params[:id])
    access_code.destroy!
    redirect_to access_codes_path
  end

  private

  def verify_admin
    current_user.present? && current_user.admin?
  end
end
