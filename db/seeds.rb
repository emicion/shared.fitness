# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
User.create!( [
  { f_name: "Dave", 
    l_name: "Henderson",
    email: "dahenderson@csumb.edu", 
    password: "foobar", 
    admin: true},
  { f_name: "Nick",
    l_name: "Nelson",
    email: "nnelson@csumb.edu ",
    password: "foobar",
    admin: true},
  { f_name: "Nate",
    l_name: "Mauga",
    email: "nmauga@csumb.edu ",
    password: "foobar", 
    admin: true},
  { f_name: "Mr.",
    l_name: "Universe",
    email:  "admin@shared.fitness",
    password: "foobar"} ] )

User.all.each do |user|
  user.confirmed_at = DateTime.now
  user.save!
end
