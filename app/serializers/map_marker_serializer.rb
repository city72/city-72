class MapMarkerSerializer < ActiveModel::Serializer
  attributes :lon_lat

  def lon_lat
  	{ lon: object.lon_lat.x, lat: object.lon_lat.y }
  end
end
