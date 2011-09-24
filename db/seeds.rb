# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  ["Sarah Jane", "SarahJ",  "sarahjane@gmail.com"],
  ["Joe Gannon", "Joe G",   "joegannon@gmail.com"],
  ["Brent Pire", "Brent P", "brentpire@gmail.com"],
  ["Laura Ling", "Laura L", "lauraling@gmail.com"]
].each do |info|
  User.create(
    :name => info[0],
    :nickname => info[1],
    :email => info[2],
    :password => "123456",
    :password_confirmation => "123456"
  )
end

Lesson.create(
  :user => User.find_by_email("sarahjane@gmail.com"),
  :subject => "Algebra",
  :title => "Trying to solve one of these equations"
)
