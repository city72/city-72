class StoriesController < ApplicationController

  after_filter :static_content

  def index
    all_stories = EmergencyStory.order("index,id ASC").all
    @selected_story = all_stories.select {|s| s.selected}.first
    @stories = all_stories.collect.select {|s| !s.selected}
  end

end
