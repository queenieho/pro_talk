class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:landing]
  protect_from_forgery prepend: true
  before_action :find_user, only: [:update, :edit, :destroy, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
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
    if @user.update(user_params)
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
  end

  def landing
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def confirm_login
    redirect_to login_path if current_user.nil?
  end

  def user_params
    params.require(:user).permit(:age,:city,:gender,:religion,:state,:username)
  end

end
