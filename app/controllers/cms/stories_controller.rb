class Cms::StoriesController < BackOfficeController

  def show
    @city_json = CitySerializer.new(@city).to_json
    @stories = ActiveModel::ArraySerializer.new(EmergencyStory.all, each_serializer: EmergencyStorySerializer).to_json
  end

  def update
    stories = params[:stories]
    stories.each do |s|
      story = EmergencyStory.find(s[:id])
      story.attributes = s.except(:id)
      story.save!
    end
    @city.statement = params[:city][:statement]
    @city.save! validate: false # City can be in an invalid state
    render status: :ok, nothing: true
  end

end