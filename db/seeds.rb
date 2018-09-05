# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!( [
  { f_name: "Dave", 
    l_name: "Henderson",
    email: "dahenderson@csumb.edu", 
    password: "foobar" },
  { f_name: "Nick",
    l_name: "Nelson",
    email: "nnelson@csumb.edu ",
    password: "foobar" },
  { f_name: "Nate",
    l_name: "Mauga",
    email: "nmauga@csumb.edu ",
    password: "foobar" } ] )

#<Competition id: nil, owner_id: nil, name: nil, public: nil, start: nil, stop: nil, created_at: nil, updated_at: nil> 
Competition.create!( [
  {  name: "Dave's Competition",
     owner_id: 1,
     start: Time.now,
     stop:  Time.now + 2.months,
     public: false,
     :users => User.where(:f_name => ["Nick", "Nate"]) },
  {  name: "Nick's Competition",
     owner_id: 2,
     start: Time.now,
     stop:  Time.now + 2.months,
     public: true,
     :users => User.where(:f_name => ["Dave", "Nate"]) },
  {  name: "Nate's Competition",
     owner_id: 3,
     start: Time.now - 2.months,
     stop:  Time.now,
     public: true,
     :users => User.where(:f_name => ["Dave", "Nick", "Nate"]) } ] )

