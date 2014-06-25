# encoding: utf-8

admin_email = admin_password = nil

# admin_email = 'admin@example.com'
# admin_password = '123456'

if (!(admin_email && admin_password))
  puts 'Admin email and password must be provided'
else
  City.delete_all
  Plan.delete_all
  CityConnection.delete_all
  EmergencyStory.delete_all
  EmergencyData.delete_all
  About.delete_all
  Mode.delete_all
  QuickGuide.delete_all

  # Creating Mode
  status = Mode.create!(em_mode: false, title: "Emergency Title", text: "Emergency description")

  if status
    puts "Mode created"
  end

  plan = Plan.create!
  city = City.new name: 'city', abbreviation: 'city', moniker: 'city residents', possessive: "city's", color_cd: 0, brought_by: 'Your organization'
  city.plan = plan
  city.save(validate: false)

  city_connection = CityConnection.create!
  emergency_data = EmergencyData.create! map_url: 'http://google.org/crisismap/a/gmail.com/SF72?hl=en&embedded=true', citizen_timeline_id: '364391164582969346', partner_timeline_id: '390535611100053504', transportation_timeline_id: '370622485349146624', your_hashtag_timeline_id: '370622485349146624'
  about = About.create! brought_to_you_by: 'Your organization'

  EmergencyStory.create! name: 'Selected story', location: 'Example location', story: "Example story.", call_to_action_cd: 0, selected: true

  quick_guide = QuickGuide.create!(
    title: 'Example',
    tips_attributes: [
      {
        moment_type: :before,
        title: 'Example',
        description: 'Example',
      }, {
        moment_type: :before,
        title: 'Example',
        description: 'Example',
      }, {
        moment_type: :before,
        title: 'Save a Supply of Water.',
        description: 'Example',
      }, {
        moment_type: :after,
        title: 'Example',
        description: 'Example',
      }, {
        moment_type: :after,
        title: 'Example',
        description: 'Example',
      }, {
        moment_type: :after,
        title: 'Example',
        description: 'Example',
      }, {
        moment_type: :after,
        title: 'Example',
        description: 'Example',
      }
    ]
  )
  plan.quick_guide = quick_guide
  plan.save!
  if status.valid?
    puts "Example Quick Guide created"
  else
    puts "Example Quick Guide already exist"
  end

  if AdminUser.create(email: adminEmail, password: adminPassword)
    puts "Admin user created"
  else
    puts "Admin user already exist"
  end
end
