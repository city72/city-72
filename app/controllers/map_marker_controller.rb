class MapMarkerController < ApplicationController

	def index

	end

  def create
  	m = MapMarker.create!(lon_lat: "POINT(#{params[:lon]} #{params[:lat]})")
  	render json: m
  end
end
