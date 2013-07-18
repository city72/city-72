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

	Story.delete_all
	Kit.delete_all
	Item.delete_all

	story_data = {event: 'Hurricane Sandy', age: 27, person: 'Kristin', location: 'New York City', date: 'Nov 2012', civil_state: 'Single', home_type: 'apartment',
						main_story: 'Kirstin was living with three roommates in her East Villiage apartment when Hurricane Sandy struck. Kirstin\'s apartment quickly became the tech hub of her neighborhood. Hear her story.',
						main_quote: 'After Hurricane Sandy we set up a generator and started charging people\'s phones',
						remote_needed_list_1_image_url_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg',
						needed_list_1_quote: 'It means you can leave the house at night.',
						remote_needed_list_2_image_url_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg',
						needed_list_2_quote: 'We didn\'t use it but it helped us feel safe.',
						remote_needed_list_3_image_url_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg',
						needed_list_3_quote: 'Our friends came around because we had wine.',
						learned_list_1_quote: 'I wish I had set a meeting spot with my friends. Once the hurricane hit, it was too late.',
						learned_list_1_anchor: 'See the app',
						learned_list_1_href: 'http://www.zauberlabs.com/',
						learned_list_2_quote: 'I wish I had set a meeting spot with my friends. Once the hurricane hit, it was too late.',
						learned_list_2_anchor: 'Get your stuff',
						learned_list_2_href: 'http://www.zauberlabs.com/',
						learned_list_3_quote: 'Everyone has something to share. Even a bike can be an invaluable tool.',
						learned_list_3_anchor: 'Sign up for AlertSF',
						learned_list_3_href: 'http://www.zauberlabs.com/',
						remote_main_image_url_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374180775/crmev0rblqeaefgbw2ws.jpg"}

	Story.create!(story_data)
	story_data[:event] = 'Hurricane Katrina'
	Story.create!(story_data)
	story_data[:event] = 'Great San Francisco Fire and Earthquake'
	Story.create!(story_data)
	story_data[:event] = 'Heat Wave of 1980'
	Story.create!(story_data)

	Kit.create!(title: 'Adventurer Kit', url: 'http://www.amazon.com/Rothco-Deluxe-Adventurer-Survival-Knife/dp/B002PEZH3O/ref=sr_1_2?ie=UTF8&qid=1374187984&sr=8-2&keywords=survival+kits',use_case: 'aewr',
						remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374178129/toqwywzl35cqgnomdovk.jpg")
	Kit.create!(title: 'Lifeline Kit', url: 'http://www.amazon.com/Lifeline-29-Piece-Ultralight-Survival-Kit/dp/B002KV9PNA/ref=sr_1_4?ie=UTF8&qid=1374187984&sr=8-4&keywords=survival+kits', use_case: 'aewr',
						remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374178048/vlqldaitjstjmydbcmhl.jpg")
	Kit.create!(title: 'Emergency Kit', url: 'http://www.amazon.com/Quakehold-70280-Grab-n-Go-Emergency-2-Person/dp/B000FJQQVI/ref=sr_1_1?ie=UTF8&qid=1374187984&sr=8-1&keywords=survival+kits', use_case: 'aewr',
						remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374177884/vx1z5jrofcamkk1cbsjx.jpg")

	Item.create!(category: "Personal", title: 'Warm Clothes',
					use_case: 'Something witty and human about canned food. More copy here to figure out what the word count can be for this roolover on the image. Your friends came around',
					remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374180582/n0hyrxga9mkwg35id0ns.jpg")
	Item.create!(category: "Useful", title: 'Bottled Water',
					use_case: 'Something witty and human about canned food. More copy here to figure out what the word count can be for this roolover on the image. Your friends came around',
					remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg")
	Item.create!(category: "Useful", title: 'First Aid Kit',
					use_case: 'Something witty and human about canned food. More copy here to figure out what the word count can be for this roolover on the image. Your friends came around',
					remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374180484/pzkmvtm5f7r8pamzsvjf.jpg")
