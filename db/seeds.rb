# encoding: utf-8

admin_email = admin_password = nil

admin_email = 'admin@example.com'
admin_password = 'password'

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
  analytic = Analytic.create!

  EmergencyStory.create! name: 'Selected story', location: 'Example location', story: "Example story.", call_to_action_cd: 0, selected: true

  quick_guide = QuickGuide.create!(
    title: 'Emergency Name',
    custom: true,
    tips_attributes: [
      {
        moment_type: :before,
        title: 'Main call to action',
        description: 'Additional details',
      }, {
        moment_type: :before,
        title: 'Main call to action',
        description: 'Additional details',
      }, {
        moment_type: :before,
        title: 'Main call to action',
        description: 'Additional details',
      }, {
        moment_type: :during,
        title: 'Main call to action',
        description: 'Additional details',
      }, {
        moment_type: :during,
        title: 'Main call to action',
        description: 'Additional details',
      }, {
        moment_type: :during,
        title: 'Main call to action',
        description: 'Additional details',
      }, {
        moment_type: :after,
        title: 'Main call to action',
        description: 'Additional details',
      }, {
        moment_type: :after,
        title: 'Main call to action',
        description: 'Additional details',
      }, {
        moment_type: :after,
        title: 'Main call to action',
        description: 'Additional details',
      }
    ]
  )
  plan.quick_guide = quick_guide
  plan.save!
  if status.valid?
    puts "Example/Other Quick Guide created"
  else
    puts "Example/Other Quick Guide already exist"
  end

  if AdminUser.create(email: admin_email, password: admin_password)
    puts "Admin user created"
  else
    puts "Admin user already exist"
  end
end
