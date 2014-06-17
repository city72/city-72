class Cms::StoriesController < BackOfficeController

  def show
    @city_json = CitySerializer.new(@city).to_json
    @stories = ActiveModel::ArraySerializer.new(EmergencyStory.all, each_serializer: EmergencyStorySerializer).to_json
  end

  def update
  end

end