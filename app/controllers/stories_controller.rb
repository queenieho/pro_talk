class StoriesController < ApplicationController
  before_action :find_user

  def index
    @stories = Story.all
  end

  def new
  end

  def create
  end

  def show
  end
  
  def edit
  end

  def update
  end

  def delete
  end




  private
  def find_user
    @user = User.find(params[:user_id])
  end

end
