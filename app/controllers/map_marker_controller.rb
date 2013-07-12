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

  def markers_within_bounds()
    render json: MapMarker.where(
                  "ST_Contains(
                    ST_SetSRID(
                      ST_MakeBox2D(
                        ST_Point(#{params[:ne_lon]}, #{params[:ne_lat]}), 
                        ST_Point(#{params[:sw_lon]}, #{params[:sw_lat]})),
                        4326),
                      lon_lat::geometry)"
                ), root: false
  end
end
