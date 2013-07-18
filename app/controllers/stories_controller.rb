class StoriesController < ApplicationController
  
  def index
    @stories = Story.all
  end

  def new
  end

  def create
  	story = Story.create!(params[:story])
  	render json: story
  end

  def show
  	@story = Story.find(params[:id])
  end

  def update
    story = Story.find(params[:id]).update_attributes(params[:story])
    render json: story
  end
end
