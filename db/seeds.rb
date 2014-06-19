#encoding: utf-8

Kit.delete_all
Item.delete_all
City.delete_all
Plan.delete_all
CityConnection.delete_all
EmergencyStory.delete_all
EmergencyData.delete_all
About.delete_all
Mode.delete_all

plan = Plan.create! emergency_type_cd: 0

city = City.new name: 'city', color_cd: 0
city.plan = plan
city.save(validate: false)

city_connection = CityConnection.create!
selectedStory = EmergencyStory.create! name: 'Selected story', location: 'Example Location', story: 'Story details...', call_to_action_cd: 0, selected: true
emergency_data = EmergencyData.create! map_url: 'http://google.org/crisismap/a/gmail.com/SF72?hl=en&embedded=true', citizen_timeline_id: '364391164582969346', partner_timeline_id: '390535611100053504', transportation_timeline_id: '370622485349146624', your_hashtag_timeline_id: '370622485349146624'
about = About.create! brought_to_you_by: 'Your organization'

4.times do |i|
  EmergencyStory.create! name: "Story \##{i}", location: 'Example Location', story: 'Story details...', call_to_action_cd:0
end

if AdminUser.create(email: 'admin@sf72.org', password: '123456')
  puts "Admin user created"
else
  puts "Admin user already exist"
end

# Creating Supplies

# Creating ESSENTIAL supplies
status = Item.create(
  category: Categories::ESSENTIAL.to_s,
  title: 'Water',
  use_case: 'Everyone enjoys a tall drink of water. Stay hydrated by gathering one gallon per person, per day.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156140/yj0oxsywjmnwbcvk1bt9.png",
  order: 0
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

# Creating Supplies

# Creating ESSENTIAL supplies
status = Item.create(
  category: Categories::ESSENTIAL.to_s,
  title: 'Water',
  use_case: 'Everyone enjoys a tall drink of water. Stay hydrated by gathering one gallon per person, per day.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156140/yj0oxsywjmnwbcvk1bt9.png",
  order: 0
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::ESSENTIAL.to_s,
  title: 'First aid kit',
  use_case: 'You might need to be able to patch up small scrapes until help arrives. Channel your inner Scout and keep a first aid kit on hand.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156142/nhmbdctuxqgqzimnyg1g.png",
  order: 1
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::ESSENTIAL.to_s,
  title: 'Flashlight and extra batteries',
  use_case: 'While candles are great for ambience, a good flashlight is invaluable for navigating if power is out. Simply put: it buys you freedom.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156144/khftzdejjie8i3jgogwn.png",
  order: 2
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::ESSENTIAL.to_s,
  title: 'Fire extinguisher',
  use_case: 'You didn\'t start the fire. But you can help extinguish it. Stash a fire extinguisher with your supplies so that you can stay safe.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156145/qkyeoyitydxzv8maov0v.png",
  order: 3
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::ESSENTIAL.to_s,
  title: 'Manual can opener',
  use_case: 'Just like when camping, in an emergency an old fashioned can opener is just the ticket. Impress your friends with your canned culinary choices.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156145/njgmdu21vfanotzuzzzx.png",
  order: 4
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::ESSENTIAL.to_s,
  title: 'Non-perishable food',
  use_case: 'Next time you\'re at the grocery store, add extra shelf-stable foods (that you like to eat!) to your basket. We recommend 3 days of food per person.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156134/iybtqutds2nqagajwqbs.png",
  order: 5
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

# Creating USEFUL supplies
status = Item.create(
  category: Categories::USEFUL.to_s,
  title: 'Warm clothes and sturdy shoes',
  use_case: 'You never know when an emergency might happen — or what you might (or might not) be wearing. Be ready for the elements by setting aside warm clothes and walking shoes.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156135/pvrgzmaasntweh6kbugy.png",
  order: 0
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::USEFUL.to_s,
  title: 'Radio (battery operated or hand crank)',
  use_case: 'Feeling safe starts with knowing what\'s going on—so tune into the radio. Check 740AM for live updates—and your favorite radio station to pass the time.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156136/wavazhmfgvpaikycpcjk.png",
  order: 1
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::USEFUL.to_s,
  title: 'Cash',
  use_case: 'In an emergency, credit cards might not work, and cash becomes important. Protect your purchasing power by stashing small bills.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156143/xhfbkepag6ahijdkz4tn.png",
  order: 2
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::USEFUL.to_s,
  title: 'Sleeping bag or blankets',
  use_case: 'Keeping warm is crucial. Blankets and sleeping bags will help you stay snug, even when the fog rolls in—or if the power goes out.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156133/bgbxp62synwcgoyxuepq.png",
  order: 3
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::USEFUL.to_s,
  title: 'Cellphone charger (battery operated or car plug-in)',
  use_case: 'A battery operated phone charger, or one that plugs into your car, will help you stay informed, take photos, and communicate in an emergency.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156136/whqpw70hhovoddwlarhq.png",
  order: 4
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::USEFUL.to_s,
  title: 'Tools',
  use_case: 'A basic toolkit with items like a hammer and duct tape will help you turn off the gas, repair broken windows, or board up your home.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156137/tf8ehyafwckk7kmaobb2.png",
  order: 5
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

# Creating PERSONAL supplies
status = Item.create(
  category: Categories::PERSONAL.to_s,
  title: 'Prescriptions',
  use_case: 'Plan for your personal health. Keep a 3-day dose of any medicine you take on a regular basis, in case the pharmacy is closed.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156140/sadtcnz44thr3wcpsntw.png",
  order: 0
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::PERSONAL.to_s,
  title: 'Sweet (or salty) treats',
  use_case: 'What non-perishable comfort food would lift your spirits? A supply of chocolate, dried fruit, or nuts with your emergency snacks might make you smile, and help you make friends.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156138/ny1scnnxv4h9safuljvw.png",
  order: 1
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::PERSONAL.to_s,
  title: 'Personal hygiene & sanitation items',
  use_case: 'Toilet paper, feminine supplies, hand sanitizer, a toothbrush, soap, unscented bleach, and heavy duty garbage bags are a good place to start.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156142/ejgefcwzoj66544tktbl.png",
  order: 2
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::PERSONAL.to_s,
  title: 'Personal documents',
  use_case: 'Upload copies of your driver\'s license, passport, leases, titles, and contact list to the cloud. Protect your assets, by going digital. Or make photocopies.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156136/uxsobm3pq9vjxpqdq0wt.png",
  order: 3
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::PERSONAL.to_s,
  title: 'Children\'s toys and games',
  use_case: 'What unique items would make your family feel better in an emergency? Favorite games? Special toys? Little things can make a big difference.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156138/xdiggz9qjvjr9hr22dby.png",
  order: 4
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

status = Item.create(
  category: Categories::PERSONAL.to_s,
  title: 'Pet items',
  use_case: 'Don\'t forget to store dog food, toys, or extra water for your pets.',
  remote_image_url: "http://res.cloudinary.com/hlu4lzcwg/image/upload/v1383156139/dbpkljqy6lljejnodnhh.png",
  order: 5
  )
if status.valid?
  puts "Item created"
else
  puts "Item already exist"
end

# Creating Kits (Items to Share )
# status = Kit.create(
#   title: 'Grill',
#   use_case: '';
#   remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703487/survival_f2b7th.jpg"
#   )
# if status.valid?
#   puts "Kit created"
# else
#   puts "Kit already exist"
# end

# status = Kit.create(
#   title: 'Guitar',
#   use_case: '';
#   remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703487/survival_f2b7th.jpg"
#   )
# if status.valid?
#   puts "Kit created"
# else
#   puts "Kit already exist"
# end

# status = Kit.create(
#   title: 'Wine',
#   use_case: '';
#   remote_image_url: "http://res.cloudinary.com/zauber-labs/image/upload/v1374703487/survival_f2b7th.jpg"
#   )
# if status.valid?
#   puts "Kit created"
# else
#   puts "Kit already exist"
# end



# Creating Networks

if city_connection.city_networks << CityNetwork.new(
  # image: ,
  headline: 'AirBnB',
  now: 'Create an AirBnB proﬁle so you are ready to ﬁnd or share a place to stay if anything happens.',
  in_an_emergency: 'Find a place to stay, or share your place with those in need.',
  network_url: 'airbnb.com',
  included: true
  )
puts "Network created"
else
puts "Error creating Network"
end

if city_connection.city_networks << CityNetwork.new(
  # image: ,
  headline: 'Meet your neighbors on Nextdoor',
  now: 'Sign up for Nextdoor to meet your neighbors and create a community disaster preparedness plan.',
  in_an_emergency: 'Log onto Nextdoor to share local information and resources with people who live near you.',
  network_url: 'nextdoor.com',
  included: true
  )
puts "Network created"
else
puts "Error creating Network"
end

# Creating Partners
if city_connection.city_networks << CityResource.new(
  # image: ,
  name: 'American Red Cross',
  description: 'Provides a variety of trainings including first aid, CPR, and how to prepare for emergencies',
  website: 'www.redcross.org',
  included: true
  )
puts "Partner created"
else
puts "Error creating Partner"
end

# Creating Mode
status = Mode.create!(em_mode: false, title: "Emergency Title", text: "Emergency description")

if status
  puts "Mode created"
end

# Creating Quick Guides

# status = QuickGuide.create(
#   em_type: 'Quake',
#   tip_1_title: 'Drop, cover and hold.',
#   tip_1_description: 'Duck under a strong table or desk. Cover your head and neck with your arms against an interior wall. Stay away from windows.',
#   tip_2_title: 'Stay calm.',
#   tip_2_description: 'Keep calm and carry on. Keeping your wits about you will ensure that you make safe choices for yourself and those around you.',
#   tip_3_title: 'Stay put.',
#   tip_3_description: 'Shelter in place–whether you\'re in a car, in bed, or in a public place. Do not try to run out of the building during strong shaking, hold tight until the shaking stops. If you\'re outdoors, steer clear of wires or falling objects.',
#   tip_after_1_title: 'Leave a trail.',
#   tip_after_1_description: 'If you leave home, leave a sign telling friends and family your location. Digitaly savvy? Send a tweet or Facebook update telling everyone know that you\'re ok.',
#   tip_after_2_title: 'Stay tuned.',
#   tip_after_2_description: 'Listen to the radio for important information and instructions. Remember that aftershocks, which generally follow large quakes, can be large enough to cause damage in their own right.',
#   tip_after_4_title: 'Check back here.',
#   tip_after_4_description: 'In an emergency, this site will go into Crisis Mode and will provide a live stream of official updates as well as crowdsourced reports.',
#   )
# if status.valid?
#   puts "Quake Quick Guide created"
# else
#   puts "Quake Quick Guide already exist"
# end

# status = QuickGuide.create(
#   em_type: 'Hurricane',
#   tip_1_title: 'Listen for Updates',
#   tip_1_description: 'Listen to a <a href="http://www.nws.noaa.gov/nwr/">NOAA Weather Radio</a> or local news for critical information from the National Weather Service. Be alert to changing weather conditions and follow official instructions.',
#   tip_2_title: 'Turn off Utilities',
#   tip_2_description: '<a href="http://www.ready.gov/utility-shut-safety">Turn off utilities</a> and propane tanks if instructed to do so. Otherwise, turn the refrigerator to its coldest setting and keep its doors closed (here\'s how to <a href="http://www.ready.gov/food">keep food safe</a> during and after an emergency).',
#   tip_3_title: 'Save a Supply of Water.',
#   tip_3_description: 'Ensure a <a href="http://www.ready.gov/managing-water">supply of water</a> for sanitary purposes such as cleaning and flushing toilets. Fill the bathtub and large containers with water.',
#   tip_after_1_title: 'Find your family.',
#   tip_after_1_description: 'If you are separated from your family, use your <a href="#">family communications plan</a>, contact the American Red Cross (ARC) at 1-800-RED-CROSS/1-800-733-2767 or visit the ARC Safe and Well site: <a href="http://www.safeandwell.org/">www.safeandwell.org</a>.',
#   tip_after_2_title: 'Inspect your home for damage.',
#   tip_after_2_description: 'Take pictures of damage (both of the building and its contents) for insurance purposes. If safety is a concern, have your residence inspected by a building inspector or structural engineer before entering.',
#   tip_after_3_title: 'Practice Fire Safety.',
#   tip_after_3_description: 'Use battery-powered flashlights in the dark. DO NOT use candles, in order to prevent fires.',
#   tip_after_4_title: 'Check back here.',
#   tip_after_4_description: 'In an emergency, this site will go into Crisis Mode and will provide a live stream of official updates as well as crowdsourced reports.',
#   )
# if status.valid?
#   puts "Hurricane Quick Guide created"
# else
#   puts "Hurricane Quick Guide already exist"
# end

# status = QuickGuide.create(
#   em_type: 'Flood',
#   tip_1_title: 'Turn off utilities.',
#   tip_1_description: '<a href="http://www.ready.gov/utility-shut-safety">Turn off utilities</a> at the main switches or valves if instructed to do so. Disconnect appliances. Do not touch electrical equipment if you are wet or standing in water.',
#   tip_2_title: 'Do not walk through moving water.',
#   tip_2_description: 'Six inches of moving water can make you fall. If you must walk in water, walk where it isn’t moving. Check the firmness of the ground in front of you with a stick.',
#   tip_3_title: 'Steer clear of flooded areas.',
#   tip_3_description: 'Do not drive into flooded areas. If a few inches of floodwater rise around your car, abandon the car for higher ground. If flood water rises into your car, get on the roof.',
#   tip_after_1_title: 'Avoid moving water',
#   tip_after_1_description: 'Water only six inches deep can sweep you off your feet!',
#   tip_after_2_title: 'Stay on firm ground.',
#   tip_after_2_description: '',
#   tip_after_3_title: 'Avoid standing water of any kind.',
#   tip_after_3_description: 'Standing water may be electrically charged from underground or downed power lines.',
#   tip_after_4_title: 'Check back here.',
#   tip_after_4_description: 'In an emergency, this site will go into Crisis Mode and will provide a live stream of official updates as well as crowdsourced reports.',
#   )
# if status.valid?
#   puts "Flood Quick Guide created"
# else
#   puts "Flood Quick Guide already exist"
# end

# status = QuickGuide.create(
#   em_type: 'Tornado',
#   tip_1_title: 'Seek shelter immediately.',
#   tip_1_description: 'Protect your head; most injuries associated with winds are from flying debris.',
#   tip_2_title: 'Put on sturdy shoes.',
#   tip_2_description: '',
#   tip_3_title: 'Do not open windows',
#   tip_3_description: '',
#   tip_after_1_title: 'Protect yourself from debris.',
#   tip_after_1_description: 'Wear sturdy shoes or boots, long sleeves, and gloves when handling or walking on debris.',
#   tip_after_2_title: 'Look out for broken glass.',
#   tip_after_2_description: 'Be aware of exposed nails and broken glass.',
#   tip_after_3_title: 'Steer clear of power lines.',
#   tip_after_3_description: 'Do not touch downed power lines or objects in contact with downed lines. Report electrical hazards to the police and the utilities.',
#   tip_after_4_title: 'Check back here.',
#   tip_after_4_description: 'In an emergency, this site will go into Crisis Mode and will provide a live stream of official updates as well as crowdsourced reports.',
#   )
# if status.valid?
#   puts "Tornado Quick Guide created"
# else
#   puts "Tornado Quick Guide already exist"
# end

# Creating Stories

# if emergency_story << EmergencyStory.new(
#   image: ,
#   name: 'Charles',
#   location: 'The Embarcadero, San Francisco',
#   story: 'It doesn\'t matter if it\'s good times or bad times, we all need to eat. It\'s a natural fit for chefs to stand up to help (in anemergency). Friends—both digitally and in person.',
#   selected: true
#   )
# puts "Story #1 created"
# else
# puts "Error creating Story #1"
# end

# if emergency_story << EmergencyStory.new(
#   image: ,
#   name: 'Lindsay',
#   location: 'SOMA',
#   story: 'We won\'t always be able to reach our earthquake kit. We might need help or help others. we are going to need to trust each other deeply in the days following a major emergency. These relationships are the ones that are going to sustain us and save us. ',
#   selected: false,
#   call_to_action_cd: 'Use your networks'
#   )
# puts "Story #2 created"
# else
# puts "Error creating Story #2"
# end

# if emergency_story << EmergencyStory.new(
#   image: ,
#   name: 'Carol',
#   location: 'The Haight',
#   story: 'At Glide, we have a lot of emergency equipment - cots, blankets, food ready to offer. It\'s a community center where people can come together and know that they are going to be met with dignity and respect and a home, in the midst of crisis.',
#   selected: false,
#   call_to_action_cd: 'Gather your supplies'
#   )
# puts "Story #3 created"
# else
# puts "Error creating Story #3"
# end

# if emergency_story << EmergencyStory.new(
#   image: ,
#   name: 'Justin',
#   location: 'Ocean Beach',
#   story: 'We set up a list – a calling tree with our friends, and we have a meeting place. We have a general timeline – after an emergency, on the half hour, every half hour. It\'s a corner store near our houses.',
#   selected: false,
#   call_to_action_cd: 'Use your networks'
#   )
# puts "Story #4 created"
# else
# puts "Error creating Story #4"
# end

# if emergency_story << EmergencyStory.new(
#   image: ,
#   name: 'Roberta and Monica',
#   location: 'The Sunset',
#   story: 'At Glide, we have a lot of emergency equipment - cots, blankets, food ready to offer. It\'s a community center where people can come together and know that they are going to be met with dignity and respect and a home, in the midst of crisis.',
#   selected: false,
#   call_to_action_cd: 'Gather your supplies'
#   )
# puts "Story #5 created"
# else
# puts "Error creating Story #5"
# end