class StoriesController < ApplicationController
  before_action :confirm_login
  before_action :find_user
  before_action :find_story, except: [:index, :new, :create]

  def index
    @all_stories = Story.published
    @featured_story = @all_stories.first
    @stories = @all_stories[1..-1]
  end

  def new
    @story = Story.new(user_id: @user)
    if @story.save
      redirect_to edit_story_path(@story)
    else
      flash[:alert] = "Oops something went wrong."
      render :index
    end
  end

  def create
    @story = Story.new(story_params.merge(user_id: @user))
    if @story.save
      redirect_to stories_path
    else
      flash[:alert] = "Your story did not save."
      render :new
    end
  end

  def show
  end

  def edit
    @serialized_story = @story.to_json
    @tags = Tag.order(:name)
    @genders = Gender.all
    @relationships_to_abortion = RelationshipToAbortion.all
    @age_ranges = AgeRange.all
  end

  def update
    if @story.update(story_params)
      @story.published = true
      @story.save!
      redirect_to story_path(@story)
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  def support
    @support_reaction = UserReaction.create!(user_id: @user, story_id: @story, reaction_id: Reaction.find_by(kind:'support'))
  end

  def hug
    @hug_reaction = UserReaction.create!(user_id: @user, story_id: @story, reaction_id: Reaction.find_by(kind:'hug'))
  end

  def reachout
    @reachout_reaction = UserReaction.create!(user_id: @user, story_id: @story, reaction_id: Reaction.find_by(kind:'reachout'))
  end

  private

  def confirm_login
    redirect_to login_path if current_user.nil?
  end

  def find_user
    @user = current_user.id
  end

  def find_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(
      :title, :content, :published,
      :gender_id, :relationship_to_abortion_id, :age_range_id, :contact
    )
  end

end
