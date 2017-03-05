class Api::V1::StoriesController < ApplicationController
  before_action :load_story
  before_action :load_tag, except: [:update]
  before_action :verify_author

  def update
    begin
      @story.update!(params[:story])
      message = 'Successfully updated story'
      status = 200
    rescue => e
      message = "Unable to update story! Error: #{e}"
      status = 500
    end

    render json: { message: message }, status: status
  end

  def add_tag
    begin
      @story.tags += @tag
      @story.save!
      message = "Successfully added tag: #{ @tag.name }"
      status = 200
    rescue => e
      message = "Unable to add tag! Error: #{ e }"
      status = 500
    end

    render json: { message: message }, status: status
  end

  def remove_tag
    begin
      @story.tags -= @tag
      @story.save!
      message = "Successfully removed #{ @tag.name }"
      status = 200
    rescue => e
      message = "Unable to remove tag! Error: #{ e }"
      status = 500
    end

    render json: { message: message }, status: status
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