Kit.delete_all
Item.delete_all
City.delete_all
Plan.delete_all
CityConnection.delete_all
EmergencyStory.delete_all
EmergencyData.delete_all

plan = Plan.create! emergency_type_cd: 0

city = City.new name: 'city'
city.plan = plan
city.save(validate: false)

city_connection = CityConnection.create!
selectedStory = EmergencyStory.create! name: 'Selected story', location: 'Example Location', story: 'Story details...', call_to_action_cd: 0, selected: true
emergency_data = EmergencyData.create! map_url: 'http://google.org/crisismap/a/gmail.com/SF72?hl=en&embedded=true', citizen_timeline_id: '364391164582969346', partner_timeline_id: '390535611100053504', transportation_timeline_id: '370622485349146624'

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


Mode.delete_all

status = Mode.create(em_mode: false, title: "Simulation: 4.3 earthquake strikes the San Andreas Fault.", text: "Thursday at 5:56 am. The epicenter was near Santa Cruz, CA.",
  recommendation_1_title: "Drop, cover and hold on.", recommendation_1_text: "Drop down and get under a strong table. If you are not near a table, drop against an interior wall and cover your head and neck with your arms. Stay away from windows.",
  recommendation_2_title: "Stay put.", recommendation_2_text: "Whether you're in a car, bed, or public place, stay put and wait until the shaking stops. If you're outdoors, steer clear of wires or falling objects. The only time not to stay put? If you're near the coast in an earthquake, immediately go to high ground, as tsunamis often follow.",
  recommendation_3_title: "Stay calm.", recommendation_3_text: "Keep calm and carry on. Keeping your wits about you will ensure that you make safe choices for yourself and those around you.")

if status
  puts "Preview mode created"
else
  puts "Preview mode already exist"
end

status = Mode.create(em_mode: true, title: "Simulation: 4.3 earthquake strikes the San Andreas Fault.", text: "Thursday at 5:56 am. The epicenter was near Santa Cruz, CA.",
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
