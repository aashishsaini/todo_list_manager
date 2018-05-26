# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = ProjectAdmin.new(email: 'admin@yopmail.com', name: 'Admin user',password: 'Aashish@123')
admin.save
3.times do |x|
  puts "creating developer - #{x+1}"
  developer = Developer.new(email: "aashish_dev_#{x+1}@yopmail.com", password: 'Aashish@123', name: "Developer #{x+1}")
  project = developer.projects.build(name: "Project #{x+1}", description: 'Test Description')
  project.todos.build(name: "Todos #{x+1}", description: 'Todos Description', user: developer)
  project.todos.build(name: "Todos #{x+2}", description: 'Todos Description', user: developer, status: STATUS[:in_progress])
  project.todos.build(name: "Todos #{x+3}", description: 'Todos Description', user: developer, status: STATUS[:done])
  developer.save!
end

