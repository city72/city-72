class StoriesController < ApplicationController
  def new
  end

  def create
  	story = Story.create!(params[:story])
  	render json: story
  end

  def show
  end

  def update
  end
end
