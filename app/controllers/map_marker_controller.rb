class MapMarkerController < ApplicationController

	def index
		@markers = MapMarker.all
	end

  def create
  	m = MapMarker.create!(lon_lat: "POINT(#{params[:lon]} #{params[:lat]})")
  	render json: m
  end

  def delete
  	MapMarker.where(lon_lat: "POINT(#{params[:lon]} #{params[:lat]})").first.destroy
  	render json: {}
  end

  def markers_within_distance()
  	render json: MapMarker.where("ST_DWithin(ST_MakePoint(#{params[:lon]}, #{params[:lat]}), lon_lat, #{params[:max_distance]})"), root: false
  end
end
