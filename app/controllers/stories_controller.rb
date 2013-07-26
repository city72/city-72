class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def show
  	@story = Story.find(params[:id])
    @related_stories = Story.where(category: @story.category).limit(3)
    related_stories_count = @related_stories.count
    if related_stories_count < 3
      @related_stories.concat Story.where("category != ?", @story.category).limit(3 - related_stories_count)
    end
  end

  def update
    story = Story.find(params[:id]).update_attributes(params[:story])
    render json: story
  end
end
