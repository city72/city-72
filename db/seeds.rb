Story.delete_all
Kit.delete_all
Item.delete_all

admin_user = AdminUser.where(email: 'admin@sf72.org').first

AdminUser.create!(email: 'admin@sf72.org', password: '123456') unless admin_user

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
  item1_link: 'http://www.ideo.com/',
  item2_link: 'http://www.ideo.com/',
  item3_link: 'http://www.ideo.com/',
  item1_subtitle: 'Emergency Supplies',
  item2_subtitle: 'Meetup Plan',
  item3_subtitle: 'Out of State Contact',
  remote_item1_image_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg',
  remote_item2_image_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg',
  remote_item3_image_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374180520/nxdwy9drpyyedrhxe5za.jpg',
  remote_video_image_url: 'http://res.cloudinary.com/zauber-labs/image/upload/v1374703527/Hurracane_Sandy_cxijg8.jpg',
  items_images_display_type: StoryItemsDisplayTypes::OBJECT_PHOTOS,
  items_title: StoryItemsTitles::HOW_I_AM_PREPARED
}

Story.create!(story_data)

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
        StoryItemsDisplayTypes::FULL_BLEED_PHOTOS, StoryItemsTitles::WHAT_SHOULD_I_OFFER]
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

CitizenFeed.delete_all

CitizenFeed.create!(widget_id: "364391164582969346")

Mode.delete_all

Mode.create!(em_mode: false, title: '8.3 Earthquake on San Andreas Fault', text: 'An 8.3 earthquake struck the San Andreas fault on Thursday at 5:56 am.')