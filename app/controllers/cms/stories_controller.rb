class Cms::StoriesController < BackOfficeController

  def show
    @city_json = CitySerializer.new(@city).to_json
    @stories = ActiveModel::ArraySerializer.new(EmergencyStory.all, each_serializer: EmergencyStorySerializer).to_json
  end

  def update
    stories = JSON.parse(params[:stories], symbolize_names: true)
    stories.each do |s|
      story = EmergencyStory.find(s[:id])
      s[:image] = params[s[:image_name]] if s[:image_name]
      story.attributes = s.except(:id, :image_url, :image_name, :new_image)
      story.save!
    end
    city = JSON.parse(params[:city], symbolize_names: true)
    @city.statement = city[:statement]
    @city.save! validate: false # City can be in an invalid state
    render status: :ok, nothing: true
  end

end