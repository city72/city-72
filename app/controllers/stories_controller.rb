class StoriesController < MostlyStaticContentController

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
    @related_stories = Story.where("category = ? AND id != ?", @story.category, @story.id).sample(3)
    related_stories_count = @related_stories.count
    if related_stories_count < 3
      @related_stories.concat Story.where("category != ?", @story.category).sample(3 - related_stories_count)
    end
  end

end
