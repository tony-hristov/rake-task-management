desc "Says 'Hello, Rake'"
task :default do
  puts 'Hello, Rake.'
end

desc 'Example for custom rake task'
task :custom_task do
  puts 'This is an example for custom rake task'
end

namespace :db do
  desc 'Drop database'
  task :drop do
    puts 'Dropping database...'
  end
  desc 'Create database'
  task :create do
    puts 'Creating database...'
  end
  desc 'Seeds database'
  # task :seed => :clean do # hash syntax pre Ruby 1.9
  task seed: :create do
    puts 'Seeding database...'
  end
  desc 'Recreate database'
  task recreate: %i[drop create seed]
end

namespace :titles do
  desc 'Reading parameters from environment variables'
  task :set_title1 do
    title = ENV['TITLE'] || 'Blog'
    puts "Setting the first title: #{title}"
  end
  # Try `rake titles:set_title1 titles:set_title2 TITLE=Blog`
  # There is a collision between the two tasks fo reading the environment variables.
  desc 'Also reading parameters from environment variables'
  task :set_title2 do
    title = ENV['TITLE'] || 'Blog'
    puts "Setting the second title: #{title}"
  end
  # Try `rake titles:set_title1 titles:set_title2 "titles:set_title3[My other blog post, Tony Hristov]" TITLE=Blog`
  # Note: It does not default to the ENV variable.
  desc 'Also reading parameters from environment variables'
  task :set_title3, [:title, :author] do |_, args|
    args.with_defaults(:title => 'My Blog')
    puts "Setting title: #{args.title}, author=#{args.author}"
  end
end
