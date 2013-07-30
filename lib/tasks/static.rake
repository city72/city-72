namespace :static do
  desc "Generate static pages and save them in /public"
  require "rails/console/app"
  require "rails/console/helpers"
  extend Rails::ConsoleMethods
  task :create => :environment do
    urls_and_paths.each do |url, path|
      puts url
      r = app.get(url)
      if 200 == r
        File.open(Rails.public_path + path, "w") do |f|
          f.write(app.response.body.gsub("/assets", "assets").gsub("href='/", "href='"))
        end
      else
        $stderr.puts "Error generating static file #{path} #{r.inspect}"
      end
    end
  end
  task :clean => :environment do
    urls_and_paths.each do |url, path|
      puts url
      r = app.get(url)
      if 200 == r
        File.delete(Rails.public_path + path)
      else
        $stderr.puts "Error generating static file #{path} #{r.inspect}"
      end
    end
  end
  task :update_application_css => :environment do
    content = File.open(Rails.public_path + "/assets/application.css", "r").read
    File.open(Rails.public_path + "/assets/application.css", "w") do |f|
      f.write(content.gsub('url(/assets/', 'url(').gsub('url("/assets/', 'url("'))
    end
  end
  task :generate => :environment do
    Rake::Task['static:clean'].invoke
    Rake::Task['static:create'].invoke
  end
end
 
private
def urls_and_paths
  [
    ["/home", "/home"],
    ["/prepare", "/prepare"],
    ["/stories", "/stories"],
    ["/things", "/things"],
    ["/connect", "/connect"],
    ["/about", "/about"],
    ["/em/home", "/em/home"]
  ]
end