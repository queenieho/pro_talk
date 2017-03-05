class UsersController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery prepend: true

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
      flash[:danger] = "Your user details did not save."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to stories_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def details
    @user = current_user
  end

  private

  def confirm_login
    redirect_to login_path if current_user.nil?
  end

  def user_params
    params.require(:user).permit(:age,:city,:gender,:religion,:state,:username)
  end

end
