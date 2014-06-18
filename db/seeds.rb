Kit.delete_all
Item.delete_all
City.delete_all
Plan.delete_all
CityConnection.delete_all
EmergencyStory.delete_all

plan = Plan.create! emergency_type_cd: 0

city = City.new name: 'Example city'
city.plan = plan
city.save(validate: false)

city_connection = CityConnection.create!

selectedStory = EmergencyStory.create! name: 'Selected story', location: 'Example Location', story: 'Story details...', call_to_action_cd: 0, selected: true

4.times do |i|
  EmergencyStory.create! name: "Story \##{i}", location: 'Example Location', story: 'Story details...', call_to_action_cd:0
end

if AdminUser.create(email: 'admin@sf72.org', password: '123456')
  puts "Admin user created"
else
  puts "Admin user already exist"
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
