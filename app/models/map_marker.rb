class MapMarker < ActiveRecord::Base
  attr_accessible :lon_lat, :message

  # By default, use the GEOS implementation for spatial columns.
  self.rgeo_factory_generator = RGeo::Geos.factory_generator

  # But use a geographic implementation for the :lonlat column.
  set_rgeo_factory_for_column(:lon_lat, RGeo::Geographic.spherical_factory(:srid => 4326))
end
