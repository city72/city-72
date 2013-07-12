# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	MapMarker.delete_all

	lon = -122.431351
	lat = 37.757416
	500.times do |i|
		MapMarker.create!(lon_lat: "POINT(#{lon} #{lat})")
		lon = lon + rand(-0.001..0.001)
		lat = lat + rand(-0.001..0.001)
	end
