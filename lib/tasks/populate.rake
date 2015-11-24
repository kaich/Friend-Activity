namespace :db do
  desc "create many faker entities"
  task :populate => :environment do
   make_users
   make_notifications
   make_groups
   make_activities
   make_events

   puts "all task done!"
  end
end

def make_users
  10.times do |n|
    email = Faker::Internet.email
    name = Faker::Name.name
    password = "password"
    User.create!(:email => email , :password => password , :password_confirmation => password, :name => name)
  end 
  puts "create users"
end

def make_notifications
  User.all.each do |user|

    10.times do |n|
      title = Faker::Name.name
      content = Faker::Lorem.paragraph
      Notification.create!(:title => title , :content => content , :user_id => user.id)
    end

  end 
  puts "creatre notifications"
end

def make_groups
  User.all.each do |user|
    20.times do |n|
      name = Faker::Name.name
      content =  Faker::Lorem.paragraph 
      user.groups.build( :name => name , :intro => content ,:user_id => user.id)
      user.save! 
    end 
  end
  puts "create groups"
end

def make_activities
  User.all.each do |user|
    user.groups.each do |group|
      10.times do |n|
        name =  Faker::Name.name
        content = Faker::Lorem.paragraph 
        start_time = Faker::Time.between(DateTime.now - 100, DateTime.now)
        end_time = Faker::Time.between(DateTime.now - 50, DateTime.now)
        originator_id = user.id
        group_id = group.id

        Activity.create!(:name => name , :content => content ,:start_time => start_time ,:end_time => end_time , :originator_id => originator_id,:group_id => group_id)
      end 
    end
  end
  puts "create activities"
end

def make_events
  User.limit(2).each do |user|
    user.groups[0...2].each do |group|
      group.activities[0...2].each do |activity|
        19.times do |n|
          name =  Faker::Name.name
          content = Faker::Lorem.paragraph 
          start_time = Faker::Time.between(DateTime.now - 100, DateTime.now)
          end_time = Faker::Time.between(DateTime.now - 50, DateTime.now)
          activity_id = activity.id

          Event.create!(:name => name , :content => content ,:start_time => start_time ,:end_time => end_time, :activity_id => activity_id , :user_id => user.id)
        end 
      end 
    end
  end
  puts "create events"
end
