# encoding: utf-8

namespace :city72 do
  task :populate => :environment do

    city_connection = CityConnection.first

    Kit.delete_all
    Item.delete_all
    CityNetwork.delete_all
    CityResource.delete_all
    EmergencyStory.delete_all

    EmergencyStory.create! name: 'Lindsay', location: 'SOMA', image: File.open('app/assets/images/placeholder/story-2.jpg'), story: 'We won\'t always be able to reach our earthquake kit. We might need help or help others. we are going to need to trust each other deeply in the days following a major emergency. These relationships are the ones that are going to sustain us and save us. ', call_to_action_cd:0
    EmergencyStory.create! name: 'Carol', location: 'The Haight', image: File.open('app/assets/images/placeholder/story-3.jpg'), story: 'At Glide, we have a lot of emergency equipment - cots, blankets, food ready to offer. It\'s a community center where people can come together and know that they are going to be met with dignity and respect and a home, in the midst of crisis.', call_to_action_cd:1
    EmergencyStory.create! name: 'Justin', location: 'Ocean Beach', image: File.open('app/assets/images/placeholder/story-4.jpg'), story: 'We set up a list – a calling tree with our friends, and we have a meeting place. We have a general timeline – after an emergency, on the half hour, every half hour. It\'s a corner store near our houses.', call_to_action_cd:0
    EmergencyStory.create! name: 'Roberta and Monica', location: 'The Sunset', image: File.open('app/assets/images/placeholder/story-5.jpg'), story: 'At Glide, we have a lot of emergency equipment - cots, blankets, food ready to offer. It\'s a community center where people can come together and know that they are going to be met with dignity and respect and a home, in the midst of crisis.', call_to_action_cd:1
    EmergencyStory.create! name: 'Charles', location: 'The Embarcadero, San Francisco', image: File.open('app/assets/images/placeholder/story-1.jpg'), story: "It doesn't matter if it's good times or bad times, we all need to eat. It's a natural fit for chefs to stand up to help (in an emergency). Friends—both digitally and in person.", call_to_action_cd: 0, selected: true

    # Creating ESSENTIAL supplies
    status = Item.create(
      category: Categories::ESSENTIAL.to_s,
      title: 'Water',
      use_case: 'Everyone enjoys a tall drink of water. Stay hydrated by gathering one gallon per person, per day.',
      image: File.open('app/assets/images/placeholder/supply-1.png'),
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
      image: File.open('app/assets/images/placeholder/supply-2.png'),
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
      image: File.open('app/assets/images/placeholder/supply-3.png'),
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
      image: File.open('app/assets/images/placeholder/supply-4.png'),
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
      image: File.open('app/assets/images/placeholder/supply-5.png'),
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
      image: File.open('app/assets/images/placeholder/supply-6.png'),
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
      image: File.open('app/assets/images/placeholder/supply-7.png'),
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
      image: File.open('app/assets/images/placeholder/supply-8.png'),
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
      image: File.open('app/assets/images/placeholder/supply-9.png'),
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
      image: File.open('app/assets/images/placeholder/supply-10.png'),
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
      image: File.open('app/assets/images/placeholder/supply-11.png'),
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
      image: File.open('app/assets/images/placeholder/supply-12.png'),
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
      image: File.open('app/assets/images/placeholder/supply-13.png'),
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
      image: File.open('app/assets/images/placeholder/supply-14.png'),
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
      image: File.open('app/assets/images/placeholder/supply-15.png'),
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
      image: File.open('app/assets/images/placeholder/supply-16.png'),
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
      image: File.open('app/assets/images/placeholder/supply-17.png'),
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
      image: File.open('app/assets/images/placeholder/supply-18.png'),
      order: 5
      )
    if status.valid?
      puts "Item created"
    else
      puts "Item already exist"
    end

    #Creating Kits (Items to Share)

    status = Kit.create!(
      title: 'Grill',
      image: File.open('app/assets/images/placeholder/kit-1.png'),
      use_case: ''
      )
    if status.valid?
      puts "Kit created"
    else
      puts "Error creating Kit"
    end

    status = Kit.create(
      title: 'Wine',
      image: File.open('app/assets/images/placeholder/kit-2.png'),
      use_case: ''
      )
    if status.valid?
      puts "Kit created"
    else
      puts "Kit already exist"
    end

    status = Kit.create(
      title: 'Board games',
      image: File.open('app/assets/images/placeholder/kit-3.png'),
      use_case: ''
      )
    if status.valid?
      puts "Kit created"
    else
      puts "Kit already exist"
    end



    # Creating Networks

    if city_connection.city_networks << CityNetwork.new(
      logo: File.open('app/assets/images/placeholder/network-1.png'),
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
      logo: File.open('app/assets/images/placeholder/network-2.png'),
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
    if city_connection.city_resources << CityResource.new(
      logo: File.open('app/assets/images/placeholder/partner-1.png'),
      name: 'American Red Cross',
      description: 'Provides a variety of trainings including first aid, CPR, and how to prepare for emergencies',
      website: 'www.redcross.org',
      included: true
      )
    puts "Partner created"
    else
    puts "Error creating Partner"
    end



    # Creating Quick Guides
    quick_guide = QuickGuide.create(
      title: 'Quake',
      tips_attributes: [
        {
          moment_type: :during,
          title: 'Drop, cover and hold.',
          description: 'Duck under a strong table or desk. Cover your head and neck with your arms against an interior wall. Stay away from windows.'
        }, {
          moment_type: :during,
          title: 'Stay calm.',
          description: 'Keep calm and carry on. Keeping your wits about you will ensure that you make safe choices for yourself and those around you.'
        }, {
          moment_type: :during,
          title: 'Stay put.',
          description: 'Shelter in place–whether you\'re in a car, in bed, or in a public place. Do not try to run out of the building during strong shaking, hold tight until the shaking stops. If you\'re outdoors, steer clear of wires or falling objects.'
        }, {
          moment_type: :after,
          title: 'Leave a trail.',
          description: 'If you leave home, leave a sign telling friends and family your location. Digitaly savvy? Send a tweet or Facebook update telling everyone know that you\'re ok.',
        }, {
          moment_type: :after,
          title: 'Stay tuned.',
          description: 'Listen to the radio for important information and instructions. Remember that aftershocks, which generally follow large quakes, can be large enough to cause damage in their own right.',
        }, {
          moment_type: :after,
          title: 'Check back here.',
          description: 'In an emergency, this site will go into Crisis Mode and will provide a live stream of official updates as well as crowdsourced reports.',
        }
      ]
    )
    if quick_guide.valid?
      puts "Quake Quick Guide created"
    else
      puts "Quake Quick Guide already exist"
    end

    plan = City.first.plan
    plan.quick_guide = quick_guide
    plan.save

    status = QuickGuide.create(
      title: 'Hurricane',
      tips_attributes: [
        {
          moment_type: :before,
          title: 'Know the Plan',
          description: 'Gather and <a href="/supplies">organize supplies</a> (essentials, useful, and personal items to help you weather the storm) and make a family communications plan for what to do in a hurricane.',
        }, {
          moment_type: :before,
          title: 'Learn your evacuation route.',
          description: 'Learn evacuation routes and how to find higher ground. Determine where you would go and how you would get there if you needed to evacuate.',
        }, {
          moment_type: :before,
          title: 'Secure your home.',
          description: 'Secure your home, close storm shutters, and secure outdoor objects or bring them indoors.',
        }, {
          moment_type: :during,
          title: 'Listen for Updates',
          description: 'Listen to a <a href="http://www.nws.noaa.gov/nwr/">NOAA Weather Radio</a> or local news for critical information from the National Weather Service. Be alert to changing weather conditions and follow official instructions.',
        }, {
          moment_type: :during,
          title: 'Turn off Utilities',
          description: '<a href="http://www.ready.gov/utility-shut-safety">Turn off utilities</a> and propane tanks if instructed to do so. Otherwise, turn the refrigerator to its coldest setting and keep its doors closed (here\'s how to <a href="http://www.ready.gov/food">keep food safe</a> during and after an emergency).',
        }, {
          moment_type: :during,
          title: 'Save a Supply of Water.',
          description: 'Ensure a <a href="http://www.ready.gov/managing-water">supply of water</a> for sanitary purposes such as cleaning and flushing toilets. Fill the bathtub and large containers with water.',
        }, {
          moment_type: :after,
          title: 'Find your family.',
          description: 'If you are separated from your family, use your <a href="#">family communications plan</a>, contact the American Red Cross (ARC) at 1-800-RED-CROSS/1-800-733-2767 or visit the ARC Safe and Well site: <a href="http://www.safeandwell.org/">www.safeandwell.org</a>.',
        }, {
          moment_type: :after,
          title: 'Inspect your home for damage.',
          description: 'Take pictures of damage (both of the building and its contents) for insurance purposes. If safety is a concern, have your residence inspected by a building inspector or structural engineer before entering.',
        }, {
          moment_type: :after,
          title: 'Practice Fire Safety.',
          description: 'Use battery-powered flashlights in the dark. DO NOT use candles, in order to prevent fires.',
        }, {
          moment_type: :after,
          title: 'Check back here.',
          description: 'In an emergency, this site will go into Crisis Mode and will provide a live stream of official updates as well as crowdsourced reports.',
        }
      ]
    )
    if status.valid?
      puts "Hurricane Quick Guide created"
    else
      puts "Hurricane Quick Guide already exist"
    end

    status = QuickGuide.create(
      title: 'Flood',
      tips_attributes: [
        {
          moment_type: :before,
          title: 'Elevate appliances.',
          description: 'Elevate the furnace, water heater, and electric panel in your home if you live in an area that has a high flood risk.',
        }, {
          moment_type: :before,
          title: 'Prevent drains from backing up.',
          description: 'Install "check valves" to prevent flood water from backing up into your house’s drains.',
        }, {
          moment_type: :before,
          title: 'Set up barriers.',
          description: 'Construct barriers to stop floodwater, and seal basement walls with waterproofing compounds.',
        }, {
          moment_type: :during,
          title: 'Turn off utilities.',
          description: '<a href="http://www.ready.gov/utility-shut-safety">Turn off utilities</a> at the main switches or valves if instructed to do so. Disconnect appliances. Do not touch electrical equipment if you are wet or standing in water.',
        }, {
          moment_type: :during,
          title: 'Do not walk through moving water.',
          description: 'Six inches of moving water can make you fall. If you must walk in water, walk where it isn’t moving. Check the firmness of the ground in front of you with a stick.',
        }, {
          moment_type: :during,
          title: 'Steer clear of flooded areas.',
          description: 'Do not drive into flooded areas. If a few inches of floodwater rise around your car, abandon the car for higher ground. If flood water rises into your car, get on the roof.',
        }, {
          moment_type: :after,
          title: 'Avoid moving water',
          description: 'Water only six inches deep can sweep you off your feet!',
        }, {
          moment_type: :after,
          title: 'Stay on firm ground.',
          description: '',
        }, {
          moment_type: :after,
          title: 'Avoid standing water of any kind.',
          description: 'Standing water may be electrically charged from underground or downed power lines.',
        }, {
          moment_type: :after,
          title: 'Check back here.',
          description: 'In an emergency, this site will go into Crisis Mode and will provide a live stream of official updates as well as crowdsourced reports.',
        }
      ]
    )
    if status.valid?
      puts "Flood Quick Guide created"
    else
      puts "Flood Quick Guide already exist"
    end

    status = QuickGuide.create(
      title: 'Tornado',
      tips_attributes: [
        {
          moment_type: :before,
          title: 'Get prepared.',
          description: 'Gather and <a href="/supplies">organize supplies</a> (essentials, useful, and personal items to help you weather the storm) and make a family communications plan for what to do in a tornado.',
        }, {
          moment_type: :before,
          title: 'Keep an eye on changing weather.',
          description: 'Be alert to changing weather conditions. Look for danger signs: Dark, greenish sky, often with large, dark low-lying clouds; Large hail; Loud roar, like a freight train. If you see storms or any danger signs, take shelter immediately!',
        }, {
          moment_type: :before,
          title: 'Stay tuned for tornado warnings.',
          description: 'Be aware of tornado warnings (e.g., radio and/or television).',
        }, {
          moment_type: :during,
          title: 'Seek shelter immediately.',
          description: 'Protect your head; most injuries associated with winds are from flying debris.',
        }, {
          moment_type: :during,
          title: 'Put on sturdy shoes.',
          description: '',
        }, {
          moment_type: :during,
          title: 'Do not open windows',
          description: '',
        }, {
          moment_type: :after,
          title: 'Protect yourself from debris.',
          description: 'Wear sturdy shoes or boots, long sleeves, and gloves when handling or walking on debris.',
        }, {
          moment_type: :after,
          title: 'Look out for broken glass.',
          description: 'Be aware of exposed nails and broken glass.',
        }, {
          moment_type: :after,
          title: 'Steer clear of power lines.',
          description: 'Do not touch downed power lines or objects in contact with downed lines. Report electrical hazards to the police and the utilities.',
        }, {
          moment_type: :after,
          title: 'Check back here.',
          description: 'In an emergency, this site will go into Crisis Mode and will provide a live stream of official updates as well as crowdsourced reports.',
        }
      ]
    )
    if status.valid?
      puts "Tornado Quick Guide created"
    else
      puts "Tornado Quick Guide already exist"
    end


  end

end
