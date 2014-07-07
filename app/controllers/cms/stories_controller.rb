class Cms::StoriesController < BackOfficeController

  def show
    @city_json = CitySerializer.new(@city).to_json
    @stories = ActiveModel::ArraySerializer.new(EmergencyStory.order("index,id ASC"), each_serializer: EmergencyStorySerializer).to_json
  end

  def update
    jstory = JSON.parse(params[:story], symbolize_names: true)
    jstory = jstory.except(:image_url, :image_name, :new_image)
    @story = EmergencyStory.find(params[:id])
    if params[:image]
      jstory[:image] = params[:image]
    end
    @story.update_attributes(jstory)
    if @story.save
      render status: :ok, nothing: true
    else
      render status: 422, json: @story.errors
    end
  end

  def update_statement
    jcity = JSON.parse(params[:city], symbolize_names: true)
    @city.statement = jcity[:statement]
    @city.save! validate: false # City can be in an invalid state
    render status: :ok, nothing: true
  end

end