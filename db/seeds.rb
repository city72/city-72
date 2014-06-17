Story.delete_all
Kit.delete_all
Item.delete_all
City.delete_all
Plan.delete_all
CityConnection.delete_all

plan = Plan.create! emergency_type_cd: 0

city = City.new name: 'Example city'
city.plan = plan
city.save(validate: false)

city_connection = CityConnection.create!

if AdminUser.create(email: 'admin@sf72.org', password: '123456')
  puts "Admin user created"
else
  puts "Admin user already exist"
end

story_data = {
  video_url: 'http://player.vimeo.com/video/5772729',
  event: 'Hurricane Sandy',
  category: StoryCategories::HURRICANE_OR_TORNADO,
  person: 'Kristin',
  person_type: PersonTypes::COMMUNITY_HUB,
  location: 'New York City',
  date: 'Nov 2012',
  story: 'Kirstin was living with three roommates in her East Villiage apartment when Hurricane Sandy struck. Kirstin\'s apartment quickly became the tech hub of her neighborhood. Hear her story.',
  story_header: 'Hurricane',
  quote: 'After Hurricane Sandy we set up a generator and started charging people\'s phones',
  item1_quote: 'It means you can leave the house at night.',
  item2_quote: 'We didn\'t use it but it helped us feel safe.',
  item3_quote: 'Our friends came around because we had wine.',
  item1_subtitle: 'Emergency Supplies',
  item2_subtitle: 'Meetup Plan',
  item3_subtitle: 'Out of State Contact',
  remote_item1_image_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg',
  remote_item2_image_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg',
  remote_item3_image_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg',
  remote_video_image_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374703527/Hurracane_Sandy_cxijg8.jpg',
  items_images_display_type: StoryItemsDisplayTypes::COLUMN_3_SQUARE,
  items_title: StoryItemsTitles::HOW_I_AM_PREPARED
}

if Story.create(story_data)
  puts "Story created"
else
  puts "Story already exist"
end

stories = [
  ['Jim', PersonTypes::DISASTER_SURVIVOR, 'New Orleans', 'Jan 2005', 'Hurricane Katrina', StoryCategories::HURRICANE_OR_TORNADO,
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703527/katrina_dwkp12.jpg'],
  ['Jennifer and Peter', PersonTypes::DISASTER_SURVIVOR, 'San Francisco', 'Jun 1926', 'Great San Francisco Fire and Earthquake', StoryCategories::EARTHQUAKE,
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703526/earthquake_l6bq6t.jpg'],
  ['Bruce', PersonTypes::COMMUNITY_HUB, 'Los Angeles', 'Jul 1980', 'Heat Wave of 1980', StoryCategories::OTHER_EMERGENCY,
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703526/heat-wave_y97b9d.jpg'],
  ['Pedro', PersonTypes::DISASTER_SURVIVOR, 'Santiago de Chile', 'Mar 2010', 'Chilean earthquake of 2010', StoryCategories::EARTHQUAKE,
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703526/2010-Chile-Earthquake-81_wvcuek.jpg'],
  ['Ronaldo', PersonTypes::DISASTER_SURVIVOR, 'Rio de Janeiro', 'Oct 2011', 'Brazilian floods of 2011', StoryCategories::TSUNAMI_OR_FLOOD,
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703528/rio-floods_h751xk.jpg'],
  ['Jane', PersonTypes::DISASTER_SURVIVOR, 'Mississippi River Valley', 'Mar 2011', 'mississippi river floods of 2011', StoryCategories::TSUNAMI_OR_FLOOD,
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703527/Mississippi_River_Flooding_t607_hqb2ql.jpg'],
  ['Paul', PersonTypes::COMMUNITY_HUB, 'American Samoa', 'Jun 2011', 'Samoa earthquake of 2009', StoryCategories::EARTHQUAKE,
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703528/samoa_vileze.jpg',
        nil, nil, true],
  ['Brad', PersonTypes::DISASTER_SURVIVOR, 'California', 'Oct 2007', 'California wildfires of 2007', StoryCategories::OTHER_EMERGENCY,
        'http://res.cloudinary.com/zauber-labs/image/upload/v1374703528/wildfire_gy1hl6.jpg',
        StoryItemsDisplayTypes::COLUMN_2_BLEED, StoryItemsTitles::WHAT_SHOULD_I_OFFER]
]

stories.each do |person, person_type, location, date, event, category, remote_video_image_url, items_images_display_type, items_title, only_two_items|
  story_data[:person] = person
  story_data[:person_type] = person_type
  story_data[:location] = location
  story_data[:date] = date
  story_data[:event] = event
  story_data[:category] = category
  story_data[:remote_video_image_url] = remote_video_image_url
  story_data[:items_images_display_type] = items_images_display_type || story_data[:items_images_display_type]
  story_data[:items_title] = items_title || story_data[:items_title]
  if only_two_items
    story_data[:remote_item3_image_url] = ''
  else
    story_data[:remote_item3_image_url] = 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg'
  end
  if Story.create(story_data)
    puts "Story created"
  else
    puts "Story already exist"
  end
end

status = Kit.create(
  title: 'Adventurer Kit',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703487/survival_f2b7th.jpg"
  )
if status
  puts "Kit created"
else
  puts "Kit already exist"
end

status = Kit.create(
  title: 'Lifeline Kit',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703486/food_bgf0f8.jpg"
  )
if status
  puts "Kit created"
else
  puts "Kit already exist"
end

status = Kit.create(
  title: 'Emergency Kit',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703487/emergency-survival-kit_avucbi.jpg"
  )
if status
  puts "Kit created"
else
  puts "Kit already exist"
end

status = Item.create(
  category: Categories::PERSONAL.to_s,
  title: 'Warm Clothes',
  use_case: 'Something witty and human about canned food. More copy here to figure out what the word count can be for this roolover on the image. Your friends came around',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703495/first_aid2_dxovpo.jpg",
  order: 0
  )
if status
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::USEFUL.to_s,
  title: 'Bottled Water',
  use_case: 'Something witty and human about canned food. More copy here to figure out what the word count can be for this roolover on the image. Your friends came around',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703495/water_y78yt0.jpg",
  order: 1
  )

if status
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::USEFUL.to_s,
  title: 'First Aid Kit',
  use_case: 'Something witty and human about canned food. More copy here to figure out what the word count can be for this roolover on the image. Your friends came around',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703495/first_aid_gwjrzt.jpg",
  order: 2
  )

if status
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::ESSENTIAL.to_s,
  title: 'First Aid Kit',
  use_case: 'Something witty and human about canned food. More copy here to figure out what the word count can be for this roolover on the image. Your friends came around',
  remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703495/first_aid_gwjrzt.jpg",
  order: 3
  )

if status
  puts "Item created"
else
  puts "Item already exist"
end

CitizenFeed.delete_all

if CitizenFeed.create(widget_id: "364391164582969346")
  puts "CitizenFeed created"
else
  puts "CitizenFeed already exist"
end

Mode.delete_all

status = Mode.create(em_mode: false, title: "Simulation: 8.3 earthquake strikes the San Andreas Fault.", text: "Thursday at 5:56 am. The epicenter was near Santa Cruz, CA.",
  recommendation_1_title: "Drop, cover and hold on.", recommendation_1_text: "Drop down and get under a strong table. If you are not near a table, drop against an interior wall and cover your head and neck with your arms. Stay away from windows.",
  recommendation_2_title: "Stay put.", recommendation_2_text: "Whether you're in a car, bed, or public place, stay put and wait until the shaking stops. If you're outdoors, steer clear of wires or falling objects. The only time not to stay put? If you're near the coast in an earthquake, immediately go to high ground, as tsunamis often follow.",
  recommendation_3_title: "Stay calm.", recommendation_3_text: "Keep calm and carry on. Keeping your wits about you will ensure that you make safe choices for yourself and those around you.")

if status
  puts "Preview mode created"
else
  puts "Preview mode already exist"
end

status = Mode.create(em_mode: true, title: "Simulation: 8.3 earthquake strikes the San Andreas Fault.", text: "Thursday at 5:56 am. The epicenter was near Santa Cruz, CA.",
  recommendation_1_title: "Drop, cover and hold on.", recommendation_1_text: "Drop down and get under a strong table. If you are not near a table, drop against an interior wall and cover your head and neck with your arms. Stay away from windows.",
  recommendation_2_title: "Stay put.", recommendation_2_text: "Whether you're in a car, bed, or public place, stay put and wait until the shaking stops. If you're outdoors, steer clear of wires or falling objects. The only time not to stay put? If you're near the coast in an earthquake, immediately go to high ground, as tsunamis often follow.",
  recommendation_3_title: "Stay calm.", recommendation_3_text: "Keep calm and carry on. Keeping your wits about you will ensure that you make safe choices for yourself and those around you.")

if status
  puts "Crisis mode created"
else
  puts "Crisis mode already exist"
end

if CurrentMode.count < 1
  puts "CurrentMode created" if CurrentMode.create mode: false
end