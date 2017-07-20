namespace :blogtask do

  desc "This is test the rake file task"
  task :current_environment do
    puts "You are running rake task in #{Rails.env} environment"
  end

end
