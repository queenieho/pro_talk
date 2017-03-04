class StoriesController < ApplicationController
  before_action :find_user

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params.merge(user_id: @user.id))
    if @story.save
      redirect_to stories_path
    else
      flash[:danger] = "Your story did not save."
      redirect_to new_story_path
    end
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

  def story_params
    params.require(:story).permit(:title,:content,:published)
  end

end
