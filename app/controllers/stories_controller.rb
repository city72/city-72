class StoriesController < ApplicationController
  
  def index
    stories = Story.all
    respond_to do |format|
      format.html { render template: "home/stories" }
      format.json { render json: stories }
    end
  end

  def new
  end

  def create
  	story = Story.create!(params[:story])
  	render json: story
  end

  def show
  	story = Story.find(params[:id])
  	render json: story
  end

  def update
    story = Story.find(params[:id]).update_attributes(params[:story])
    render json: story
  end
end
