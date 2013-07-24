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

admin_user = AdminUser.where(email: 'admin@sf72.org').first

AdminUser.create!(email: 'admin@sf72.org', password: '123456') unless admin_user

story_data = {
  video_url: 'http://player.vimeo.com/video/5772729',
  event: 'Hurricane Sandy',
  person: 'Kristin',
  location: 'New York City',
  date: 'Nov 2012',
  story: 'Kirstin was living with three roommates in her East Villiage apartment when Hurricane Sandy struck. Kirstin\'s apartment quickly became the tech hub of her neighborhood. Hear her story.',
  story_header: 'Hurricane',
  quote: 'After Hurricane Sandy we set up a generator and started charging people\'s phones',
  remote_item1_image_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg',
  item1_quote: 'It means you can leave the house at night.',
  remote_item2_image_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg',
  item2_quote: 'We didn\'t use it but it helped us feel safe.',
  remote_item3_image_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg',
  item3_quote: 'Our friends came around because we had wine.',
  lesson1_quote: 'I wish I had set a meeting spot with my friends. Once the hurricane hit, it was too late.',
  lesson2_quote: 'I wish I had set a meeting spot with my friends. Once the hurricane hit, it was too late.',
  lesson3_quote: 'Everyone has something to share. Even a bike can be an invaluable tool.',
  remote_video_image_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374703527/Hurracane_Sandy_cxijg8.jpg'
}

Story.create!(story_data)

stories = [
  ['Jim', 'New Orleans', 'Jan 2005', 'Hurricane Katrina', 
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703527/katrina_dwkp12.jpg'],
  ['Jennifer and Peter', 'San Francisco', 'Jun 1926', 'Great San Francisco Fire and Earthquake',
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703526/earthquake_l6bq6t.jpg'],
  ['Bruce', 'Los Angeles', 'Jul 1980', 'Heat Wave of 1980',
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703526/heat-wave_y97b9d.jpg'],
  ['Pedro', 'Santiago de Chile', 'Mar 2010', 'Chilean earthquake of 2010',
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703526/2010-Chile-Earthquake-81_wvcuek.jpg'],
  ['Ronaldo', 'Rio de Janeiro', 'Oct 2011', 'Brazilian floods of 2011',
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703528/rio-floods_h751xk.jpg'],
  ['Jane', 'Mississippi River Valley', 'Mar 2011', 'mississippi river floods of 2011',
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703527/Mississippi_River_Flooding_t607_hqb2ql.jpg'],
  ['Paul', 'American Samoa', 'Jun 2011', 'Samoa earthquake of 2009',
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703528/samoa_vileze.jpg'],
  ['Brad', 'California', 'Oct 2007', 'California wildfires of 2007',
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703528/wildfire_gy1hl6.jpg']
]

stories.each do |person, location, date, event, remote_video_image_url|
  story_data[:person] = person
  story_data[:location] = location
  story_data[:date] = date
  story_data[:event] = event
  story_data[:remote_video_image_url] = remote_video_image_url
  Story.create!(story_data)
end

Kit.create!(
  title: 'Adventurer Kit',
  url: 'http://www.amazon.com/Rothco-Deluxe-Adventurer-Survival-Knife/dp/B002PEZH3O/ref=sr_1_2?ie=UTF8&qid=1374187984&sr=8-2&keywords=survival+kits',use_case: 'aewr',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703487/survival_f2b7th.jpg"
  )
Kit.create!(
  title: 'Lifeline Kit',
  url: 'http://www.amazon.com/Lifeline-29-Piece-Ultralight-Survival-Kit/dp/B002KV9PNA/ref=sr_1_4?ie=UTF8&qid=1374187984&sr=8-4&keywords=survival+kits', use_case: 'aewr',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703486/food_bgf0f8.jpg"
  )
Kit.create!(
  title: 'Emergency Kit',
  url: 'http://www.amazon.com/Quakehold-70280-Grab-n-Go-Emergency-2-Person/dp/B000FJQQVI/ref=sr_1_1?ie=UTF8&qid=1374187984&sr=8-1&keywords=survival+kits', use_case: 'aewr',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703487/emergency-survival-kit_avucbi.jpg"
  )

Item.create!(
  category: Categories::PERSONAL.to_s,
  title: 'Warm Clothes',
  use_case: 'Something witty and human about canned food. More copy here to figure out what the word count can be for this roolover on the image. Your friends came around',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703495/first_aid2_dxovpo.jpg"
  )

Item.create!(
  category: Categories::USEFUL.to_s,
  title: 'Bottled Water',
  use_case: 'Something witty and human about canned food. More copy here to figure out what the word count can be for this roolover on the image. Your friends came around',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703495/water_y78yt0.jpg"
  )

Item.create!(
  category: Categories::USEFUL.to_s,
  title: 'First Aid Kit',
  use_case: 'Something witty and human about canned food. More copy here to figure out what the word count can be for this roolover on the image. Your friends came around',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703495/first_aid_gwjrzt.jpg"
  )

Item.create!(
  category: Categories::ESSENTIAL.to_s,
  title: 'First Aid Kit',
  use_case: 'Something witty and human about canned food. More copy here to figure out what the word count can be for this roolover on the image. Your friends came around',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703495/first_aid_gwjrzt.jpg"
  )
