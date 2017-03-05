class Api::V1::StoriesController < ApplicationController
  before_action :load_story
  before_action :load_tag
  before_action :verify_author

  def add_tag
    @story.tags += @tag
    @story.save!
    render json: @story, status: 200
  end

  def remove_tag
    @story.tags -= @tag
    @story.save!
    render json: @story, status: 22
  end

  private

  def load_story
    @story = Story.find(params[:id])
  end

  def load_tag
    @tag = Tag.find(params[:tag_id])
  end

  def verify_author
    return if current_user.present? && current_user == @story.author
    response = {
      message: 'You are not authorized to complete this action'
    }
    render json: response.to_json, status: 403 # Permission denied
  end
end