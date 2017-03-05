class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:landing]
  protect_from_forgery prepend: true
  before_action :validate_code!, only: [:create]
  before_action :find_user, only: [:update, :edit, :destroy, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(verified: true))

    if @user.save
      redirect_to details_path
    else
      flash[:alert] = "Your user details did not save."
      render :new
    end
  end

  def show
    @stories = Story.where(user_id: current_user.id)
  end

  def edit
  end

  def update
    if params[:user_details] == "Save"
      @user.update(user_params)
      redirect_to code_of_conduct_path
    elsif params[:user_conduct] == "Save" && user_params[:agrees_to_code_of_conduct]
      @user.update(user_params)
      redirect_to stories_path
    elsif @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def details
    @user = current_user
  end

  def code_of_conduct
    @user = current_user
  end

  def landing
  end

  private

  def validate_code!
    return if valid_access_code?
    flash[:alert] = 'Invalid access code! Please contact your system administrator.'
    redirect_to user_logout
  end

  def find_user
    @user = User.find(params[:id])
  end

  def confirm_login
    redirect_to login_path if current_user.nil?
  end

  def valid_access_code?
    true
  end

  def user_params
    params.require(:user).permit(
      :age,:city,:gender,:religion,:state,
      :username,:agrees_to_code_of_conduct,:code
    )
  end
end
